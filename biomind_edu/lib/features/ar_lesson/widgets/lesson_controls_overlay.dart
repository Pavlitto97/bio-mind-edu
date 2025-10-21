import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/lesson.dart';
import '../../../shared/providers/deepgram_tts_provider.dart';

/// Lesson Controls Overlay - Bottom controls for AR lesson
///
/// Provides buttons for:
/// - Replaying lesson introduction narration
/// - Viewing annotations
/// - Playing/pausing audio instructions
/// - Completing lesson and moving to task
class LessonControlsOverlay extends ConsumerStatefulWidget {
  final Lesson lesson;
  final bool isArMode;
  final void Function(LessonAnnotation annotation) onAnnotationTap;
  final VoidCallback onTaskComplete;

  const LessonControlsOverlay({
    super.key,
    required this.lesson,
    required this.isArMode,
    required this.onAnnotationTap,
    required this.onTaskComplete,
  });

  @override
  ConsumerState<LessonControlsOverlay> createState() =>
      _LessonControlsOverlayState();
}

class _LessonControlsOverlayState
    extends ConsumerState<LessonControlsOverlay> {
  bool _showAnnotations = false;

  @override
  Widget build(BuildContext context) {
    final ttsState = ref.watch(deepgramTtsStateProvider);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Annotations row (collapsible)
          if (_showAnnotations && widget.lesson.annotations.isNotEmpty)
            _buildAnnotationsList(),

          const SizedBox(height: 16),

          // Main controls row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Replay introduction
              _buildControlButton(
                icon: ttsState.isSpeaking ? Icons.volume_up : Icons.replay,
                label: 'Replay',
                onPressed: ttsState.isSpeaking ? () {} : () {
                  // Play lesson introduction using Deepgram
                  ref.read(deepgramTtsStateProvider.notifier).speakIntro(
                    context: context,
                    lessonId: widget.lesson.id,
                  );
                },
                isEnabled: !ttsState.isSpeaking,
              ),

              // Annotations toggle
              _buildControlButton(
                icon: _showAnnotations ? Icons.expand_more : Icons.info_outline,
                label: 'Info',
                onPressed: () {
                  setState(() {
                    _showAnnotations = !_showAnnotations;
                  });
                },
                isEnabled: true,
              ),

              // Continue to task
              _buildPrimaryButton(
                label: 'Continue',
                icon: Icons.arrow_forward,
                onPressed: widget.onTaskComplete,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAnnotationsList() {
    return Container(
      height: 120,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.lesson.annotations.length,
        itemBuilder: (context, index) {
          final annotation = widget.lesson.annotations[index];
          return _buildAnnotationCard(annotation);
        },
      ),
    );
  }

  Widget _buildAnnotationCard(LessonAnnotation annotation) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: Card(
        color: Colors.white.withOpacity(0.15),
        child: InkWell(
          onTap: () => widget.onAnnotationTap(annotation),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.touch_app,
                  color: Colors.white.withOpacity(0.8),
                  size: 32,
                ),
                const Spacer(),
                Text(
                  _getAnnotationTitle(annotation),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'Tap to learn',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getAnnotationTitle(LessonAnnotation annotation) {
    // Extract readable name from localization key
    return annotation.nameKey
        .split('.')
        .last
        .replaceAll('_', ' ')
        .split(' ')
        .map(
          (word) =>
              word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1),
        )
        .join(' ');
  }

  Widget _buildControlButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    bool isEnabled = true,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isEnabled 
              ? Colors.white.withOpacity(0.15)
              : Colors.white.withOpacity(0.05),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              icon, 
              color: isEnabled ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            iconSize: 28,
            onPressed: isEnabled ? onPressed : null,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label, 
          style: TextStyle(
            color: isEnabled ? Colors.white : Colors.white.withOpacity(0.5), 
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildPrimaryButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    );
  }
}
