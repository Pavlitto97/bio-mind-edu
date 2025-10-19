import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:biomind_edu/shared/providers/lessons_provider.dart';
import 'package:biomind_edu/shared/models/lesson.dart';

/// Home screen showing list of available lessons
class LessonsListPage extends ConsumerWidget {
  const LessonsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonsAsync = ref.watch(lessonsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BioMind EDU'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: lessonsAsync.when(
        data: (lessons) {
          if (lessons.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.science,
                    size: 100,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No lessons available yet',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Check back soon for exciting biology lessons!',
                    textAlign: TextAlign.center,
                  ),
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
              return LessonCard(
                lessonId: lesson.id,
                titleKey: lesson.titleKey,
                descriptionKey: lesson.descriptionKey,
                thumbnailPath: lesson.thumbnailPath,
                difficulty: lesson.difficulty,
                status: lesson.status,
                isLocked: lesson.isLocked,
                onTap: () {
                  // Navigate to AR lesson screen
                  Navigator.of(context).pushNamed(
                    '/ar-lesson',
                    arguments: lesson.id,
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                'Failed to load lessons',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Lesson card widget
class LessonCard extends StatelessWidget {
  final String lessonId;
  final String titleKey;
  final String descriptionKey;
  final String? thumbnailPath;
  final LessonDifficulty difficulty;
  final LessonStatus status;
  final bool isLocked;
  final VoidCallback onTap;

  const LessonCard({
    super.key,
    required this.lessonId,
    required this.titleKey,
    required this.descriptionKey,
    this.thumbnailPath,
    required this.difficulty,
    required this.status,
    required this.isLocked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: isLocked ? null : onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Thumbnail
            Expanded(
              flex: 3,
              child: Container(
                color: theme.colorScheme.primaryContainer,
                child: thumbnailPath != null
                    ? Image.asset(
                        thumbnailPath!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            _buildPlaceholder(),
                      )
                    : _buildPlaceholder(),
              ),
            ),
            // Info
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _getLocalizedTitle(),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getLocalizedDescription(),
                      style: theme.textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        _buildDifficultyChip(context),
                        const Spacer(),
                        if (isLocked)
                          const Icon(
                            Icons.lock,
                            size: 20,
                            color: Colors.grey,
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLocalizedTitle() {
    // TODO: Implement proper localization
    // For now, return the key as placeholder
    return titleKey.split('.').last.replaceAll('_', ' ').toUpperCase();
  }

  String _getLocalizedDescription() {
    // TODO: Implement proper localization
    return descriptionKey.split('.').last.replaceAll('_', ' ');
  }

  Widget _buildPlaceholder() {
    return const Center(
      child: Icon(
        Icons.science,
        size: 64,
        color: Colors.white70,
      ),
    );
  }

  Widget _buildDifficultyChip(BuildContext context) {
    Color color;
    IconData icon;
    String label;

    switch (difficulty) {
      case LessonDifficulty.beginner:
        color = Colors.green;
        icon = Icons.sentiment_satisfied;
        label = 'Beginner';
        break;
      case LessonDifficulty.intermediate:
        color = Colors.orange;
        icon = Icons.sentiment_neutral;
        label = 'Intermediate';
        break;
    }

    return Chip(
      avatar: Icon(icon, size: 16, color: color),
      label: Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
    );
  }
}
