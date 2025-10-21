import 'package:flutter/material.dart';
import '../../../shared/models/interactive_task.dart';

/// Drop Target Zone Widget
///
/// Represents a drop zone where items can be dropped
/// Provides visual feedback when items are dragged over
class DropTargetZone extends StatefulWidget {
  final TaskTarget target;
  final bool isOccupied;
  final void Function(String itemId) onAccept;

  const DropTargetZone({
    super.key,
    required this.target,
    required this.isOccupied,
    required this.onAccept,
  });

  @override
  State<DropTargetZone> createState() => _DropTargetZoneState();
}

class _DropTargetZoneState extends State<DropTargetZone> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = widget.target.size[0];
    final height = widget.target.size[1];
    final isCircle = widget.target.shape == 'circle';

    return DragTarget<String>(
      onWillAcceptWithDetails: (data) {
        setState(() {
          _isHovering = true;
        });
        return !widget.isOccupied;
      },
      onLeave: (data) {
        setState(() {
          _isHovering = false;
        });
      },
      onAcceptWithDetails: (details) {
        setState(() {
          _isHovering = false;
        });
        widget.onAccept(details.data);
      },
      builder: (context, candidateData, rejectedData) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: _getBackgroundColor(theme),
            border: Border.all(
              color: _getBorderColor(theme),
              width: _isHovering ? 4 : 2,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
            borderRadius: isCircle ? null : BorderRadius.circular(12),
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Background image (dark/grayscale when empty, colored when occupied)
                if (widget.target.imagePath != null)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: widget.isOccupied ? 1.0 : 0.7,
                    child: ColorFiltered(
                      colorFilter: widget.isOccupied
                          ? const ColorFilter.mode(
                              Colors.transparent,
                              BlendMode.multiply,
                            )
                          : ColorFilter.mode(
                              Colors.black.withOpacity(0.7),
                              BlendMode.saturation,
                            ),
                      child: Image.asset(
                        widget.target.imagePath!,
                        width: width * 0.8,
                        height: height * 0.8,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(
                            Icons.image_not_supported,
                            size: 48,
                            color: Colors.grey,
                          );
                        },
                      ),
                    ),
                  ),
                
                // Success aura/glow effect when occupied
                if (widget.isOccupied && widget.target.imagePath != null)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: isCircle ? null : BorderRadius.circular(12),
                        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withOpacity(0.6),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                          BoxShadow(
                            color: Colors.yellow.withOpacity(0.4),
                            blurRadius: 30,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                
                // Label (only when not occupied and no image)
                if (!widget.isOccupied && widget.target.imagePath == null)
                  _buildLabel(theme),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getBackgroundColor(ThemeData theme) {
    if (widget.isOccupied) {
      return Colors.green[50]!;
    } else if (_isHovering) {
      return theme.colorScheme.primaryContainer.withOpacity(0.5);
    } else {
      return theme.colorScheme.surface.withOpacity(0.3);
    }
  }

  Color _getBorderColor(ThemeData theme) {
    if (widget.isOccupied) {
      return Colors.green[600]!;
    } else if (_isHovering) {
      return theme.colorScheme.primary;
    } else {
      return theme.colorScheme.outline;
    }
  }

  Widget _buildLabel(ThemeData theme) {
    if (widget.target.labelKey == null || widget.target.labelKey!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        _getTargetLabel(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: theme.colorScheme.onSurface.withOpacity(0.6),
        ),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  String _getTargetLabel() {
    // TODO: Implement localization
    final key = widget.target.labelKey ?? '';
    return key.split('.').last.replaceAll('_', ' ').toUpperCase();
  }
}
