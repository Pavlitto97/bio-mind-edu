# AR Plugin Research - BioMindEDU MVP

**Date**: 2025-10-19  
**Task**: 0.3 - AR Plugin Research & Integration  
**Status**: In Progress

## AR Plugin Selection

### ar_flutter_plugin

**Repository**: https://github.com/CariusLars/ar_flutter_plugin  
**Latest Version**: 1.0.1+ (git-based installation recommended)

**Pros:**
- Unified API for ARCore (Android) and ARKit (iOS)
- Active maintenance and community support
- Good documentation with examples
- Supports plane detection, hit testing, object placement
- Supports GLTF/GLB 3D models

**Cons:**
- Requires physical device for testing (no emulator support)
- iOS requires paid Apple Developer account for device testing
- Limited debugging capabilities in AR mode
- Performance depends heavily on device capabilities

### Device Requirements

**Android:**
- Android 7.0+ (API 24+)
- ARCore supported device (list: https://developers.google.com/ar/devices)
- Minimum 2GB RAM recommended
- Camera with autofocus

**iOS:**
- iOS 12.0+
- ARKit compatible device (iPhone 6S and newer)
- A9 chip or newer
- Minimum 2GB RAM

## Implementation Strategy

### Phase 1: Basic AR Setup (Current)
1. Uncomment ar_flutter_plugin dependency
2. Configure Android/iOS permissions
3. Create AR manager wrapper
4. Implement AR availability detection
5. Create fallback 3D viewer

### Phase 2: AR Scene Implementation
1. Plane detection and visualization
2. Object placement via raycast
3. Basic interactions (rotation, scale)
4. Model loading and rendering

### Phase 3: Advanced Features
1. Multi-object placement
2. Annotation system
3. Hit detection on model parts
4. Persistent AR anchors

## Technical Decisions

### 3D Model Format
**Decision**: Use GLB (binary GLTF) format
- Smaller file size than GLTF
- Single file (easier asset management)
- Better performance on mobile
- Supported by ar_flutter_plugin

### Model Optimization
- Target: <50k polygons per model
- Texture resolution: 1024x1024 max
- PBR materials supported
- Baked lighting where possible

### Fallback Strategy
For devices without AR support:
1. Detect AR availability on app start
2. Use flutter_cube for 3D model viewer
3. Implement touch gestures (rotate, zoom, pan)
4. Provide same annotations as AR mode

## Known Issues & Workarounds

### Issue 1: AR Plugin Installation
**Problem**: Plugin requires git installation, not available on pub.dev  
**Workaround**: Install from git repository in pubspec.yaml

### Issue 2: iOS Build Complexity
**Problem**: Requires Xcode, CocoaPods, signing certificates  
**Workaround**: Focus on Android first, iOS later when device available

### Issue 3: No Emulator Support
**Problem**: AR features only work on physical devices  
**Workaround**: Implement fallback 3D viewer for development/testing

### Issue 4: Limited Debugging
**Problem**: Difficult to debug AR issues without device logs  
**Workaround**: Extensive logging, error handling, fallback modes

## Testing Strategy

### Development Testing (Without AR Device)
- Use fallback 3D viewer
- Mock AR manager responses
- Test UI components in isolation
- Unit test business logic

### Device Testing (When Available)
- Test plane detection in various lighting
- Test object placement on different surfaces
- Test performance with complex models
- Test user interactions (tap, gesture)

## Performance Considerations

### Target Metrics
- AR rendering: ≥30 FPS
- Model loading: <3 seconds
- Plane detection: <5 seconds
- Memory usage: <200MB

### Optimization Strategies
1. Lazy load 3D models
2. Use model LOD (Level of Detail)
3. Texture compression
4. Limit simultaneous AR objects
5. Efficient memory management

## Next Steps

1. ✅ Document AR plugin architecture
2. ⏳ Uncomment ar_flutter_plugin in pubspec.yaml
3. ⏳ Update Android/iOS permissions
4. ⏳ Implement AR manager with detection
5. ⏳ Create proof-of-concept AR scene
6. ⏳ Test on physical device (when available)

## References

- [ar_flutter_plugin Documentation](https://github.com/CariusLars/ar_flutter_plugin)
- [ARCore Developer Guide](https://developers.google.com/ar)
- [ARKit Developer Documentation](https://developer.apple.com/augmented-reality/)
- [GLTF 2.0 Specification](https://www.khronos.org/gltf/)
- [Flutter 3D Model Optimization Guide](https://docs.flutter.dev/development/ui/advanced/graphics-optimization)
