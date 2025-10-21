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
  bool _isModelLoaded = false;
  bool _isLoading = true;
  String? _placementHint;
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
        _isModelLoaded = true;
        _isLoading = false;
        _placementHint = widget.isArSupported
            ? 'Tap to place model'
            : 'Swipe to rotate';
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
    return Stack(
      children: [
        // AR Camera View
        // TODO: Integrate ar_flutter_plugin ARView when available
        Container(
          color: Colors.black,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.camera_alt,
                  size: 100,
                  color: Colors.white.withOpacity(0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  'AR View Placeholder',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Requires ar_flutter_plugin',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Placement hint
        if (_placementHint != null)
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
                child: Text(
                  _placementHint!,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),

        // AR plane detection indicator
        if (!_isModelLoaded)
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.5),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.crop_free,
                size: 100,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFallback3DView() {
    // Build model path from lesson's modelFileName
    // For web, use absolute path from assets folder
    final modelPath = 'assets/3d_models/${widget.lesson.modelFileName}';

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

        // Touch gesture hint
        if (_placementHint != null && !_isLoading && _errorMessage == null)
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.swipe, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      _placementHint!,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
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
