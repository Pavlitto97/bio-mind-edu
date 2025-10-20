import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import '../../../shared/models/lesson.dart';
import '../../../core/constants/app_constants.dart';

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
    // Build model path: assets/3d_models/{modelFileName}
    final modelPath = '${ModelConstants.modelsPath}${widget.lesson.modelFileName}';
    
    return Stack(
      children: [
        // 3D Model Viewer with model_viewer_plus
        ModelViewer(
          src: modelPath,
          alt: '${widget.lesson.titleKey} 3D Model',
          ar: false, // Disable AR for web fallback
          autoRotate: true,
          cameraControls: true,
          backgroundColor: const Color(0xFF1A1A1A),
          loading: Loading.eager,
          cameraOrbit: 'auto auto auto',
          fieldOfView: '45deg',
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
