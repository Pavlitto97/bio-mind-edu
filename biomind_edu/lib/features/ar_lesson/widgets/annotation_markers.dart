import 'package:flutter/material.dart';
import '../../../shared/models/lesson.dart';

/// Overlay widget that displays annotation markers on top of the AR/3D view
/// 
/// Features:
/// - Shows pulsing markers at annotation positions
/// - Converts 3D positions to 2D screen coordinates
/// - Provides tap detection for each annotation
/// - Kid-friendly touch targets (48x48 minimum)
class AnnotationMarkersOverlay extends StatelessWidget {
  final List<LessonAnnotation> annotations;
  final List<String> viewedAnnotationIds;
  final void Function(LessonAnnotation) onAnnotationTap;
  final Size screenSize;

  const AnnotationMarkersOverlay({
    Key? key,
    required this.annotations,
    required this.viewedAnnotationIds,
    required this.onAnnotationTap,
    required this.screenSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: annotations.map((annotation) {
        final position = _calculate2DPosition(annotation.position);
        final isViewed = viewedAnnotationIds.contains(annotation.id);
        
        return Positioned(
          left: position.dx - 24, // Center the marker
          top: position.dy - 24,
          child: AnnotationMarker(
            annotation: annotation,
            isViewed: isViewed,
            onTap: () => onAnnotationTap(annotation),
          ),
        );
      }).toList(),
    );
  }

  /// Convert 3D position [x, y, z] to 2D screen position
  /// 
  /// This is a simplified projection. In a real AR implementation,
  /// you would use the AR camera's projection matrix.
  Offset _calculate2DPosition(List<double> position3D) {
    // Simple orthographic projection for demonstration
    // In production, use AR camera's projection matrix
    final x = position3D[0];
    final y = position3D[1];
    // final z = position3D[2]; // Depth (currently unused)

    // Map 3D coordinates (-1.0 to 1.0) to screen coordinates
    final screenX = (x + 1.0) * screenSize.width * 0.5;
    final screenY = (1.0 - y) * screenSize.height * 0.5;

    return Offset(screenX, screenY);
  }
}

/// Individual annotation marker widget with pulsing animation
class AnnotationMarker extends StatefulWidget {
  final LessonAnnotation annotation;
  final bool isViewed;
  final VoidCallback onTap;

  const AnnotationMarker({
    Key? key,
    required this.annotation,
    required this.isViewed,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AnnotationMarker> createState() => _AnnotationMarkerState();
}

class _AnnotationMarkerState extends State<AnnotationMarker>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    
    // Only pulse if not viewed yet
    if (!widget.isViewed) {
      _pulseController = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      )..repeat(reverse: true);

      _pulseAnimation = Tween<double>(
        begin: 1.0,
        end: 1.3,
      ).animate(CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ));
    } else {
      _pulseController = AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      );
      _pulseAnimation = const AlwaysStoppedAnimation(1.0);
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _pulseAnimation.value,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.isViewed
                    ? theme.colorScheme.secondary.withOpacity(0.7)
                    : theme.colorScheme.primary.withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: widget.isViewed
                        ? theme.colorScheme.secondary.withOpacity(0.3)
                        : theme.colorScheme.primary.withOpacity(0.5),
                    blurRadius: widget.isViewed ? 8 : 16,
                    spreadRadius: widget.isViewed ? 0 : 2,
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  widget.isViewed ? Icons.check : Icons.touch_app,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
