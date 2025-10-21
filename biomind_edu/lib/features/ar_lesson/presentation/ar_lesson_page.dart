import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/lesson.dart';
import '../../../shared/providers/lessons_provider.dart';
import '../../../shared/providers/audio_provider.dart';
import '../../../core/services/ar_manager.dart';
import '../../../core/services/audio_service.dart';
import '../widgets/ar_view_widget.dart';
import '../widgets/lesson_controls_overlay.dart';
import '../widgets/annotation_markers.dart';
import '../widgets/annotation_popup.dart';

/// AR Lesson Screen - Main screen for viewing AR lesson content
///
/// Displays AR view with 3D model and provides UI controls for:
/// - Navigation (back, next, complete)
/// - Audio playback (voice instructions)
/// - Annotations (tap to learn about parts)
/// - Progress tracking
class ARLessonPage extends ConsumerStatefulWidget {
  final String lessonId;

  const ARLessonPage({super.key, required this.lessonId});

  @override
  ConsumerState<ARLessonPage> createState() => _ARLessonPageState();
}

class _ARLessonPageState extends ConsumerState<ARLessonPage> {
  bool _isLoading = true;
  String? _errorMessage;
  bool _isArSupported = false;

  @override
  void initState() {
    super.initState();
    _initializeLesson();
  }

  Future<void> _initializeLesson() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      // Check AR support
      final arManager = ARManager();
      final arSupport = await arManager.checkARSupport();

      setState(() {
        _isArSupported = arSupport == ARSupport.fullSupport;
      });

      // Load lesson data (just read to trigger loading)
      ref.read(lessonByIdProvider(widget.lessonId));

      // Initialize AR session if supported
      if (_isArSupported) {
        // TODO: Initialize AR session when ar_flutter_plugin is available
        // await arManager.initializeARSession();
      }

      // Play welcome audio
      // TODO: Play actual audio file from lesson
      // final audioNotifier = ref.read(audioNotifierProvider.notifier);
      // await audioNotifier.playVoice('welcome_${widget.lessonId}.mp3');

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load lesson: $e';
      });
    }
  }

  @override
  void dispose() {
    // Clean up AR session
    final arManager = ARManager();
    arManager.dispose();

    // Stop any playing audio without touching Riverpod ref during dispose
    // Using the singleton AudioService directly avoids "ref after dispose" issues
    try {
      AudioService().stopAll();
    } catch (_) {
      // no-op: app is closing this page, ignore cleanup errors
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lessonAsync = ref.watch(lessonByIdProvider(widget.lessonId));
    final lessonSession = ref.watch(lessonSessionProvider(widget.lessonId));
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // AR View or loading/error state
            if (_isLoading)
              _buildLoadingState()
            else if (_errorMessage != null)
              _buildErrorState()
            else
              lessonAsync.when(
                data: (lesson) {
                  if (lesson == null) {
                    return _buildErrorState(message: 'Lesson not found');
                  }
                  return _buildLessonView(lesson, lessonSession);
                },
                loading: () => _buildLoadingState(),
                error: (error, stack) =>
                    _buildErrorState(message: error.toString()),
              ),

            // Annotation markers overlay (only when AR view is loaded)
            if (!_isLoading && _errorMessage == null)
              lessonAsync.maybeWhen(
                data: (lesson) {
                  if (lesson == null) return const SizedBox.shrink();
                  return AnnotationMarkersOverlay(
                    annotations: lesson.annotations,
                    viewedAnnotationIds: lessonSession.viewedAnnotations,
                    onAnnotationTap: _handleAnnotationTap,
                    screenSize: screenSize,
                  );
                },
                orElse: () => const SizedBox.shrink(),
              ),

            // Top controls overlay
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _buildTopControls(context),
            ),

            // Bottom controls overlay (only when loaded)
            if (!_isLoading && _errorMessage == null)
              lessonAsync.maybeWhen(
                data: (lesson) {
                  if (lesson == null) return const SizedBox.shrink();
                  return Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: LessonControlsOverlay(
                      lesson: lesson,
                      isArMode: _isArSupported,
                      onAnnotationTap: _handleAnnotationTap,
                      onTaskComplete: _handleTaskComplete,
                    ),
                  );
                },
                orElse: () => const SizedBox.shrink(),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonView(Lesson lesson, LessonSessionState session) {
    return ARViewWidget(
      lesson: lesson,
      isArSupported: _isArSupported,
      onModelLoaded: () {
        if (mounted) {
          ref
              .read(lessonSessionProvider(widget.lessonId).notifier)
              .setModelLoaded(true);
        }
      },
      onError: (String error) {
        if (mounted) {
          setState(() {
            _errorMessage = error;
          });
        }
      },
    );
  }

  Widget _buildLoadingState() {
    return Container(
      color: Colors.black,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            const SizedBox(height: 24),
            Text(
              'Loading AR Experience...',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              'Please point camera at flat surface',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState({String? message}) {
    final errorText = message ?? _errorMessage ?? 'Unknown error occurred';

    return Container(
      color: Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 24),
              Text(
                'Unable to Load Lesson',
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall?.copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                errorText,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _initializeLesson,
                icon: const Icon(Icons.refresh),
                label: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopControls(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.black.withOpacity(0.6), Colors.transparent],
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              // TODO: Show lesson info dialog
            },
          ),
          IconButton(
            icon: Icon(
              ref.watch(isMutedProvider) ? Icons.volume_off : Icons.volume_up,
              color: Colors.white,
            ),
            onPressed: () {
              ref.read(audioNotifierProvider.notifier).toggleMute();
            },
          ),
        ],
      ),
    );
  }

  void _handleAnnotationTap(LessonAnnotation annotation) {
    if (!mounted) return;

    // Mark annotation as viewed
    ref
        .read(lessonSessionProvider(widget.lessonId).notifier)
        .addViewedAnnotation(annotation.id);

    // Show the popup as a modal overlay
    showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.transparent, // Use popup's own background
      builder: (context) => AnnotationPopup(
        annotation: annotation,
        onClose: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }

  void _handleTaskComplete() {
    // Get the lesson to access its interactiveTaskId
    final lesson = ref.read(lessonByIdProvider(widget.lessonId)).value;

    if (lesson != null) {
      // Navigate to interactive task screen with both taskId and lessonId
      Navigator.of(context).pushNamed(
        '/interactive-task',
        arguments: {
          'taskId': lesson.interactiveTaskId,
          'lessonId': widget.lessonId,
        },
      );
    }
  }
}
