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
  String? _placementHint;

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      // TODO: Implement actual 3D model loading
      // For now, simulate loading delay
      await Future<void>.delayed(const Duration(seconds: 2));

      setState(() {
        _isModelLoaded = true;
        _placementHint = widget.isArSupported
            ? 'Tap to place model'
            : 'Swipe to rotate';
      });

      widget.onModelLoaded();
    } catch (e) {
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
    final modelPath = 'assets/3d_models/${widget.lesson.modelFileName}';

    return Stack(
      children: [
        // 3D Model Viewer using model_viewer_plus
        ModelViewer(
          src: modelPath,
          alt: localizeKey(context, widget.lesson.titleKey),
          ar: false, // Disable AR button in fallback mode
          autoRotate: true,
          autoRotateDelay: 0,
          rotationPerSecond: '30deg',
          cameraControls: true,
          touchAction: TouchAction.panY,
          disableZoom: false,
          backgroundColor: const Color(0xFF1A1A1A),
          loading: Loading.eager,
          reveal: Reveal.auto,
          // Lighting
          shadowIntensity: 0.7,
          shadowSoftness: 0.5,
          exposure: 1.0,
          // Camera position
          cameraOrbit: 'auto auto 3m',
          minCameraOrbit: 'auto auto 2m',
          maxCameraOrbit: 'auto auto 10m',
          // Field of view
          fieldOfView: '45deg',
          minFieldOfView: '25deg',
          maxFieldOfView: '75deg',
          // Interaction
          interpolationDecay: 200,
        ),

        // Touch gesture hint
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
