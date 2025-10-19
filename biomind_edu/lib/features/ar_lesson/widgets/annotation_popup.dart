import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/lesson.dart';
import '../../../shared/providers/audio_provider.dart';

/// Popup widget that displays annotation details when user taps on a 3D model part
/// 
/// Features:
/// - Shows annotation name and description
/// - Plays audio explanation when opened
/// - Kid-friendly design with large close button
/// - Smooth animations for show/hide
/// - Swipe down to dismiss gesture
class AnnotationPopup extends ConsumerStatefulWidget {
  final LessonAnnotation annotation;
  final VoidCallback onClose;

  const AnnotationPopup({
    Key? key,
    required this.annotation,
    required this.onClose,
  }) : super(key: key);

  @override
  ConsumerState<AnnotationPopup> createState() => _AnnotationPopupState();
}

class _AnnotationPopupState extends ConsumerState<AnnotationPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize animations
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOutBack,
    );

    _opacityAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    // Start animation
    _animationController.forward();

    // Play audio explanation
    _playAudioExplanation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _playAudioExplanation() {
    // Get audio file path based on language
    final audioFile = widget.annotation.voiceFile;
    if (audioFile != null && audioFile.isNotEmpty) {
      // TODO: Play audio using AudioService
      // For now, we'll just log it
      debugPrint('Playing audio: $audioFile');
      // ref.read(audioNotifierProvider.notifier).playVoice(audioFile);
    }
  }

  void _handleClose() {
    _animationController.reverse().then((_) {
      widget.onClose();
    });
  }

  String _getAnnotationName() {
    // TODO: Implement proper localization
    // For now, extract name from localization key
    final key = widget.annotation.nameKey;
    return key.split('.').last.replaceAll('_', ' ').toUpperCase();
  }

  String _getAnnotationDescription() {
    // TODO: Implement proper localization
    // For now, return placeholder description
    return 'This is an important part of the ${_getAnnotationName().toLowerCase()}. Tap the replay button to hear more details!';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {}, // Prevent closing when tapping inside
      child: Container(
        color: Colors.black54, // Semi-transparent background
        child: GestureDetector(
          onVerticalDragEnd: (details) {
            // Swipe down to dismiss
            if (details.primaryVelocity != null && details.primaryVelocity! > 300) {
              _handleClose();
            }
          },
          child: Center(
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Container(
                  margin: const EdgeInsets.all(24),
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.9,
                    maxHeight: size.height * 0.6,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header with close button
                      _buildHeader(theme),
                      
                      // Scrollable content
                      Flexible(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Icon
                              _buildIcon(theme),
                              
                              const SizedBox(height: 16),
                              
                              // Title
                              _buildTitle(theme),
                              
                              const SizedBox(height: 16),
                              
                              // Description
                              _buildDescription(theme),
                            ],
                          ),
                        ),
                      ),
                      
                      // Action buttons
                      _buildActionButtons(theme),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Drag indicator
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onPrimaryContainer.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          
          // Close button
          IconButton(
            icon: const Icon(Icons.close),
            iconSize: 32,
            onPressed: _handleClose,
            style: IconButton.styleFrom(
              backgroundColor: theme.colorScheme.surface,
              foregroundColor: theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(ThemeData theme) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.science,
          size: 64,
          color: theme.colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildTitle(ThemeData theme) {
    final title = _getAnnotationName();
    return Text(
      title,
      textAlign: TextAlign.center,
      style: theme.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: theme.colorScheme.primary,
      ),
    );
  }

  Widget _buildDescription(ThemeData theme) {
    final description = _getAnnotationDescription();
    return Text(
      description,
      textAlign: TextAlign.center,
      style: theme.textTheme.bodyLarge?.copyWith(
        height: 1.6,
        fontSize: 18,
      ),
    );
  }

  Widget _buildActionButtons(ThemeData theme) {
    final isMuted = ref.watch(isMutedProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Replay audio button
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                _playAudioExplanation();
              },
              icon: Icon(
                isMuted ? Icons.volume_off : Icons.volume_up,
                size: 24,
              ),
              label: const Text('Replay'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          
          const SizedBox(width: 12),
          
          // Got it button
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: _handleClose,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Got it!'),
            ),
          ),
        ],
      ),
    );
  }
}
