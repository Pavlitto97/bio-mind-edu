import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:biomind_edu/core/theme/animation_constants.dart';

/// Animated button with scale effect and haptic feedback
class AnimatedButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double scaleFactor;
  final bool enableHaptic;
  final bool enabled;

  const AnimatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.borderRadius,
    this.scaleFactor = 0.95,
    this.enableHaptic = true,
    this.enabled = true,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AnimationConstants.buttonAnimation,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleFactor)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: AnimationConstants.buttonAnimationCurve,
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (widget.enabled && widget.onPressed != null) {
      _controller.forward();
    }
  }

  void _handleTapUp(TapUpDetails details) {
    if (widget.enabled && widget.onPressed != null) {
      _controller.reverse();
    }
  }

  void _handleTapCancel() {
    if (widget.enabled && widget.onPressed != null) {
      _controller.reverse();
    }
  }

  void _handleTap() {
    if (widget.enabled && widget.onPressed != null) {
      if (widget.enableHaptic) {
        HapticFeedback.lightImpact();
      }
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          color: widget.backgroundColor ?? Theme.of(context).primaryColor,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
          child: InkWell(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
            onTap: widget.enabled && widget.onPressed != null ? () {} : null,
            child: Padding(
              padding: widget.padding ?? const EdgeInsets.all(16),
              child: DefaultTextStyle(
                style: TextStyle(color: widget.foregroundColor ?? Colors.white),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Animated icon button with scale effect
class AnimatedIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final double size;
  final double scaleFactor;
  final bool enableHaptic;
  final String? tooltip;

  const AnimatedIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor,
    this.size = 24,
    this.scaleFactor = 0.9,
    this.enableHaptic = true,
    this.tooltip,
  });

  @override
  State<AnimatedIconButton> createState() => _AnimatedIconButtonState();
}

class _AnimatedIconButtonState extends State<AnimatedIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AnimationConstants.buttonAnimation,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.scaleFactor)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: AnimationConstants.buttonAnimationCurve,
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (widget.onPressed != null) {
      _controller.forward().then((_) => _controller.reverse());
      if (widget.enableHaptic) {
        HapticFeedback.lightImpact();
      }
      widget.onPressed!();
    }
  }

  @override
  Widget build(BuildContext context) {
    final button = GestureDetector(
      onTap: _handleTap,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Icon(widget.icon, size: widget.size, color: widget.iconColor),
      ),
    );

    if (widget.tooltip != null) {
      return Tooltip(message: widget.tooltip!, child: button);
    }

    return button;
  }
}
