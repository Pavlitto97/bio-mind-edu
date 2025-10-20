import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/lesson.dart';
import '../../../core/services/local_storage_service.dart';
import '../../rewards/domain/reward_service.dart';
import '../../../l10n/l10n_helpers.dart';
import '../../../shared/providers/newly_unlocked_provider.dart';

/// Enhanced animated lesson card with progress indicators
class AnimatedLessonCard extends ConsumerStatefulWidget {
  final String lessonId;
  final String titleKey;
  final String descriptionKey;
  final String? thumbnailPath;
  final LessonDifficulty difficulty;
  final LessonStatus status;
  final bool isLocked;
  final VoidCallback onTap;
  final int index;

  const AnimatedLessonCard({
    super.key,
    required this.lessonId,
    required this.titleKey,
    required this.descriptionKey,
    this.thumbnailPath,
    required this.difficulty,
    required this.status,
    required this.isLocked,
    required this.onTap,
    this.index = 0,
  });

  @override
  ConsumerState<AnimatedLessonCard> createState() => _AnimatedLessonCardState();
}

class _AnimatedLessonCardState extends ConsumerState<AnimatedLessonCard>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  
  late AnimationController _shimmerController;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400 + (widget.index * 100)),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Shimmer animation for newly unlocked lessons (smooth gradient flow)
    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _shimmerAnimation = Tween<double>(
      begin: -2.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _shimmerController,
      curve: Curves.easeInOut,
    ));

    // Start entrance animation
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final storage = LocalStorageService();
    final progress = storage.getProgress(widget.lessonId);
    final rewardService = ref.watch(rewardServiceProvider);
    final newlyUnlockedLessons = ref.watch(newlyUnlockedProvider);

    // Check if this lesson is newly unlocked
    final isNewlyUnlocked = newlyUnlockedLessons.contains(widget.lessonId);
    
    // Start shimmer animation if newly unlocked
    if (isNewlyUnlocked && !_shimmerController.isAnimating) {
      _shimmerController.repeat();
    } else if (!isNewlyUnlocked && _shimmerController.isAnimating) {
      _shimmerController.stop();
      _shimmerController.reset();
    }

    // Check if lesson has unlocked rewards (safely handle uninitialized service)
    bool hasReward = false;
    try {
      final lessonReward = rewardService.getRewardById(
        'reward_${widget.lessonId}_explorer',
      );
      hasReward = lessonReward?.isUnlocked ?? false;
    } catch (e) {
      // RewardService not initialized yet
      hasReward = false;
    }

    final isCompleted = progress?.status == 'completed';

    // Calculate progress percentage
    double progressValue = 0.0;
    if (progress != null) {
      if (progress.status == 'completed') {
        progressValue = 1.0;
      } else if (progress.status == 'in_progress') {
        // Calculate based on task and test completion
        int completedSteps = 0;
        if (progress.taskCompleted) completedSteps++;
        if (progress.testCompleted) completedSteps++;
        progressValue = completedSteps / 2.0;
      }
    }

    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Hero(
          tag: 'lesson_${widget.lessonId}',
          child: Card(
            elevation: widget.isLocked ? 1 : (isNewlyUnlocked ? 6 : 4),
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: isNewlyUnlocked
                  ? BorderSide(color: Colors.green, width: 2)
                  : isCompleted
                      ? BorderSide(color: Colors.green, width: 2)
                      : BorderSide.none,
            ),
            child: InkWell(
              onTap: widget.isLocked ? null : widget.onTap,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Thumbnail with overlay
                      Expanded(
                        flex: 3,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Background
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: _getGradientColors(),
                                ),
                              ),
                              child: widget.thumbnailPath != null
                                  ? Image.asset(
                                      widget.thumbnailPath!,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              _buildPlaceholder(),
                                    )
                                  : _buildPlaceholder(),
                            ),

                            // Shimmer overlay for newly unlocked lessons
                            if (isNewlyUnlocked && !widget.isLocked)
                              AnimatedBuilder(
                                animation: _shimmerAnimation,
                                builder: (context, child) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [
                                          0.0,
                                          (_shimmerAnimation.value - 0.3).clamp(0.0, 1.0),
                                          _shimmerAnimation.value.clamp(0.0, 1.0),
                                          (_shimmerAnimation.value + 0.3).clamp(0.0, 1.0),
                                          1.0,
                                        ],
                                        colors: [
                                          Colors.transparent,
                                          Colors.transparent,
                                          Colors.green.withOpacity(0.3),
                                          Colors.transparent,
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),

                            // Locked overlay
                            if (widget.isLocked)
                              Container(
                                color: Colors.black54,
                                child: const Center(
                                  child: Icon(
                                    Icons.lock,
                                    size: 48,
                                    color: Colors.white70,
                                  ),
                                ),
                              ),

                            // NEW! Badge for newly unlocked lessons
                            if (isNewlyUnlocked && !widget.isLocked)
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.5),
                                        blurRadius: 8,
                                        spreadRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.new_releases,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'NEW!',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            // Completion badge
                            if (isCompleted && !widget.isLocked && !isNewlyUnlocked)
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),

                            // Reward badge
                            if (hasReward && !widget.isLocked)
                              Positioned(
                                top: 8,
                                left: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.emoji_events,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),

                      // Info section
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: theme.cardColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title
                              Text(
                                _getLocalizedTitle(),
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: widget.isLocked
                                      ? Colors.grey
                                      : theme.textTheme.titleMedium?.color,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(height: 4),

                              // Description
                              Text(
                                _getLocalizedDescription(),
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: widget.isLocked
                                      ? Colors.grey
                                      : theme.textTheme.bodySmall?.color,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const Spacer(),

                              // Bottom row: difficulty + progress
                              Row(
                                children: [
                                  _buildDifficultyChip(context),
                                  const SizedBox(width: 8),
                                  if (progressValue > 0)
                                    Expanded(
                                      child: _buildProgressBar(progressValue),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Color> _getGradientColors() {
    switch (widget.difficulty) {
      case LessonDifficulty.beginner:
        return [Colors.green.shade200, Colors.green.shade400];
      case LessonDifficulty.intermediate:
        return [Colors.orange.shade200, Colors.orange.shade400];
    }
  }

  String _getLocalizedTitle() {
    return localizeKey(context, widget.titleKey);
  }

  String _getLocalizedDescription() {
    return localizeKey(context, widget.descriptionKey);
  }

  Widget _buildPlaceholder() {
    return Center(
      child: Icon(
        Icons.science_outlined,
        size: 64,
        color: Colors.white.withOpacity(0.7),
      ),
    );
  }

  Widget _buildDifficultyChip(BuildContext context) {
    Color color;
    IconData icon;
    String label;

    switch (widget.difficulty) {
      case LessonDifficulty.beginner:
        color = Colors.green;
        icon = Icons.sentiment_satisfied;
        label = '★☆☆';
        break;
      case LessonDifficulty.intermediate:
        color = Colors.orange;
        icon = Icons.sentiment_neutral;
        label = '★★☆';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(double progress) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: Colors.grey.shade300,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${(progress * 100).toInt()}%',
          style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
