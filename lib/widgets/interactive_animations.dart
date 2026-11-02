import 'dart:async';
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
