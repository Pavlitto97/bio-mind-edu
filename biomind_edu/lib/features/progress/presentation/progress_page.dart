import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/providers/progress_provider.dart';
import '../../../shared/widgets/animated_button.dart';
import '../../../core/routing/custom_page_routes.dart';
import '../../../l10n/app_localizations.dart';
import '../widgets/progress_summary_card.dart';
import '../widgets/lesson_history_list.dart';
import '../widgets/test_results_list.dart';
import '../../rewards/presentation/rewards_page.dart';

/// Parent Dashboard - Progress Overview
///
/// Shows comprehensive statistics about child's learning progress,
/// including completed lessons, test scores, and unlocked rewards.
/// Designed for parents/guardians to monitor their child's education.
class ProgressPage extends ConsumerWidget {
  const ProgressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: Text(
          l10n.progressTitle,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        backgroundColor: theme.colorScheme.primary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          tooltip: l10n.backToLessons,
        ),
        actions: [
          AnimatedIconButton(
            icon: Icons.emoji_events,
            onPressed: () {
              Navigator.of(context).push(
                ScalePageRoute<void>(builder: (context) => const RewardsPage()),
              );
            },
            tooltip: l10n.myRewards,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // Refresh all providers
          ref.invalidate(progressStatisticsProvider);
          ref.invalidate(lessonHistoryProvider);
          ref.invalidate(testResultsProvider);

          // Wait for data to reload
          await Future.wait([
            ref.read(progressStatisticsProvider.future),
            ref.read(lessonHistoryProvider.future),
            ref.read(testResultsProvider.future),
          ]);
        },
        child: CustomScrollView(
          slivers: [
            // Summary Statistics Card
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProgressSummaryCard(),
              ),
            ),

            // Section: Lesson History
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.history,
                      color: theme.colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.lessonHistory,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Lesson History List
            const LessonHistoryList(),

            // Section: Test Results
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.quiz,
                      color: theme.colorScheme.primary,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.testResults,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Test Results List
            const TestResultsList(),

            // Bottom spacing
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
