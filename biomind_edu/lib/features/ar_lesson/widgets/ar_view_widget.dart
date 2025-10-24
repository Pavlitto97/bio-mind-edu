import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../../../shared/models/lesson.dart';
import '../../../l10n/l10n_helpers.dart';

/// AR View Widget - Displays 3D model in AR or fallback 3D viewer
///
/// When AR is supported: Shows camera feed with AR overlay
/// When AR is not supported: Shows 3D model viewer with touch controls
class ARViewWidget extends StatefulWidget {
  final Lesson lesson;
  final bool isArSupported;
  final VoidCallback onModelLoaded;
  final void Function(String error) onError;

  const ARViewWidget({
    super.key,
    required this.lesson,
    required this.isArSupported,
    required this.onModelLoaded,
    required this.onError,
  });

  @override
  State<ARViewWidget> createState() => _ARViewWidgetState();
}

class _ARViewWidgetState extends State<ARViewWidget> {
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      // Simulate model loading delay
      await Future<void>.delayed(const Duration(seconds: 1));

      setState(() {
        _isLoading = false;
      });

      widget.onModelLoaded();
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = 'Failed to load 3D model: $e';
      });
      widget.onError('Failed to load 3D model: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isArSupported) {
      return _buildARView();
    } else {
      return _buildFallback3DView();
    }
  }

  Widget _buildARView() {
    // On mobile web, use ModelViewer as fallback since ar_flutter_plugin
    // is not available yet. This provides better UX than empty placeholder.
    return _buildFallback3DView();
  }

  Widget _buildFallback3DView() {
    // Build model path from lesson's modelFileName
    // For web, Flutter duplicates 'assets' in the path: assets/assets/...
    final modelPath = 'assets/assets/3d_models/${widget.lesson.modelFileName}';

    return Stack(
      children: [
        // 3D Model Viewer using model_viewer_plus
        ModelViewer(
          src: modelPath,
          alt: localizeKey(context, widget.lesson.titleKey),
          ar: false, // Disable AR button in fallback mode
          autoRotate: true,
          autoRotateDelay: 1000,
          rotationPerSecond: '20deg',
          cameraControls: true,
          touchAction: TouchAction.panY,
          disableZoom: false,
          backgroundColor: const Color(0xFF1A1A1A),
          loading: Loading.eager,
          reveal: Reveal.auto,
          // Lighting - улучшенное освещение для лучшей видимости
          shadowIntensity: 1.0,
          shadowSoftness: 1.0,
          exposure: 1.2,
          // Camera position - ближе к модели
          cameraOrbit: '0deg 75deg 2.5m',
          minCameraOrbit: 'auto auto 1.5m',
          maxCameraOrbit: 'auto auto 8m',
          // Field of view
          fieldOfView: '45deg',
          minFieldOfView: '25deg',
          maxFieldOfView: '75deg',
          // Interaction
          interpolationDecay: 200,
          // Environment and lighting
          environmentImage: 'neutral',
          skyboxImage: null,
        ),

        // Loading indicator
        if (_isLoading)
          Container(
            color: Colors.black.withOpacity(0.7),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Loading 3D model...',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

        // Error message
        if (_errorMessage != null)
          Container(
            color: Colors.black.withOpacity(0.8),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _errorMessage!,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _loadModel,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            ),
          ),

        // Touch gesture hint - show "Swipe to rotate" instruction
        if (!_isLoading && _errorMessage == null)
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.swipe, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Swipe to rotate',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
