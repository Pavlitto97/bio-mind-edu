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

  const DraggableTaskItem({
    super.key,
    required this.item,
    this.isCorrect = false,
    this.isIncorrect = false,
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

    Color backgroundColor;
    Color borderColor;

    if (isCorrect) {
      backgroundColor = Colors.green[100]!;
      borderColor = Colors.green[600]!;
    } else if (isIncorrect) {
      backgroundColor = Colors.red[100]!;
      borderColor = Colors.red[600]!;
    } else {
      backgroundColor = theme.colorScheme.surface;
      borderColor = theme.colorScheme.primary;
    }

    return Opacity(
      opacity: isGhost ? 0.3 : 1.0,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 3),
          borderRadius: BorderRadius.circular(12),
          boxShadow: isDragging
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon or image
            if (item.iconName != null)
              Icon(_getIconData(item.iconName!), size: 48, color: borderColor)
            else if (item.imagePath != null)
              Image.asset(
                item.imagePath!,
                width: 60,
                height: 60,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.image_not_supported,
                    size: 48,
                    color: Colors.grey,
                  );
                },
              )
            else
              Icon(Icons.drag_indicator, size: 48, color: borderColor),

            const SizedBox(height: 4),

            // Label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                _getItemLabel(),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: borderColor,
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
