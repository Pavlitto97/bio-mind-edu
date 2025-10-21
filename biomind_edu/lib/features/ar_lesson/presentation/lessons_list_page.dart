import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/providers/lessons_provider.dart';
import '../../../shared/widgets/shimmer_loading.dart';
import '../../../shared/widgets/animated_button.dart';
import '../../../core/routing/custom_page_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/animated_lesson_card.dart';
import '../../progress/presentation/progress_page.dart';
import '../../rewards/presentation/rewards_page.dart';

/// Home screen showing list of available lessons with gradient AppBar
class LessonsListPage extends ConsumerWidget {
  const LessonsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonsAsync = ref.watch(lessonsProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.primary, AppColors.primaryDark],
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Image.asset(
              'assets/images/app_logo_header.png',
              height: 40,
              fit: BoxFit.contain,
            ),
            centerTitle: true,
            actions: [
              AnimatedIconButton(
                icon: Icons.analytics,
                onPressed: () {
                  Navigator.of(context).push(
                    FadePageRoute<void>(
                      builder: (context) => const ProgressPage(),
                    ),
                  );
                },
                tooltip: l10n.progressTitle,
              ),
              const SizedBox(width: 8),
              AnimatedIconButton(
                icon: Icons.emoji_events,
                onPressed: () {
                  Navigator.of(context).push(
                    ScalePageRoute<void>(
                      builder: (context) => const RewardsPage(),
                    ),
                  );
                },
                tooltip: l10n.myRewards,
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
      body: lessonsAsync.when(
        data: (lessons) {
          if (lessons.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.science, size: 100, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  Text(
                    l10n.noLessonsAvailable,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  Text(l10n.checkBackSoon, textAlign: TextAlign.center),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];
              return AnimatedLessonCard(
                lessonId: lesson.id,
                titleKey: lesson.titleKey,
                descriptionKey: lesson.descriptionKey,
                thumbnailPath: lesson.thumbnailPath,
                difficulty: lesson.difficulty,
                status: lesson.status,
                isLocked: lesson.isLocked,
                index: index,
                onTap: () {
                  // Navigate to AR lesson screen
                  Navigator.of(
                    context,
                  ).pushNamed('/ar-lesson', arguments: lesson.id);
                },
              );
            },
          );
        },
        loading: () => GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return const SkeletonCard(height: 200);
          },
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                l10n.failedToLoadLessons,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(error.toString(), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
