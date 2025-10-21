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

    return Opacity(
      opacity: isGhost ? 0.3 : 1.0,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
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
                size: 48,
                color: theme.colorScheme.primary,
              )
            else if (item.imagePath != null)
              Image.asset(
                item.imagePath!,
                width: 90,
                height: 90,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.image_not_supported,
                    size: 48,
                    color: Colors.grey,
                  );
                },
              )
            else
              Icon(
                Icons.drag_indicator,
                size: 48,
                color: theme.colorScheme.primary,
              ),

            const SizedBox(height: 4),

            // Label
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                _getItemLabel(),
                style: TextStyle(
                  fontSize: 11,
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
