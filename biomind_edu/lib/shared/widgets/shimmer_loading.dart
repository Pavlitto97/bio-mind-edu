import 'package:flutter/material.dart';

/// Shimmer effect for loading states
class ShimmerLoading extends StatefulWidget {
  final Widget child;
  final bool isLoading;
  final Color? baseColor;
  final Color? highlightColor;

  const ShimmerLoading({
    super.key,
    required this.child,
    required this.isLoading,
    this.baseColor,
    this.highlightColor,
  });

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();

    _animation = Tween<double>(
      begin: -2.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    final baseColor =
        widget.baseColor ??
        Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlightColor =
        widget.highlightColor ??
        Theme.of(context).colorScheme.surfaceContainerHigh;

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [baseColor, highlightColor, baseColor],
              stops: [
                _animation.value - 0.5,
                _animation.value,
                _animation.value + 0.5,
              ].map((v) => v.clamp(0.0, 1.0)).toList(),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}

/// Skeleton card for loading states
class SkeletonCard extends StatelessWidget {
  final double height;
  final double? width;
  final BorderRadius? borderRadius;

  const SkeletonCard({
    super.key,
    required this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: borderRadius ?? BorderRadius.circular(12),
        ),
      ),
    );
  }
}

/// Skeleton text line for loading states
class SkeletonText extends StatelessWidget {
  final double width;
  final double height;

  const SkeletonText({super.key, required this.width, this.height = 16});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      isLoading: true,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}

/// Skeleton list item for loading states
class SkeletonListTile extends StatelessWidget {
  final bool hasLeading;
  final bool hasTrailing;
  final int subtitleLines;

  const SkeletonListTile({
    super.key,
    this.hasLeading = true,
    this.hasTrailing = false,
    this.subtitleLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasLeading) ...[
            const SkeletonCard(
              height: 48,
              width: 48,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            const SizedBox(width: 16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SkeletonText(width: 200, height: 18),
                const SizedBox(height: 8),
                ...List.generate(
                  subtitleLines,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: SkeletonText(
                      width: 150 - (index * 30.0),
                      height: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (hasTrailing) ...[
            const SizedBox(width: 16),
            const SkeletonCard(height: 32, width: 32),
          ],
        ],
      ),
    );
  }
}
