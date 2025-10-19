import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/reward_model.dart';
import '../domain/reward_service.dart';
import '../widgets/reward_grid_item.dart';

/// Rewards collection page showing all unlocked and locked rewards
class RewardsPage extends ConsumerWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allRewards = ref.watch(allRewardsProvider);
    final userProfile = ref.watch(userProfileProvider);

    final unlockedCount = allRewards.where((r) => r.isUnlocked).length;
    final totalCount = allRewards.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Rewards'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Progress Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColor.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Rewards Collected',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildStatCard(
                      context,
                      icon: Icons.emoji_events,
                      label: 'Unlocked',
                      value: '$unlockedCount / $totalCount',
                    ),
                    const SizedBox(width: 16),
                    _buildStatCard(
                      context,
                      icon: Icons.star,
                      label: 'Total Stars',
                      value: '${userProfile?.totalStarsEarned ?? 0}',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: totalCount > 0 ? unlockedCount / totalCount : 0,
                    minHeight: 12,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${((unlockedCount / totalCount) * 100).toStringAsFixed(0)}% Complete',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),

          // Rewards Grid
          Expanded(
            child: allRewards.isEmpty
                ? _buildEmptyState(context)
                : Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.85,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                          ),
                      itemCount: allRewards.length,
                      itemBuilder: (context, index) {
                        final reward = allRewards[index];
                        return RewardGridItem(
                          reward: reward,
                          onTap: () => _showRewardDetails(context, reward),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              Text(
                value,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.emoji_events_outlined,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            'No Rewards Yet',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 8),
          Text(
            'Complete lessons to unlock rewards!',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  void _showRewardDetails(BuildContext context, Reward reward) {
    if (!reward.isUnlocked) return;

    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.emoji_events,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 16),
            Text(
              reward.name,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              reward.description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (reward.unlockedAt != null) ...[
              const SizedBox(height: 16),
              Text(
                'Unlocked on ${_formatDate(reward.unlockedAt!)}',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
