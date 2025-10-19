import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/providers/progress_provider.dart';
import '../../../l10n/app_localizations.dart';

/// Progress Summary Card
///
/// Displays overall statistics: lessons completed, average score,
/// total time spent, and rewards unlocked.
class ProgressSummaryCard extends ConsumerWidget {
  const ProgressSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final statisticsAsync = ref.watch(progressStatisticsProvider);

    return statisticsAsync.when(
      data: (stats) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary,
                theme.colorScheme.primaryContainer,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(
                    Icons.analytics,
                    color: theme.colorScheme.onPrimary,
                    size: 32,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    l10n.overallProgress,
                    style: theme.textTheme.headlineSmall?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Statistics Grid
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.5,
                children: [
                  _StatCard(
                    icon: Icons.book,
                    label: l10n.lessonsCompleted(stats.completedLessons),
                    value: '${stats.completedLessons}/${stats.totalLessons}',
                    color: theme.colorScheme.onPrimary,
                  ),
                  _StatCard(
                    icon: Icons.star,
                    label: l10n.averageScore,
                    value: '${stats.averageScore.toStringAsFixed(0)}%',
                    color: theme.colorScheme.onPrimary,
                  ),
                  _StatCard(
                    icon: Icons.timer,
                    label: l10n.totalTime,
                    value: _formatDuration(stats.totalLearningTime),
                    color: theme.colorScheme.onPrimary,
                  ),
                  _StatCard(
                    icon: Icons.emoji_events,
                    label: l10n.rewards,
                    value: '${stats.totalRewards}',
                    color: theme.colorScheme.onPrimary,
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Progress Bar
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.completionRate,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimary.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: stats.completionPercentage / 100,
                      minHeight: 12,
                      backgroundColor: theme.colorScheme.onPrimary.withOpacity(
                        0.3,
                      ),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        theme.colorScheme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${stats.completionPercentage.toStringAsFixed(1)}%',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      loading: () => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          height: 300,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      ),
      error: (error, stack) => Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline,
                color: theme.colorScheme.error,
                size: 48,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.errorLoadingProgress,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }
}

/// Individual stat card widget
class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: color.withOpacity(0.8), fontSize: 11),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
