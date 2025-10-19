import 'package:flutter/material.dart';
import '../data/models/reward_model.dart';

/// Widget for displaying a single reward in the grid
class RewardGridItem extends StatelessWidget {
  final Reward reward;
  final VoidCallback? onTap;

  const RewardGridItem({super.key, required this.reward, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: reward.isUnlocked ? Colors.white : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: reward.isUnlocked
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: reward.isUnlocked
              ? [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Reward Icon/Image
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: reward.isUnlocked
                    ? _buildRewardIcon()
                    : _buildLockedIcon(),
              ),
            ),

            // Reward Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                reward.isUnlocked ? reward.name : '???',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: reward.isUnlocked
                      ? Colors.black87
                      : Colors.grey.shade600,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Category Badge
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getCategoryColor().withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  _getCategoryLabel(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: _getCategoryColor(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRewardIcon() {
    // Use category-specific icons as placeholders
    IconData iconData;
    switch (reward.category) {
      case RewardCategory.badge:
        iconData = Icons.military_tech;
        break;
      case RewardCategory.sticker:
        iconData = Icons.star;
        break;
      case RewardCategory.achievement:
        iconData = Icons.emoji_events;
        break;
      case RewardCategory.trophy:
        iconData = Icons.emoji_events_outlined;
        break;
    }

    return Icon(iconData, size: 64, color: _getCategoryColor());
  }

  Widget _buildLockedIcon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.lock, size: 48, color: Colors.grey.shade600),
    );
  }

  Color _getCategoryColor() {
    switch (reward.category) {
      case RewardCategory.badge:
        return Colors.blue;
      case RewardCategory.sticker:
        return Colors.amber;
      case RewardCategory.achievement:
        return Colors.purple;
      case RewardCategory.trophy:
        return Colors.orange;
    }
  }

  String _getCategoryLabel() {
    switch (reward.category) {
      case RewardCategory.badge:
        return 'Badge';
      case RewardCategory.sticker:
        return 'Sticker';
      case RewardCategory.achievement:
        return 'Achievement';
      case RewardCategory.trophy:
        return 'Trophy';
    }
  }
}
