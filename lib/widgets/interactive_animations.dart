import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

/// Interactive card that lifts on hover, lights up its border,
/// and projects an ambient glow shadow.
class HoverLiftCard extends StatefulWidget {
  final Widget child;
  final double liftOffset;
  final Color? glowColor;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  const HoverLiftCard({
    super.key,
    required this.child,
    this.liftOffset = -7.0,
    this.glowColor,
    this.borderColor,
    this.borderRadius,
    this.onTap,
    this.padding,
    this.backgroundColor,
  });

  @override
  State<HoverLiftCard> createState() => _HoverLiftCardState();
}

class _HoverLiftCardState extends State<HoverLiftCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final activeGlow = widget.glowColor ?? AppColors.accentPrimary;
    final radius = widget.borderRadius ?? BorderRadius.circular(16);
    final border = widget.borderColor ?? activeGlow;

    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0.0, _isHovered ? widget.liftOffset : 0.0, 0.0),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? AppColors.bgCard,
            borderRadius: radius,
            border: Border.all(
              color: _isHovered ? border.withValues(alpha: 0.8) : AppColors.borderSubtle,
              width: _isHovered ? 1.5 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: _isHovered ? 0.6 : 0.35),
                blurRadius: _isHovered ? 28 : 16,
                offset: Offset(0, _isHovered ? 14 : 6),
              ),
              if (_isHovered)
                BoxShadow(
                  color: activeGlow.withValues(alpha: 0.22),
                  blurRadius: 32,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/// Smooth fade-in and slide-up entrance animation triggered on load.
class StaggeredEntrance extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset slideOffset;

  const StaggeredEntrance({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 650),
    this.slideOffset = const Offset(0, 24),
  });

  @override
  State<StaggeredEntrance> createState() => _StaggeredEntranceState();
}

class _StaggeredEntranceState extends State<StaggeredEntrance> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _translation;
  Timer? _delayTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _translation = Tween<Offset>(
      begin: widget.slideOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      _delayTimer = Timer(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _delayTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _opacity.value,
          child: Transform.translate(
            offset: _translation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}

/// Pulsing ambient glow for live indicators and badges.
class PulsingGlowDot extends StatefulWidget {
  final Color color;
  final double size;

  const PulsingGlowDot({
    super.key,
    this.color = AppColors.accentPrimary,
    this.size = 10,
  });

  @override
  State<PulsingGlowDot> createState() => _PulsingGlowDotState();
}

class _PulsingGlowDotState extends State<PulsingGlowDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        return Container(
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.color.withValues(alpha: 0.35 + (t * 0.45)),
                blurRadius: 6 + (t * 10),
                spreadRadius: t * 3.5,
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Section wrapper that highlights and animates when navigated to or activated.
class AnimatedSectionWrapper extends StatefulWidget {
  final Widget child;
  final bool isTargeted;

  const AnimatedSectionWrapper({
    super.key,
    required this.child,
    this.isTargeted = false,
  });

  @override
  State<AnimatedSectionWrapper> createState() => _AnimatedSectionWrapperState();
}

class _AnimatedSectionWrapperState extends State<AnimatedSectionWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _highlightController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _highlightController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _glowAnimation = CurvedAnimation(
      parent: _highlightController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedSectionWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isTargeted && !oldWidget.isTargeted) {
      _highlightController.forward(from: 0.0).then((_) {
        if (mounted) _highlightController.reverse();
      });
    }
  }

  @override
  void dispose() {
    _highlightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        final glowValue = _glowAnimation.value;
        return Container(
          decoration: BoxDecoration(
            boxShadow: glowValue > 0.05
                ? [
                    BoxShadow(
                      color: AppColors.accentPrimary.withValues(alpha: glowValue * 0.18),
                      blurRadius: 36 * glowValue,
                      spreadRadius: 2 * glowValue,
                    ),
                  ]
                : null,
          ),
          child: widget.child,
        );
      },
    );
  }
}

/// Cybernetic animated divider with a moving light beam traveling across the border.
class AnimatedBeamDivider extends StatefulWidget {
  final Color baseColor;
  final Color beamColor;

  const AnimatedBeamDivider({
    super.key,
    this.baseColor = AppColors.borderSubtle,
    this.beamColor = AppColors.accentPrimary,
  });

  @override
  State<AnimatedBeamDivider> createState() => _AnimatedBeamDividerState();
}

