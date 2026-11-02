import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
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
