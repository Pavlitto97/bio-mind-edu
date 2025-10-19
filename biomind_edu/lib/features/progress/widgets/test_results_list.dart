import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../shared/providers/progress_provider.dart';
import '../../../l10n/app_localizations.dart';

/// Test Results List
///
/// Shows test scores with star ratings and completion dates.
class TestResultsList extends ConsumerWidget {
  const TestResultsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final resultsAsync = ref.watch(testResultsProvider);

    return resultsAsync.when(
      data: (results) {
        if (results.isEmpty) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.quiz_outlined,
                      size: 64,
                      color: theme.colorScheme.outline,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.noTestsYet,
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
            final result = results[index];

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
                      color: _getScoreColor(result.score).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        '${result.score.toStringAsFixed(0)}%',
                        style: TextStyle(
                          color: _getScoreColor(result.score),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    _getLocalizedLessonTitle(result.lessonTitle, l10n),
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          ...List.generate(
                            3,
                            (starIndex) => Icon(
                              starIndex < result.stars
                                  ? Icons.star
                                  : Icons.star_border,
                              size: 18,
                              color: starIndex < result.stars
                                  ? Colors.amber
                                  : theme.colorScheme.outline,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '(${result.attempts} ${result.attempts == 1 ? l10n.attempt : l10n.attempts})',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.outline,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('MMM d, yyyy').format(result.completedAt),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    _getScoreIcon(result.score),
                    color: _getScoreColor(result.score),
                    size: 32,
                  ),
                ),
              ),
            );
          }, childCount: results.length),
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
                  l10n.errorLoadingResults,
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

  Color _getScoreColor(double score) {
    if (score >= 90) return Colors.green;
    if (score >= 70) return Colors.blue;
    if (score >= 50) return Colors.orange;
    return Colors.red;
  }

  IconData _getScoreIcon(double score) {
    if (score >= 90) return Icons.emoji_events;
    if (score >= 70) return Icons.thumb_up;
    if (score >= 50) return Icons.thumbs_up_down;
    return Icons.refresh;
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
