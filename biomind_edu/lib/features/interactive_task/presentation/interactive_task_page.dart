import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/interactive_task.dart';
import '../../../shared/providers/progress_provider.dart';
import '../../../shared/providers/newly_unlocked_provider.dart';
import '../../../shared/providers/newly_unlocked_achievements_provider.dart';
import '../../../shared/providers/lessons_provider.dart';
import '../../../shared/data/sample_lesson_data.dart';
import '../../../core/services/local_storage_service.dart';
import '../../../core/services/audio_service.dart';
import '../../../features/rewards/domain/achievement_service.dart';
import '../../../features/rewards/domain/reward_service.dart';
import '../widgets/draggable_task_item.dart';
import '../widgets/drop_target_zone.dart';
import 'dart:async';
import 'dart:math';

/// Interactive Task Screen - Drag and Drop Task Implementation
///
/// Features:
/// - Drag and drop interaction for placing items on targets
/// - Real-time validation and feedback
/// - Visual/audio feedback for correct/incorrect answers
/// - Time limit support (optional)
/// - Completion tracking and progress saving
/// - Kid-friendly UI with animations
class InteractiveTaskPage extends ConsumerStatefulWidget {
  final String taskId;
  final String lessonId;

  const InteractiveTaskPage({
    super.key,
    required this.taskId,
    required this.lessonId,
  });

  @override
  ConsumerState<InteractiveTaskPage> createState() =>
      _InteractiveTaskPageState();
}

class _InteractiveTaskPageState extends ConsumerState<InteractiveTaskPage> {
  bool _isLoading = true;
  String? _errorMessage;
  InteractiveTask? _task;

  // User's current answers (itemId -> targetId)
  final Map<String, String> _userAnswers = {};

  // Items that have been correctly placed
  final Set<String> _correctItems = {};

  // Items that were incorrectly placed (for feedback animation)
  final Set<String> _incorrectItems = {};

  // Error tracking for achievements
  int _errorCount = 0;

  // Timer for task with time limit
  Timer? _timer;
  int _remainingSeconds = 0;

  // Start time for completion tracking
  DateTime? _startTime;

  // Randomized order for items and targets
  List<TaskItem> _shuffledItems = [];
  List<TaskTarget> _shuffledTargets = [];

  @override
  void initState() {
    super.initState();
    _loadTask();
  }

  Future<void> _loadTask() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // For now, create a mock task since getInteractiveTask returns null
      // TODO: Implement proper task loading when tasks are stored
      final task = _createMockTask();

      setState(() {
        _task = task;
        _isLoading = false;
        _startTime = DateTime.now();

        // Shuffle items and targets for random order
        _shuffledItems = List.from(task.items)..shuffle(Random());
        _shuffledTargets = List.from(task.targets)..shuffle(Random());

        // Start timer if task has time limit
        if (task.timeLimitSeconds != null) {
          _remainingSeconds = task.timeLimitSeconds!;
          _startTimer();
        }
      });