class _AnimatedBeamDividerState extends State<AnimatedBeamDivider> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        return Container(
          height: 1.5,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [
                0.0,
                (t - 0.15).clamp(0.0, 1.0),
                t.clamp(0.0, 1.0),
                (t + 0.15).clamp(0.0, 1.0),
                1.0,
              ],
              colors: [
                widget.baseColor,
                widget.baseColor,
                widget.beamColor.withValues(alpha: 0.9),
                widget.baseColor,
                widget.baseColor,
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Particle model for the dynamic tech constellation canvas.
class _Particle {
  double x;
  double y;
  double vx;
  double vy;
  double radius;
  Color color;
  double pulsePhase;

  _Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.color,
    required this.pulsePhase,
  });
}

/// Real-time 60fps tech constellation particle background.
class ParticleBackground extends StatefulWidget {
  final int particleCount;

  const ParticleBackground({
    super.key,
    this.particleCount = 50,
  });

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<_Particle> _particles = [];
  final Random _random = Random(42);
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
  }

  void _initParticles(Size size) {
    if (_initialized || size.width == 0 || size.height == 0) return;
    _initialized = true;

    final colors = [
      AppColors.accentPrimary.withValues(alpha: 0.85),
      AppColors.accentSky.withValues(alpha: 0.8),
      const Color(0xFFC084FC).withValues(alpha: 0.75),
      Colors.white.withValues(alpha: 0.6),
    ];

    for (int i = 0; i < widget.particleCount; i++) {
      _particles.add(
        _Particle(
          x: _random.nextDouble() * size.width,
          y: _random.nextDouble() * size.height,
          vx: (_random.nextDouble() - 0.5) * 0.45,
          vy: (_random.nextDouble() - 0.5) * 0.45,
          radius: 1.2 + (_random.nextDouble() * 2.2),
          color: colors[_random.nextInt(colors.length)],
          pulsePhase: _random.nextDouble() * 2 * pi,
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        _initParticles(size);

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: size,
              painter: _ParticlePainter(
                particles: _particles,
                size: size,
              ),
            );
          },
        );
      },
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final Size size;

  _ParticlePainter({
    required this.particles,
    required this.size,
  });

  @override
  void paint(Canvas canvas, Size canvasSize) {
    if (particles.isEmpty || canvasSize.width == 0 || canvasSize.height == 0) return;

    final linePaint = Paint()
      ..strokeWidth = 0.8
      ..isAntiAlias = true;

    final particlePaint = Paint()..isAntiAlias = true;

    // 1. Update positions and draw connecting lines
    for (int i = 0; i < particles.length; i++) {
      final p1 = particles[i];

      p1.x += p1.vx;
      p1.y += p1.vy;

      // Wrap boundaries
      if (p1.x < 0) p1.x = canvasSize.width;
      if (p1.x > canvasSize.width) p1.x = 0;
      if (p1.y < 0) p1.y = canvasSize.height;
      if (p1.y > canvasSize.height) p1.y = 0;

      // Draw links between nearby particles
      for (int j = i + 1; j < particles.length; j++) {
        final p2 = particles[j];
        final dx = p1.x - p2.x;
        final dy = p1.y - p2.y;
        final dist = sqrt(dx * dx + dy * dy);

        const maxDist = 110.0;
        if (dist < maxDist) {
          final alpha = (1.0 - (dist / maxDist)) * 0.22;
          linePaint.color = p1.color.withValues(alpha: alpha);
          canvas.drawLine(Offset(p1.x, p1.y), Offset(p2.x, p2.y), linePaint);
        }
      }
    }

    // 2. Draw particle nodes with soft bloom
    for (final p in particles) {
      particlePaint.color = p.color;
      canvas.drawCircle(Offset(p.x, p.y), p.radius, particlePaint);

      // Soft glow aura
      final glowPaint = Paint()
        ..color = p.color.withValues(alpha: 0.15)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
      canvas.drawCircle(Offset(p.x, p.y), p.radius * 2.2, glowPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}

/// Standardized cybernetic Step Badge for section headers.
class StepSectionBadge extends StatelessWidget {
  final String stepNumber;
  final String totalSteps;
  final String label;
  final IconData icon;

  const StepSectionBadge({
    super.key,
    required this.stepNumber,
    this.totalSteps = "08",
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.accentMuted,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.borderAccent),
        boxShadow: [
          BoxShadow(
            color: AppColors.accentPrimary.withValues(alpha: 0.12),
            blurRadius: 14,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
            decoration: BoxDecoration(
              color: AppColors.accentPrimary.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.accentPrimary.withValues(alpha: 0.4), width: 0.8),
            ),
            child: Text(
              "STEP $stepNumber / $totalSteps",
              style: GoogleFonts.jetBrainsMono(
                color: AppColors.accentPrimary,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(width: 9),
          Icon(icon, color: AppColors.accentPrimary, size: 14),
          const SizedBox(width: 7),
          Flexible(
            child: Text(
              label,
              style: GoogleFonts.jetBrainsMono(
                color: AppColors.textPrimary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.4,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _PipelineStep {
  final String number;
  final String title;
  final String subtitle;
  final String spec;
  final IconData icon;
  final Color color;

  const _PipelineStep({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.spec,
    required this.icon,
    required this.color,
  });
}

/// Cybernetic live step-by-step architecture flow with traveling energy pulse.
class StepArchitectureFlow extends StatefulWidget {
  const StepArchitectureFlow({super.key});

  @override
  State<StepArchitectureFlow> createState() => _StepArchitectureFlowState();
}

class _StepArchitectureFlowState extends State<StepArchitectureFlow> with SingleTickerProviderStateMixin {
  late AnimationController _pipelineController;
  int? _hoveredIndex;

  static const List<_PipelineStep> _steps = [
    _PipelineStep(
      number: "01",
      title: "Edge Ingestion & Telemetry",
      subtitle: "Flutter Web / Mobile & IoT Sensors",
      spec: "10k+ msgs/min • Low Latency",
      icon: Icons.devices_rounded,
      color: AppColors.accentPrimary,
    ),
    _PipelineStep(
      number: "02",
      title: "ASGI Ingestion Gateway",
      subtitle: "Uvicorn & SSL Reverse Proxy",
      spec: "Zero Drop • Non-blocking I/O",
      icon: Icons.security_rounded,
      color: AppColors.accentSky,
    ),
    _PipelineStep(
      number: "03",
      title: "AsyncIO Core Engine",
      subtitle: "FastAPI 3.11+ Microservices",
      spec: "<14ms P99 • Async Coroutines",
      icon: Icons.bolt_rounded,
      color: AppColors.accentEmerald,
    ),
    _PipelineStep(
      number: "04",
      title: "Persistence & Vector Store",
      subtitle: "PostgreSQL ACID + pgvector RAG",
      spec: "ACID Pool • 1,200 QPS Index",
      icon: Icons.storage_rounded,
      color: Color(0xFFC084FC),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pipelineController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    )..repeat();
  }

  @override
  void dispose() {
    _pipelineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pipelineController,
      builder: (context, _) {
        final t = _pipelineController.value;
        final activeIdx = (t * _steps.length).floor().clamp(0, _steps.length - 1);

        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1527).withValues(alpha: 0.9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.accentPrimary.withValues(alpha: 0.35),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 30,
                offset: const Offset(0, 14),
              ),
              BoxShadow(
                color: AppColors.accentPrimary.withValues(alpha: 0.08),
                blurRadius: 40,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Console Bar
              Row(
                children: [
                  Row(
                    children: [
                      Container(width: 9, height: 9, decoration: const BoxDecoration(color: Color(0xFFEF4444), shape: BoxShape.circle)),
                      const SizedBox(width: 6),
                      Container(width: 9, height: 9, decoration: const BoxDecoration(color: Color(0xFFF59E0B), shape: BoxShape.circle)),
                      const SizedBox(width: 6),
                      Container(width: 9, height: 9, decoration: const BoxDecoration(color: Color(0xFF10B981), shape: BoxShape.circle)),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      "EXECUTION PIPELINE // LIVE DATAFLOW",
                      style: GoogleFonts.jetBrainsMono(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.6,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.accentPrimary.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.accentPrimary.withValues(alpha: 0.4), width: 0.8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const PulsingGlowDot(size: 6, color: AppColors.accentPrimary),
                        const SizedBox(width: 5),
                        Text(
                          "STREAMING",
                          style: GoogleFonts.jetBrainsMono(
                            color: AppColors.accentPrimary,
                            fontSize: 9.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              // Steps Stack with Connected Vertical Beam
              ...List.generate(_steps.length, (index) {
                final step = _steps[index];
                final isCurrent = _hoveredIndex != null ? _hoveredIndex == index : activeIdx == index;
                final isLast = index == _steps.length - 1;

                return Column(
                  children: [
                    MouseRegion(
                      onEnter: (_) => setState(() => _hoveredIndex = index),
                      onExit: (_) => setState(() => _hoveredIndex = null),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        curve: Curves.easeOutCubic,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isCurrent
                              ? step.color.withValues(alpha: 0.10)
                              : const Color(0xFF0B1120).withValues(alpha: 0.6),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isCurrent
                                ? step.color.withValues(alpha: 0.85)
                                : AppColors.borderSubtle,
                            width: isCurrent ? 1.5 : 1.0,
                          ),
                          boxShadow: isCurrent
                              ? [
                                  BoxShadow(
                                    color: step.color.withValues(alpha: 0.22),
                                    blurRadius: 18,
                                    offset: const Offset(0, 4),
                                  ),
                                ]
                              : null,
                        ),
                        child: Row(
                          children: [
                            // Step Number & Icon Node
                            Container(
                              width: 38,
                              height: 38,
                              decoration: BoxDecoration(
                                color: isCurrent ? step.color.withValues(alpha: 0.25) : AppColors.bgCard,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: isCurrent ? step.color : AppColors.borderSubtle,
                                  width: 1.5,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  step.icon,
                                  size: 18,
                                  color: isCurrent ? step.color : AppColors.textMuted,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Step Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1.5),
                                        decoration: BoxDecoration(
                                          color: step.color.withValues(alpha: 0.18),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          "STEP ${step.number}",
                                          style: GoogleFonts.jetBrainsMono(
                                            color: step.color,
                                            fontSize: 9.5,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(
                                          step.title,
                                          style: GoogleFonts.plusJakartaSans(
                                            color: AppColors.textPrimary,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    step.subtitle,
                                    style: GoogleFonts.plusJakartaSans(
                                      color: AppColors.textSecondary,
                                      fontSize: 11.5,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    step.spec,
                                    style: GoogleFonts.jetBrainsMono(
                                      color: isCurrent ? step.color : AppColors.textMuted,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),

                            // State indicator
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                              decoration: BoxDecoration(
                                color: isCurrent ? step.color.withValues(alpha: 0.16) : Colors.transparent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (isCurrent) ...[
                                    PulsingGlowDot(size: 6, color: step.color),
                                    const SizedBox(width: 4),
                                  ],
                                  Text(
                                    isCurrent ? "ACTIVE" : "READY",
                                    style: GoogleFonts.jetBrainsMono(
                                      color: isCurrent ? step.color : AppColors.textMuted,
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (!isLast)
                      // Connecting Beam Line between steps
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          children: [
                            const SizedBox(width: 30),
                            Container(
                              width: 2,
                              height: 16,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    isCurrent ? step.color : AppColors.borderSubtle,
                                    activeIdx == index + 1 ? _steps[index + 1].color : AppColors.borderSubtle,
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Icon(
                              Icons.keyboard_double_arrow_down_rounded,
                              size: 13,
                              color: isCurrent ? step.color : AppColors.textMuted.withValues(alpha: 0.4),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              isCurrent ? "streaming data packets >>>" : "standby pipe",
                              style: GoogleFonts.jetBrainsMono(
                                color: isCurrent ? step.color.withValues(alpha: 0.8) : AppColors.textMuted.withValues(alpha: 0.3),
                                fontSize: 9,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

/// Attractive step-to-step animated prompt linking one section to the next.
class NextStepTransitionPrompt extends StatefulWidget {
  final String currentStep;
  final String currentTitle;
  final String nextStep;
  final String nextTitle;
  final VoidCallback onProceed;

  const NextStepTransitionPrompt({
    super.key,
    required this.currentStep,
    required this.currentTitle,
    required this.nextStep,
    required this.nextTitle,
    required this.onProceed,
  });

  @override
  State<NextStepTransitionPrompt> createState() => _NextStepTransitionPromptState();
}

class _NextStepTransitionPromptState extends State<NextStepTransitionPrompt> with SingleTickerProviderStateMixin {
  late AnimationController _beamController;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _beamController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _beamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onProceed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0.0, _isHovered ? -5.0 : 0.0, 0.0),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF0D1527).withValues(alpha: 0.95),
                const Color(0xFF0F1E36).withValues(alpha: 0.95),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? AppColors.accentPrimary
                  : AppColors.borderAccent,
              width: _isHovered ? 1.5 : 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.4),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
              if (_isHovered)
                BoxShadow(
                  color: AppColors.accentPrimary.withValues(alpha: 0.25),
                  blurRadius: 28,
                  spreadRadius: 2,
                ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isStacked = constraints.maxWidth < 680;

              if (isStacked) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildCurrentStepInfo(),
                    const SizedBox(height: 12),
                    Center(child: _buildAnimatedBeamIndicator(vertical: true)),
                    const SizedBox(height: 12),
                    _buildProceedButton(),
                  ],
                );
              }

              return Row(
                children: [
                  Expanded(child: _buildCurrentStepInfo()),
                  const SizedBox(width: 16),
                  _buildAnimatedBeamIndicator(vertical: false),
                  const SizedBox(width: 16),
                  _buildProceedButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStepInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.accentEmerald.withValues(alpha: 0.15),
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.accentEmerald.withValues(alpha: 0.4)),
          ),
          child: const Icon(Icons.check_circle_rounded, color: AppColors.accentEmerald, size: 16),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${widget.currentStep} // COMPLETED",
                style: GoogleFonts.jetBrainsMono(
                  color: AppColors.accentEmerald,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                widget.currentTitle,
                style: GoogleFonts.plusJakartaSans(
                  color: AppColors.textSecondary,
                  fontSize: 13.5,
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedBeamIndicator({required bool vertical}) {
    return AnimatedBuilder(
      animation: _beamController,
      builder: (context, child) {
        final t = _beamController.value;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(3, (i) {
            final offset = (t - (i * 0.25)) % 1.0;
            final alpha = (sin(offset * pi)).clamp(0.2, 1.0);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: Icon(
                vertical ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_right_rounded,
                size: 18,
                color: AppColors.accentPrimary.withValues(alpha: alpha),
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildProceedButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: _isHovered
            ? AppColors.accentPrimary
            : AppColors.accentPrimary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.accentPrimary, width: 1.2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              "PROCEED TO ${widget.nextStep}: ${widget.nextTitle}",
              style: GoogleFonts.jetBrainsMono(
                color: _isHovered ? AppColors.bgPrimary : AppColors.accentPrimary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.3,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.arrow_downward_rounded,
            size: 15,
            color: _isHovered ? AppColors.bgPrimary : AppColors.accentPrimary,
          ),
        ],
      ),
    );
  }
}

class _RailItem {
  final String keyName;
  final String stepNumber;
  final String title;
  final IconData icon;

  const _RailItem({
    required this.keyName,
    required this.stepNumber,
    required this.title,
    required this.icon,
  });
}

/// Floating desktop rail marking the user's journey from step to step.
class StepJourneyRail extends StatelessWidget {
  final String activeSectionKey;
  final ValueChanged<String> onNavigate;

  const StepJourneyRail({
    super.key,
    required this.activeSectionKey,
    required this.onNavigate,
  });

  static const List<_RailItem> _items = [
    _RailItem(keyName: 'hero', stepNumber: '01', title: 'Overview', icon: Icons.terminal_rounded),
    _RailItem(keyName: 'projects', stepNumber: '02', title: 'Case Studies', icon: Icons.layers_rounded),
    _RailItem(keyName: 'capabilities', stepNumber: '03', title: 'Capabilities', icon: Icons.account_tree_outlined),
    _RailItem(keyName: 'experience', stepNumber: '04', title: 'Experience', icon: Icons.work_outline_rounded),
    _RailItem(keyName: 'skills', stepNumber: '05', title: 'Competencies', icon: Icons.grid_view_rounded),
    _RailItem(keyName: 'principles', stepNumber: '06', title: 'Principles', icon: Icons.verified_outlined),
    _RailItem(keyName: 'about', stepNumber: '07', title: 'Bio & Education', icon: Icons.school_outlined),
    _RailItem(keyName: 'contact', stepNumber: '08', title: 'Direct Contact', icon: Icons.mail_outline_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF090E1A).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.borderSubtle, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(_items.length, (idx) {
          final item = _items[idx];
          final isActive = activeSectionKey == item.keyName;

          return Tooltip(
            message: "Step ${item.stepNumber}: ${item.title}",
            textStyle: GoogleFonts.jetBrainsMono(color: AppColors.textPrimary, fontSize: 11),
            decoration: BoxDecoration(
              color: const Color(0xFF0F172A),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.accentPrimary.withValues(alpha: 0.4)),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => onNavigate(item.keyName),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: isActive ? 34 : 26,
                  height: isActive ? 34 : 26,
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.accentPrimary : AppColors.bgCard,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActive ? AppColors.accentPrimary : AppColors.borderSubtle,
                      width: isActive ? 2 : 1,
                    ),
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: AppColors.accentPrimary.withValues(alpha: 0.4),
                              blurRadius: 10,
                              spreadRadius: 1.5,
                            ),
                          ]
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      item.stepNumber,
                      style: GoogleFonts.jetBrainsMono(
                        color: isActive ? AppColors.bgPrimary : AppColors.textMuted,
                        fontSize: isActive ? 11 : 9.5,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

