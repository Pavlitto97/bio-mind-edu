import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../shared/models/lesson.dart';
import '../../../shared/providers/deepgram_tts_provider.dart';

/// Popup widget that displays annotation details when user taps on a 3D model part
///
/// Features:
/// - Shows annotation name and description (localized)
/// - Plays Deepgram TTS narration when opened
/// - Replay button to hear narration again
/// - Kid-friendly design with large close button
/// - Smooth animations for show/hide
/// - Swipe down to dismiss gesture
class AnnotationPopup extends ConsumerStatefulWidget {
  final LessonAnnotation annotation;
  final VoidCallback onClose;
  final String lessonId; // Added to get narration text

  const AnnotationPopup({
    Key? key,
    required this.annotation,
    required this.onClose,
    required this.lessonId,
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
    // Play Deepgram TTS narration for this annotation
    ref.read(deepgramTtsStateProvider.notifier).speakNarration(
      context: context,
      lessonId: widget.lessonId,
      elementId: widget.annotation.id,
    );
  }

  void _handleClose() {
    _animationController.reverse().then((_) {
      widget.onClose();
    });
  }

  String _getAnnotationName() {
    print('🔍 Getting annotation name for key: ${widget.annotation.nameKey}');
    
    // Hardcoded mapping for testing - will use actual l10n after
    switch (widget.annotation.nameKey) {
      case 'lessonsCellPartsNucleus':
        return '🧠 Nucleus';
      case 'lessonsCellPartsMembrane':
        return '🧱 Cell Membrane';
      case 'lessonsCellPartsMitochondria':
        return '⚡ Mitochondria';
      case 'lessonsCellPartsCytoplasm':
        return '🌊 Cytoplasm';
      
      case 'lessonsPlantPartsSeed':
        return '🌰 Seed';
      case 'lessonsPlantPartsSprout':
        return '🌱 Sprout';
      case 'lessonsPlantPartsGrowth':
        return '🌿 Growth';
      case 'lessonsPlantPartsBloom':
        return '🌸 Bloom';
      
      case 'lessonsHeartPartsLeftAtrium':
        return '📥 Left Atrium';
      case 'lessonsHeartPartsLeftVentricle':
        return '💪 Left Ventricle';
      case 'lessonsHeartPartsRightAtrium':
        return '📤 Right Atrium';
      case 'lessonsHeartPartsRightVentricle':
        return '🫀 Right Ventricle';
      
      default:
        return widget.annotation.nameKey;
    }
  }

  String _getAnnotationDescription() {
    print('🔍 Getting description for key: ${widget.annotation.descriptionKey}');
    
    // Hardcoded descriptions for testing
    switch (widget.annotation.descriptionKey) {
      // Cell parts
      case 'lessonsCellPartsNucleusDescription':
        return "🧠 The Brain of the Cell\nThe nucleus is like the control center of the cell! It tells all the other parts what to do, just like your brain tells your body what to do.";
      case 'lessonsCellPartsMembraneDescription':
        return "🛡️ The Protective Wall\nThe membrane is like a bouncer at a club! It decides what goes in and out of the cell to keep it safe.";
      case 'lessonsCellPartsMitochondriaDescription':
        return "⚡ The Power Plant\nMitochondria are like tiny batteries! They make energy so the cell can work and stay alive.";
      case 'lessonsCellPartsCytoplasmDescription':
        return "🌊 The Jelly Inside\nCytoplasm is like jelly that fills the cell! All the other parts float around in it.";
      
      // Plant parts  
      case 'lessonsPlantPartsSeedDescription':
        return "🌰 Tiny Beginning\nEvery plant starts as a tiny seed! Inside is everything needed to grow into a big plant.";
      case 'lessonsPlantPartsSproutDescription':
        return "🌱 Breaking Free\nThe sprout pushes through the soil towards the sun! It's the baby plant starting its journey.";
      case 'lessonsPlantPartsGrowthDescription':
        return "🌿 Growing Strong\nThe plant grows taller and makes more leaves! It drinks water and eats sunlight to get bigger.";
      case 'lessonsPlantPartsBloomDescription':
        return "🌸 Beautiful Flowers\nThe plant makes colorful flowers! These help make new seeds for more plants.";
      
      // Heart parts
      case 'lessonsHeartPartsLeftAtriumDescription':
        return "📥 Top Left Chamber\nThis room receives fresh oxygen-rich blood from your lungs! It's like a waiting room.";
      case 'lessonsHeartPartsLeftVentricleDescription':
        return "💪 Bottom Left Pumper\nThe strongest chamber! It pumps oxygen-rich blood to your whole body with great force.";
      case 'lessonsHeartPartsRightAtriumDescription':
        return "📤 Top Right Chamber\nThis room receives tired blood from your body! The blood needs new oxygen.";
      case 'lessonsHeartPartsRightVentricleDescription':
        return "🫀 Bottom Right Pumper\nThis chamber sends tired blood to your lungs! There it gets fresh oxygen.";
      
      default:
        return widget.annotation.descriptionKey;
    }
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
            if (details.primaryVelocity != null &&
                details.primaryVelocity! > 300) {
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
        child: Icon(Icons.science, size: 64, color: theme.colorScheme.primary),
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
      style: theme.textTheme.bodyLarge?.copyWith(height: 1.6, fontSize: 18),
    );
  }

  Widget _buildActionButtons(ThemeData theme) {
    final ttsState = ref.watch(deepgramTtsStateProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Replay audio button
          Expanded(
            child: OutlinedButton.icon(
              onPressed: ttsState.isSpeaking ? null : () {
                _playAudioExplanation();
              },
              icon: Icon(
                ttsState.isSpeaking ? Icons.volume_up : Icons.replay,
                size: 24,
              ),
              label: Text(ttsState.isSpeaking ? 'Playing...' : 'Replay'),
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
              onPressed: () {
                // Stop TTS before closing
                ref.read(deepgramTtsStateProvider.notifier).stop();
                _handleClose();
              },
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
