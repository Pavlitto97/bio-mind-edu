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

    return Opacity(
      opacity: isGhost ? 0.3 : 1.0,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(size * 0.12),
          border: null,
          boxShadow: isDragging
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon or image
            if (item.iconName != null)
              Icon(
                _getIconData(item.iconName!),
                size: iconSize,
                color: theme.colorScheme.primary,
              )
            else if (item.imagePath != null)
              Image.asset(
                item.imagePath!,
                width: imageSize,
                height: imageSize,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.image_not_supported,
                    size: iconSize,
                    color: Colors.grey,
                  );
                },
              )
            else
              Icon(
                Icons.drag_indicator,
                size: iconSize,
                color: theme.colorScheme.primary,
              ),

            SizedBox(height: size * 0.04),

            // Label
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size * 0.04),
              child: Text(
                _getItemLabel(),
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
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