      // Play instruction audio
      _playInstructionAudio();
    } catch (e) {
      setState(() {
        _errorMessage = 'Error loading task: $e';
        _isLoading = false;
      });
    }
  }

  /// Create a mock interactive task for testing
  /// TODO: Remove this when proper task loading is implemented
  InteractiveTask _createMockTask() {
    // Return different tasks based on taskId
    if (widget.taskId == 'task_plant_life_cycle') {
      return const InteractiveTask(
        id: 'plant_life_cycle_drag_drop',
        titleKey: 'tasks.plant.drag_drop.title',
        instructionKey: 'tasks.plant.drag_drop.instruction',
        type: TaskType.dragDrop,
        items: [
          TaskItem(
            id: 'seed',
            labelKey: 'SEED',
            imagePath: 'assets/images/SEED.png',
            color: '#8B4513',
            initialPosition: [50, 500],
          ),
          TaskItem(
            id: 'sprout',
            labelKey: 'SPROUT',
            imagePath: 'assets/images/SPROUT.png',
            color: '#4CAF50', // Green
            initialPosition: [170, 500],
          ),
          TaskItem(
            id: 'growth',
            labelKey: 'GROWTH',
            imagePath: 'assets/images/GROWTH.png',
            color: '#2E7D32', // Dark Green
            initialPosition: [290, 500],
          ),
          TaskItem(
            id: 'bloom',
            labelKey: 'BLOOM',
            imagePath: 'assets/images/BLOOM.png',
            color: '#E91E63', // Pink
            initialPosition: [410, 500],
          ),
        ],
        targets: [
          TaskTarget(
            id: 'seed_zone',
            labelKey: 'Seed Stage',
            imagePath: 'assets/images/SEED.png',
            position: [50, 300],
            size: [100, 100],
            shape: 'circle',
          ),
          TaskTarget(
            id: 'sprout_zone',
            labelKey: 'Sprout Stage',
            imagePath: 'assets/images/SPROUT.png',
            position: [180, 300],
            size: [100, 100],
            shape: 'circle',
          ),
          TaskTarget(
            id: 'growth_zone',
            labelKey: 'Growth Stage',
            imagePath: 'assets/images/GROWTH.png',
            position: [310, 300],
            size: [100, 100],
            shape: 'circle',
          ),
          TaskTarget(
            id: 'bloom_zone',
            labelKey: 'Bloom Stage',
            imagePath: 'assets/images/BLOOM.png',
            position: [440, 300],
            size: [100, 100],
            shape: 'circle',
          ),
        ],
        correctMatches: {
          'seed': 'seed_zone',
          'sprout': 'sprout_zone',
          'growth': 'growth_zone',
          'bloom': 'bloom_zone',
        },
        minCorrectToPass: 3,
      );
    }

    // Heart Blood Flow Task
    if (widget.taskId == 'task_heart_blood_flow') {
      return const InteractiveTask(
        id: 'heart_blood_flow_drag_drop',
        titleKey: 'tasks.heart.drag_drop.title',
        instructionKey: 'tasks.heart.drag_drop.instruction',
        type: TaskType.dragDrop,
        items: [
          TaskItem(
            id: 'left_atrium',
            labelKey: 'LEFT ATRIUM',
            imagePath: 'assets/images/LEFT_ATRIUM.png',
            color: '#FF8C8C',
            initialPosition: [50, 500],
          ),
          TaskItem(
            id: 'left_ventricle',
            labelKey: 'LEFT VENTRICLE',
            imagePath: 'assets/images/LEFT_VENTRICLE.png',
            color: '#FF4444',
            initialPosition: [170, 500],
          ),
          TaskItem(
            id: 'right_atrium',
            labelKey: 'RIGHT ATRIUM',
            imagePath: 'assets/images/RIGHT_ATRIUM.png',
            color: '#9999FF',
            initialPosition: [290, 500],
          ),
          TaskItem(
            id: 'right_ventricle',
            labelKey: 'RIGHT VENTRICLE',
            imagePath: 'assets/images/RIGHT_VENTRICLE.png',
            color: '#6666FF',
            initialPosition: [410, 500],
          ),
        ],
        targets: [
          TaskTarget(
            id: 'left_atrium_zone',
            labelKey: 'Upper Left Chamber',
            imagePath: 'assets/images/LEFT_ATRIUM.png',
            position: [50, 300],
            size: [100, 100],
            shape: 'circle',
          ),
          TaskTarget(
            id: 'left_ventricle_zone',
            labelKey: 'Lower Left Chamber',
            imagePath: 'assets/images/LEFT_VENTRICLE.png',
            position: [180, 300],
            size: [100, 100],
            shape: 'circle',
          ),
          TaskTarget(
            id: 'right_atrium_zone',
            labelKey: 'Upper Right Chamber',
            imagePath: 'assets/images/RIGHT_ATRIUM.png',
            position: [310, 300],
            size: [100, 100],
            shape: 'circle',
          ),
          TaskTarget(
            id: 'right_ventricle_zone',
            labelKey: 'Lower Right Chamber',
            imagePath: 'assets/images/RIGHT_VENTRICLE.png',
            position: [440, 300],
            size: [100, 100],
            shape: 'circle',
          ),
        ],
        correctMatches: {
          'left_atrium': 'left_atrium_zone',
          'left_ventricle': 'left_ventricle_zone',
          'right_atrium': 'right_atrium_zone',
          'right_ventricle': 'right_ventricle_zone',
        },
        minCorrectToPass: 3,
      );
    }

    // Default: Cell task
    return const InteractiveTask(
      id: 'cell_drag_drop',
      titleKey: 'tasks.cell.drag_drop.title',
      instructionKey: 'tasks.cell.drag_drop.instruction',
      type: TaskType.dragDrop,
      items: [
        TaskItem(
          id: 'nucleus',
          labelKey: 'NUCLEUS',
          imagePath: 'assets/images/nucleus.png',
          color: '#FF5722',
          initialPosition: [50, 500],
        ),
        TaskItem(
          id: 'mitochondria',
          labelKey: 'MITOCHONDRIA',
          imagePath: 'assets/images/mitochondria.png',
          color: '#009688', // Teal
          initialPosition: [170, 500],
        ),
        TaskItem(
          id: 'membrane',
          labelKey: 'MEMBRANE',
          imagePath: 'assets/images/membrane.png',
          color: '#2196F3',
          initialPosition: [290, 500],
        ),
      ],
      targets: [
        TaskTarget(
          id: 'nucleus_zone',
          labelKey: 'CENTER',
          imagePath: 'assets/images/nucleus.png',
          position: [100, 150],
          size: [100, 100],
          shape: 'circle',
        ),
        TaskTarget(
          id: 'mitochondria_zone',
          labelKey: 'ENERGY',
          imagePath: 'assets/images/mitochondria.png',
          position: [220, 200],
          size: [100, 100],
          shape: 'rectangle',
        ),
        TaskTarget(
          id: 'membrane_zone',
          labelKey: 'OUTER LAYER',
          imagePath: 'assets/images/membrane.png',
          position: [100, 300],
          size: [200, 100],
          shape: 'rectangle',
        ),
      ],
      correctMatches: {
        'nucleus': 'nucleus_zone',
        'mitochondria': 'mitochondria_zone',
        'membrane': 'membrane_zone',
      },
      minCorrectToPass: 2,
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _remainingSeconds--;

        if (_remainingSeconds <= 0) {
          _timer?.cancel();
          _handleTimeOut();
        }
      });
    });
  }

  void _playInstructionAudio() {
    // TODO: Implement audio playback
    debugPrint('Playing instruction audio: ${_task?.instructionKey}');
  }

  void _handleItemDropped(String itemId, String targetId) {
    if (_task == null) return;

    setState(() {
      _userAnswers[itemId] = targetId;
      _incorrectItems.remove(itemId);
    });

    // Check if answer is correct
    final isCorrect = _task!.correctMatches[itemId] == targetId;

    if (isCorrect) {
      setState(() {
        _correctItems.add(itemId);
      });
      _playSuccessFeedback();

      // Check if all items are placed correctly
      if (_correctItems.length == _task!.items.length) {
        // Provide celebration haptic feedback for task completion
        HapticFeedback.heavyImpact();
        // Delay completion to allow user to see final placement
        Future.delayed(const Duration(milliseconds: 800), () {
          if (mounted) {
            _handleTaskComplete();
          }
        });
      }
    } else {
      setState(() {
        _incorrectItems.add(itemId);
        _errorCount++; // Track errors for achievements
      });
      _playErrorFeedback();

      // Show X icon briefly, then remove incorrect answer
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          setState(() {
            _userAnswers.remove(itemId);
            _incorrectItems.remove(itemId);
          });
        }
      });
    }
  }

  void _playSuccessFeedback() {
    // Play success audio
    debugPrint('Playing success audio');
    final audioService = AudioService();
    audioService.playSfx('success.mp3');

    // Provide success haptic feedback
    HapticFeedback.mediumImpact();
  }

  void _playErrorFeedback() {
    // Play error audio
    debugPrint('Playing error audio');
    final audioService = AudioService();
    audioService.playSfx('error.mp3');

    // Provide error haptic feedback
    HapticFeedback.vibrate();
  }

  void _handleTimeOut() {
    // Task time limit reached
    _showTimeOutDialog();
  }

  Future<void> _handleTaskComplete() async {
    _timer?.cancel();

    final timeTaken = DateTime.now().difference(_startTime!).inSeconds;

    // Create task result
    final result = TaskResult(
      taskId: widget.taskId,
      userAnswers: Map.from(_userAnswers),
      correctCount: _correctItems.length,
      totalCount: _task!.items.length,
      timeTakenSeconds: timeTaken,
      isPassed: _correctItems.length >= _task!.minCorrectToPass,
      completedAt: DateTime.now(),
    );

    // Save progress and unlock reward
    await _saveProgress(result);

    // Show completion dialog with achievement
    if (mounted) {
      _showCompletionDialog(result);
    }
  }

  Future<void> _saveProgress(TaskResult result) async {
    try {
      final progressService = ref.read(progressServiceProvider);
      final achievementService = ref.read(achievementServiceProvider);
      final rewardService = ref.read(rewardServiceProvider);

      // Calculate stars earned
      final starsEarned = _calculateStars(result);

      // Update lesson progress with task completion
      await progressService.updateLessonProgress(
        lessonId: widget.lessonId,
        taskCompleted: result.isPassed,
        timeSpentSeconds: result.timeTakenSeconds,
        attempts: 1,
      );

      // Add stars to user profile
      if (starsEarned > 0) {
        await rewardService.updateUserStats(starsEarned: starsEarned);
        debugPrint('⭐ Added $starsEarned stars to Total Stars');
      }

      // Refresh progress provider
      ref.read(progressNotifierProvider.notifier).refresh();

      // Check speed-based achievements
      final accuracyPercent = (result.correctCount / result.totalCount) * 100;
      final hasErrors = _errorCount > 0;

      final unlockedAchievements = await achievementService
          .checkSpeedAchievements(
            timeSpentSeconds: result.timeTakenSeconds,
            hasErrors: hasErrors,
            accuracyPercent: accuracyPercent,
          );

      // Check completion achievements
      final completionAchievements = await achievementService
          .checkCompletionAchievements();

      // Combine all newly unlocked achievements
      final allNewAchievements = [
        ...unlockedAchievements,
        ...completionAchievements,
      ];

      // Store newly unlocked achievements for UI display
      if (allNewAchievements.isNotEmpty) {
        ref
            .read(newlyUnlockedAchievementsProvider.notifier)
            .addAchievements(allNewAchievements);
      }

      debugPrint('✅ Task progress saved successfully');
      debugPrint('  Task ID: ${result.taskId}');
      debugPrint('  Correct: ${result.correctCount}/${result.totalCount}');
      debugPrint('  Time: ${result.timeTakenSeconds}s');
      debugPrint('  Errors: $_errorCount');
      debugPrint('  Accuracy: ${accuracyPercent.toStringAsFixed(1)}%');
      debugPrint('  Passed: ${result.isPassed}');
      debugPrint('  Stars: $starsEarned');
      debugPrint(
        '  New Achievements: ${allNewAchievements.map((a) => a.name).join(", ")}',
      );
    } catch (e) {
      debugPrint('❌ Error saving progress: $e');
    }
  }

  int _calculateStars(TaskResult result) {
    final scorePercentage = (result.correctCount / result.totalCount) * 100;

    if (scorePercentage >= 90) return 3;
    if (scorePercentage >= 70) return 2;
    if (scorePercentage >= 50) return 1;
    return 0;
  }

  void _showCompletionDialog(TaskResult result) {
    final stars = _calculateStars(result);
    final newAchievements = ref.read(newlyUnlockedAchievementsProvider);

    // Play victory music if passed
    if (result.isPassed) {
      final audioService = AudioService();
      audioService.playSfx('victory.mp3');
      debugPrint('🏆 Playing victory music');
    }

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          result.isPassed ? '🎉 Great Job!' : '😊 Good Try!',
          style: const TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'You got ${result.correctCount} out of ${result.totalCount} correct!',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Time: ${result.timeTakenSeconds}s',
                style: TextStyle(
                  fontSize: 16,
                  color: result.timeTakenSeconds <= 20
                      ? Colors.green
                      : result.timeTakenSeconds <= 30
                      ? Colors.orange
                      : Colors.grey,
                  fontWeight: result.timeTakenSeconds <= 20
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Icon(
                    index < stars ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                    size: 40,
                  );
                }),
              ),
              if (result.isPassed) ...[
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3F2FD), // Light Blue
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF2196F3),
                      width: 2,
                    ), // Blue
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.emoji_events,
                        color: Colors.amber,
                        size: 48,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '🏆 Task Complete!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2196F3), // Blue
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Next lesson unlocked!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              // Show new achievements
              if (newAchievements.isNotEmpty) ...[
                const SizedBox(height: 16),
                ...newAchievements.map(
                  (achievement) => Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFFF9C4), // Light Yellow
                          Color(0xFFFFF59D), // Yellow
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFFBC02D),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Text('🏆', style: TextStyle(fontSize: 32)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                achievement.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFF57F17), // Dark Yellow
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                achievement.description,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.brown.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        actions: [
          if (!result.isPassed)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _retryTask();
              },
              child: const Text('Try Again', style: TextStyle(fontSize: 18)),
            ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _navigateBack();
            },
            child: Text(
              result.isPassed ? 'Continue' : 'Go Back',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  void _showTimeOutDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text(
          '⏰ Time\'s Up!',
          style: TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        content: const Text(
          'Don\'t worry, you can try again!',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _retryTask();
            },
            child: const Text('Try Again', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }

  void _retryTask() {
    setState(() {
      _userAnswers.clear();
      _correctItems.clear();
      _incorrectItems.clear();
      _startTime = DateTime.now();

      // Re-shuffle items and targets
      if (_task != null) {
        _shuffledItems = List.from(_task!.items)..shuffle(Random());
        _shuffledTargets = List.from(_task!.targets)..shuffle(Random());
      }

      if (_task?.timeLimitSeconds != null) {
        _remainingSeconds = _task!.timeLimitSeconds!;
        _startTimer();
      }
    });
  }

  void _navigateBack() {
    // Clear newly unlocked achievements
    ref.read(newlyUnlockedAchievementsProvider.notifier).clear();

    // Mark next lesson as newly unlocked for highlighting
    _markNextLessonAsUnlocked();

    // Log current lesson progress to verify it was saved
    final storage = LocalStorageService();
    final progress = storage.getProgress(widget.lessonId);
    debugPrint('🔍 Checking progress before navigation:');
    debugPrint('  Lesson ID: ${widget.lessonId}');
    debugPrint('  Task Completed: ${progress?.taskCompleted}');
    debugPrint('  Status: ${progress?.status}');

    // Invalidate lessons provider to refresh unlock status
    ref.invalidate(lessonsProvider);

    // Return to the home screen (pop until we reach the lessons list)
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  void _markNextLessonAsUnlocked() {
    // Get all lessons
    final lessons = [
      SampleLessonData.cellLesson,
      SampleLessonData.plantLesson,
      SampleLessonData.heartLesson,
    ];

    // Find current lesson index
    final currentIndex = lessons.indexWhere((l) => l.id == widget.lessonId);

    // If there's a next lesson, mark it as newly unlocked
    if (currentIndex >= 0 && currentIndex < lessons.length - 1) {
      final nextLesson = lessons[currentIndex + 1];
      ref
          .read(newlyUnlockedProvider.notifier)
          .markAsNewlyUnlocked(nextLesson.id);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    // Don't stop background music - it should continue playing across all scenes
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return _buildLoadingState();
    }

    if (_errorMessage != null || _task == null) {
      return _buildErrorState();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            // Instruction text
            _buildInstructionBanner(),

            // Timer (if enabled)
            if (_task!.timeLimitSeconds != null) _buildTimer(),

            // Progress indicator
            _buildProgressIndicator(),

            // Task area
            Expanded(child: _buildTaskArea()),

            // Action buttons
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(_getTaskTitle()),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline),
          onPressed: _showHelpDialog,
          iconSize: 32,
        ),
      ],
    );
  }

  Widget _buildInstructionBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: Theme.of(context).colorScheme.primary,
            size: 32,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _getTaskInstruction(),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    final minutes = _remainingSeconds ~/ 60;
    final seconds = _remainingSeconds % 60;
    final isLowTime = _remainingSeconds <= 30;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: isLowTime ? Colors.red[100] : Colors.blue[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.timer,
            color: isLowTime ? Colors.red : Colors.blue,
            size: 24,
          ),
          const SizedBox(width: 8),
          Text(
            '$minutes:${seconds.toString().padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isLowTime ? Colors.red : Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final total = _task!.items.length;
    final correct = _correctItems.length;
    final progress = total > 0 ? correct / total : 0.0;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Progress:', style: Theme.of(context).textTheme.titleMedium),
              Text(
                '$correct / $total',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskArea() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        
        // Calculate item size based on screen width
        final itemSize = (screenWidth * 0.15).clamp(60.0, 100.0);
        final targetSize = (screenWidth * 0.18).clamp(70.0, 110.0);
        
        // Reserve space for buttons at bottom (increased to 80px)
        final buttonAreaHeight = 80.0;
        final topPadding = 20.0;
        final usableHeight = screenHeight - buttonAreaHeight - topPadding;
        
        return ClipRect(
          child: Stack(
            children: [
              // Drop target zones (using shuffled targets)
              ..._shuffledTargets.asMap().entries.map((entry) {
                final index = entry.key;
                final target = entry.value;
                
                // Calculate responsive positions
                final numTargets = _shuffledTargets.length;
                final spacing = screenWidth / (numTargets + 1);
                final targetX = (spacing * (index + 1) - targetSize / 2).clamp(5.0, screenWidth - targetSize - 5);
                final targetY = (topPadding + usableHeight * 0.15).clamp(topPadding, usableHeight * 0.3);
                
                return Positioned(
                  left: targetX,
                  top: targetY,
                  child: DropTargetZone(
                    target: target,
                    size: targetSize,
                    isOccupied: _userAnswers.values.contains(target.id),
                    onAccept: (itemId) => _handleItemDropped(itemId, target.id),
                  ),
                );
              }),

              // Draggable items (using shuffled items)
              ..._shuffledItems.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isCorrect = _correctItems.contains(item.id);
                final isIncorrect = _incorrectItems.contains(item.id);

                // If correctly placed, show item in the target zone
                if (isCorrect) {
                  final targetId = _userAnswers[item.id];
                  final targetIndex = _shuffledTargets.indexWhere((t) => t.id == targetId);
                  
                  if (targetIndex >= 0) {
                    final numTargets = _shuffledTargets.length;
                    final spacing = screenWidth / (numTargets + 1);
                    final targetX = (spacing * (targetIndex + 1) - targetSize / 2).clamp(5.0, screenWidth - targetSize - 5);
                    final targetY = (topPadding + usableHeight * 0.15).clamp(topPadding, usableHeight * 0.3);

                    return Positioned(
                      left: targetX,
                      top: targetY,
                      child: Opacity(
                        opacity: 0.9,
                        child: SizedBox(
                          width: targetSize,
                          height: targetSize,
                          child: DraggableTaskItem(
                            item: item,
                            size: itemSize,
                            isCorrect: isCorrect,
                            isIncorrect: false,
                          ),
                        ),
                      ),
                    );
                  }
                }

                // Show item at initial position (always visible unless correctly placed)
                if (!isCorrect) {
                  // Calculate responsive initial positions for draggable items
                  final numItems = _shuffledItems.length;
                  final spacing = screenWidth / (numItems + 1);
                  final itemX = (spacing * (index + 1) - itemSize / 2).clamp(5.0, screenWidth - itemSize - 5);
                  
                  // Position items in bottom area, well above buttons
                  final itemY = (usableHeight - itemSize - 10).clamp(
                    targetSize + 70,
                    usableHeight - itemSize - 10,
                  );
                  
                  return Positioned(
                    left: itemX,
                    top: itemY,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        DraggableTaskItem(
                          item: item,
                          size: itemSize,
                          isCorrect: false,
                          isIncorrect: isIncorrect,
                        ),
                        // Show red X icon if incorrectly placed
                        if (isIncorrect)
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0.0, end: 1.0),
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.elasticOut,
                            builder: (context, scale, child) {
                              return Transform.scale(
                                scale: scale,
                                child: Container(
                                  width: itemSize * 0.5,
                                  height: itemSize * 0.5,
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.95),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.red.withOpacity(0.6),
                                        blurRadius: 16,
                                        spreadRadius: 3,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: itemSize * 0.35,
                                    weight: 700,
                                  ),
                                ),
                              );
                            },
                          ),
                      ],
                    ),
                  );
                }

                return const SizedBox.shrink();
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final isSmallScreen = screenWidth < 400;
        
        return Padding(
          padding: EdgeInsets.all(isSmallScreen ? 8.0 : 16.0),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _showHintDialog,
                  icon: Icon(Icons.lightbulb_outline, size: isSmallScreen ? 18 : 24),
                  label: Text(
                    'Hint', 
                    style: TextStyle(fontSize: isSmallScreen ? 14 : 18),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: isSmallScreen ? 10 : 16,
                    ),
                  ),
                ),
              ),
              SizedBox(width: isSmallScreen ? 8 : 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: _retryTask,
                  icon: Icon(Icons.refresh, size: isSmallScreen ? 18 : 24),
                  label: Text(
                    'Reset', 
                    style: TextStyle(fontSize: isSmallScreen ? 14 : 18),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: isSmallScreen ? 10 : 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLoadingState() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 24),
            Text(
              'Loading Task...',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState() {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 24),
              Text(
                'Unable to Load Task',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                _errorMessage ?? 'Unknown error occurred',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _loadTask,
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getTaskTitle() {
    // Get lesson-specific title
    switch (widget.lessonId) {
      case 'cell':
        return 'Cell Structure';
      case 'plant':
        return 'Plant Life';
      case 'heart':
        return 'Human Heart';
      default:
        // Fallback: parse from titleKey
        return _task?.titleKey.split('.').last.replaceAll('_', ' ').toUpperCase() ??
            'Interactive Task';
    }
  }

  String _getTaskInstruction() {
    // TODO: Implement localization
    return 'Drag and drop the items to their correct locations!';
  }

  void _showHelpDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('How to Play', textAlign: TextAlign.center),
        content: const Text(
          '1. Look at the items at the bottom\n'
          '2. Drag each item to where it belongs\n'
          '3. If you get it right, it will stay!\n'
          '4. If not, try again!\n'
          '5. Complete all items to finish!',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it!'),
          ),
        ],
      ),
    );
  }

  void _showHintDialog() {
    // TODO: Play hint audio
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('💡 Hint', textAlign: TextAlign.center),
        content: const Text(
          'Think about what you learned in the AR lesson. Each part has a special place!',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Thanks!'),
          ),
        ],
      ),
    );
  }
}
