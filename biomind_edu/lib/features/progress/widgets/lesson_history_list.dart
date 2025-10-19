import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../shared/providers/progress_provider.dart';
import '../../../l10n/app_localizations.dart';

/// Lesson History List
///
/// Shows recent lessons with completion status, dates, and scores.
class LessonHistoryList extends ConsumerWidget {
  const LessonHistoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final historyAsync = ref.watch(lessonHistoryProvider);

    return historyAsync.when(
      data: (history) {
        if (history.isEmpty) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.history_edu,
                      size: 64,
                      color: theme.colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.noLessonsYet,
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.outline,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            final item = history[index];
            final lesson = item.lesson;
            final progress = item.progress;

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 6.0,
              ),
              child: Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12),
                  leading: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: _getStatusColor(
                        progress.status,
                        theme,
                      ).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      _getStatusIcon(progress.status),
                      color: _getStatusColor(progress.status, theme),
                      size: 28,
                    ),
                  ),
                  title: Text(
                    _getLocalizedLessonTitle(lesson.titleKey, l10n),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        _getStatusText(progress.status, l10n),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: _getStatusColor(progress.status, theme),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      if (progress.lastAccessedAt != null)
                        Text(
                          DateFormat(
                            'MMM d, yyyy',
                          ).format(progress.lastAccessedAt!),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.outline,
                          ),
                        ),
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (progress.testScore != null) ...[
                        Text(
                          '${progress.testScore!.toStringAsFixed(0)}%',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            _calculateStars(progress.testScore!),
                            (index) =>
                                Icon(Icons.star, size: 16, color: Colors.amber),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }, childCount: history.length),
        );
      },
      loading: () => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stack) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.error_outline,
                  size: 64,
                  color: theme.colorScheme.error,
                ),
                const SizedBox(height: 16),
                Text(
                  l10n.errorLoadingHistory,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status, ThemeData theme) {
    switch (status) {
      case 'completed':
        return Colors.green;
      case 'in_progress':
        return Colors.orange;
      default:
        return theme.colorScheme.outline;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status) {
      case 'completed':
        return Icons.check_circle;
      case 'in_progress':
        return Icons.play_circle;
      default:
        return Icons.circle_outlined;
    }
  }

  String _getStatusText(String status, AppLocalizations l10n) {
    switch (status) {
      case 'completed':
        return l10n.completed;
      case 'in_progress':
        return l10n.inProgress;
      default:
        return l10n.notStarted;
    }
  }

  int _calculateStars(double score) {
    if (score >= 90) return 3;
    if (score >= 70) return 2;
    if (score >= 50) return 1;
    return 0;
  }

  String _getLocalizedLessonTitle(String titleKey, AppLocalizations l10n) {
    // Map titleKey to localized strings
    switch (titleKey) {
      case 'lessons.cellStructure':
        return l10n.lessonCellStructure;
      case 'lessons.plantLife':
        return l10n.lessonPlantLife;
      case 'lessons.humanHeart':
        return l10n.lessonHumanHeart;
      default:
        return titleKey.split('.').last; // Fallback to key
    }
  }
}
