import 'package:flutter/material.dart';
import '../../../shared/models/lesson.dart';

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
    return Stack(
      children: [
        // 3D Model Viewer
        // TODO: Integrate flutter_cube or model_viewer_plus
        Container(
          color: const Color(0xFF1A1A1A),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Placeholder for 3D model
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.view_in_ar,
                        size: 80,
                        color: Colors.white.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.lesson.titleKey.split('.').last.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '3D Model',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'AR not supported on this device',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
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
