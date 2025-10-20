import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/interactive_task.dart';
import '../../../shared/providers/progress_provider.dart';
import '../../../shared/providers/newly_unlocked_provider.dart';
import '../../../shared/providers/lessons_provider.dart';
import '../../../shared/data/sample_lesson_data.dart';
import '../../../core/services/local_storage_service.dart';
import '../widgets/draggable_task_item.dart';
import '../widgets/drop_target_zone.dart';
import 'dart:async';

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

  // Timer for task with time limit
  Timer? _timer;
  int _remainingSeconds = 0;

  // Start time for completion tracking
  DateTime? _startTime;

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
    return const InteractiveTask(
      id: 'cell_drag_drop',
      titleKey: 'tasks.cell.drag_drop.title',
      instructionKey: 'tasks.cell.drag_drop.instruction',
      type: TaskType.dragDrop,
      items: [
        TaskItem(
          id: 'nucleus',
          labelKey: 'tasks.cell.items.nucleus',
          iconName: 'circle',
          color: '#FF5722',
          initialPosition: [50, 500],
        ),
        TaskItem(
          id: 'mitochondria',
          labelKey: 'tasks.cell.items.mitochondria',
          iconName: 'biotech',
          color: '#4CAF50',
          initialPosition: [170, 500],
        ),
        TaskItem(
          id: 'membrane',
          labelKey: 'tasks.cell.items.membrane',
          iconName: 'circle',
          color: '#2196F3',
          initialPosition: [290, 500],
        ),
      ],
      targets: [
        TaskTarget(
          id: 'nucleus_zone',
          labelKey: 'Nucleus',
          position: [100, 150],
          size: [100, 100],
          shape: 'circle',
        ),
        TaskTarget(
          id: 'mitochondria_zone',
          labelKey: 'Mitochondria',
          position: [220, 200],
          size: [100, 100],
          shape: 'rectangle',
        ),
        TaskTarget(
          id: 'membrane_zone',
          labelKey: 'Membrane',
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
      });
      _playErrorFeedback();

      // Remove incorrect answer after brief delay
      Future.delayed(const Duration(milliseconds: 1500), () {
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
    // ref.read(audioNotifierProvider.notifier).playSfx('success.mp3');

    // Provide success haptic feedback
    HapticFeedback.mediumImpact();
  }

  void _playErrorFeedback() {
    // Play error audio
    debugPrint('Playing error audio');
    // ref.read(audioNotifierProvider.notifier).playSfx('error.mp3');

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

      // Update lesson progress with task completion
      await progressService.updateLessonProgress(
        lessonId: widget.lessonId,
        taskCompleted: result.isPassed,
        timeSpentSeconds: result.timeTakenSeconds,
        attempts: 1,
      );

      debugPrint('✅ Task progress saved successfully');
      debugPrint('  Task ID: ${result.taskId}');
      debugPrint('  Correct: ${result.correctCount}/${result.totalCount}');
      debugPrint('  Time: ${result.timeTakenSeconds}s');
      debugPrint('  Passed: ${result.isPassed}');
      debugPrint('  Stars: ${_calculateStars(result)}');
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
    
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(
          result.isPassed ? '🎉 Great Job!' : '😊 Good Try!',
          style: const TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You got ${result.correctCount} out of ${result.totalCount} correct!',
              style: const TextStyle(fontSize: 20),
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
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.emoji_events, color: Colors.amber, size: 48),
                    const SizedBox(height: 8),
                    const Text(
                      '🏆 Achievement Unlocked!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Next lesson unlocked!',
                      style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                    ),
                  ],
                ),
              ),
            ],
          ],
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

      if (_task?.timeLimitSeconds != null) {
        _remainingSeconds = _task!.timeLimitSeconds!;
        _startTimer();
      }
    });
  }

  void _navigateBack() {
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
      ref.read(newlyUnlockedProvider.notifier).markAsNewlyUnlocked(nextLesson.id);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
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
    return Stack(
      children: [
        // Drop target zones
        ..._task!.targets.map((target) {
          return Positioned(
            left: target.position[0],
            top: target.position[1],
            child: DropTargetZone(
              target: target,
              isOccupied: _userAnswers.values.contains(target.id),
              onAccept: (itemId) => _handleItemDropped(itemId, target.id),
            ),
          );
        }),

        // Draggable items
        ..._task!.items.map((item) {
          final isPlaced = _userAnswers.containsKey(item.id);
          final isCorrect = _correctItems.contains(item.id);
          final isIncorrect = _incorrectItems.contains(item.id);

          // If correctly placed, show item in the target zone
          if (isCorrect) {
            final targetId = _userAnswers[item.id];
            final target = _task!.targets.firstWhere((t) => t.id == targetId);
            
            return Positioned(
              left: target.position[0],
              top: target.position[1],
              child: Opacity(
                opacity: 0.9,
                child: Container(
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                  child: DraggableTaskItem(
                    item: item,
                    isCorrect: isCorrect,
                    isIncorrect: false,
                  ),
                ),
              ),
            );
          }

          // If incorrectly placed, hide temporarily and show back at initial position
          if (isIncorrect) {
            return const SizedBox.shrink();
          }

          // Show item at initial position if not placed or if placement was wrong
          if (!isPlaced || isIncorrect) {
            return Positioned(
              left: item.initialPosition[0],
              top: item.initialPosition[1],
              child: DraggableTaskItem(
                item: item,
                isCorrect: false,
                isIncorrect: isIncorrect,
              ),
            );
          }

          return const SizedBox.shrink();
        }),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: _showHintDialog,
              icon: const Icon(Icons.lightbulb_outline, size: 24),
              label: const Text('Hint', style: TextStyle(fontSize: 18)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: _retryTask,
              icon: const Icon(Icons.refresh, size: 24),
              label: const Text('Reset', style: TextStyle(fontSize: 18)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
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
    // TODO: Implement localization
    return _task?.titleKey.split('.').last.replaceAll('_', ' ').toUpperCase() ??
        'Interactive Task';
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
