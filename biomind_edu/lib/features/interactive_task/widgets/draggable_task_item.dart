import 'package:flutter/material.dart';
import '../../../shared/models/interactive_task.dart';

/// Draggable Task Item Widget
///
/// Represents a draggable item in the interactive task
/// Provides visual feedback during drag and drop interaction
class DraggableTaskItem extends StatelessWidget {
  final TaskItem item;
  final bool isCorrect;
  final bool isIncorrect;
  final double size;

  const DraggableTaskItem({
    super.key,
    required this.item,
    this.isCorrect = false,
    this.isIncorrect = false,
    this.size = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      data: item.id,
      feedback: _buildItemWidget(context, isDragging: true),
      childWhenDragging: _buildItemWidget(context, isGhost: true),
      child: _buildItemWidget(context),
    );
  }

  Widget _buildItemWidget(
    BuildContext context, {
    bool isDragging = false,
    bool isGhost = false,
  }) {
    final theme = Theme.of(context);
    final imageSize = size * 0.85;
    final iconSize = size * 0.45;
    final fontSize = (size * 0.11).clamp(9.0, 13.0);

    // Parse color from hex string if provided
    Color itemColor = theme.colorScheme.primary;
    if (item.color != null && item.color!.startsWith('#')) {
      try {
        final colorString = item.color!.replaceFirst('#', '');
        itemColor = Color(int.parse('FF$colorString', radix: 16));
      } catch (e) {
        // Use default if parsing fails
      }
    }

    return Opacity(
      opacity: isGhost ? 0.3 : 1.0,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          // Use a visible background with gradient
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              itemColor.withOpacity(0.8),
              itemColor.withOpacity(0.6),
            ],
          ),
          borderRadius: BorderRadius.circular(size * 0.12),
          border: Border.all(
            color: Colors.white.withOpacity(0.8),
            width: 3,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDragging ? 0.4 : 0.2),
              blurRadius: isDragging ? 16 : 8,
              offset: Offset(0, isDragging ? 8 : 4),
              spreadRadius: isDragging ? 2 : 0,
            ),
            // Inner highlight
            BoxShadow(
              color: Colors.white.withOpacity(0.3),
              blurRadius: 6,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon or image
            if (item.iconName != null)
              Icon(
                _getIconData(item.iconName!),
                size: iconSize,
                color: Colors.white,
              )
            else if (item.imagePath != null)
              Container(
                padding: EdgeInsets.all(size * 0.05),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(size * 0.08),
                ),
                child: Image.asset(
                  item.imagePath!,
                  width: imageSize * 0.7,
                  height: imageSize * 0.7,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.image_not_supported,
                      size: iconSize,
                      color: Colors.white70,
                    );
                  },
                ),
              )
            else
              Icon(
                Icons.drag_indicator,
                size: iconSize,
                color: Colors.white,
              ),

            SizedBox(height: size * 0.04),

            // Label
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: size * 0.06,
                vertical: size * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(size * 0.06),
              ),
              child: Text(
                _getItemLabel(),
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(1, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getItemLabel() {
    // TODO: Implement localization
    return item.labelKey.split('.').last.replaceAll('_', ' ').toUpperCase();
  }

  IconData _getIconData(String iconName) {
    // Map common icon names to IconData
    final iconMap = {
      'science': Icons.science,
      'biotech': Icons.biotech,
      'eco': Icons.eco,
      'favorite': Icons.favorite,
      'local_hospital': Icons.local_hospital,
      'water_drop': Icons.water_drop,
      'circle': Icons.circle,
      'square': Icons.square,
    };

    return iconMap[iconName] ?? Icons.help_outline;
  }
}
