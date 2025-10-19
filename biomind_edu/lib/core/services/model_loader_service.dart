// ignore_for_file: prefer_final_locals, unawaited_futures

import 'dart:async';
import 'package:flutter/services.dart';

import '../constants/app_constants.dart';

/// Model loading state
enum ModelLoadingState {
  notLoaded,
  loading,
  loaded,
  error,
}

/// Cached 3D model data
class CachedModel {
  final String modelId;
  final ByteData data;
  final DateTime loadedAt;
  final int sizeInBytes;

  CachedModel({
    required this.modelId,
    required this.data,
    required this.loadedAt,
    required this.sizeInBytes,
  });
}

/// Model Loader Service
/// 
/// Handles loading, caching, and management of 3D models.
/// Implements in-memory caching to avoid redundant loads.
class ModelLoaderService {
  static final ModelLoaderService _instance = ModelLoaderService._internal();
  
  factory ModelLoaderService() => _instance;
  
  ModelLoaderService._internal();

  /// In-memory cache of loaded models
  final Map<String, CachedModel> _cache = {};

  /// Loading state for each model
  final Map<String, ModelLoadingState> _loadingStates = {};

  /// Active loading operations
  final Map<String, Future<ByteData?>> _activeLoads = {};

  /// Get model loading state
  ModelLoadingState getModelState(String modelId) {
    return _loadingStates[modelId] ?? ModelLoadingState.notLoaded;
  }

  /// Check if model is cached
  bool isModelCached(String modelId) {
    return _cache.containsKey(modelId);
  }

  /// Get cached model size in MB
  double getCachedSize() {
    int totalBytes = _cache.values.fold(0, (sum, model) => sum + model.sizeInBytes);
    return totalBytes / (1024 * 1024);
  }

  /// Load 3D model from assets
  Future<ByteData?> loadModel(String modelId) async {
    // Check if already cached
    if (_cache.containsKey(modelId)) {
      return _cache[modelId]!.data;
    }

    // Check if already loading
    if (_activeLoads.containsKey(modelId)) {
      return _activeLoads[modelId];
    }

    // Start loading
    _loadingStates[modelId] = ModelLoadingState.loading;
    
    final Future<ByteData?> loadFuture = _performLoad(modelId);
    _activeLoads[modelId] = loadFuture;

    try {
      final result = await loadFuture;
      return result;
    } finally {
      _activeLoads.remove(modelId);
    }
  }

  /// Perform actual model loading
  Future<ByteData?> _performLoad(String modelId) async {
    try {
      // Construct asset path
      final String assetPath = _getAssetPath(modelId);

      // Load from asset bundle
      final ByteData data = await rootBundle.load(assetPath);

      // Cache the model
      _cache[modelId] = CachedModel(
        modelId: modelId,
        data: data,
        loadedAt: DateTime.now(),
        sizeInBytes: data.lengthInBytes,
      );

      _loadingStates[modelId] = ModelLoadingState.loaded;
      
      return data;
    } catch (e) {
      _loadingStates[modelId] = ModelLoadingState.error;
      return null;
    }
  }

  /// Load model with progress callback
  Future<ByteData?> loadModelWithProgress(
    String modelId,
    void Function(double progress) onProgress,
  ) async {
    // Check if already cached
    if (_cache.containsKey(modelId)) {
      onProgress(1.0);
      return _cache[modelId]!.data;
    }

    // Update progress during loading
    onProgress(0.0);
    
    _loadingStates[modelId] = ModelLoadingState.loading;
    onProgress(0.3);

    try {
      final data = await loadModel(modelId);
      onProgress(1.0);
      return data;
    } catch (e) {
      onProgress(0.0);
      return null;
    }
  }

  /// Preload multiple models
  Future<Map<String, bool>> preloadModels(List<String> modelIds) async {
    final Map<String, bool> results = {};
    
    // Load models sequentially to avoid overloading
    for (final modelId in modelIds) {
      final data = await loadModel(modelId);
      results[modelId] = data != null;
    }

    return results;
  }

  /// Clear specific model from cache
  void clearModel(String modelId) {
    _cache.remove(modelId);
    _loadingStates[modelId] = ModelLoadingState.notLoaded;
  }

  /// Clear all cached models
  void clearCache() {
    _cache.clear();
    _loadingStates.clear();
  }

  /// Get cache statistics
  Map<String, dynamic> getCacheStats() {
    return {
      'cached_models': _cache.length,
      'total_size_mb': getCachedSize(),
      'models': _cache.keys.toList(),
    };
  }

  /// Get asset path for model ID
  String _getAssetPath(String modelId) {
    // Map model IDs to actual file paths
    switch (modelId) {
      case LessonConstants.cellLesson:
        return ModelConstants.modelsPath + ModelConstants.cellModel;
      case LessonConstants.plantLesson:
        return ModelConstants.modelsPath + ModelConstants.plantModel;
      case LessonConstants.heartLesson:
        return ModelConstants.modelsPath + ModelConstants.heartModel;
      default:
        return ModelConstants.modelsPath + modelId;
    }
  }

  /// Dispose resources
  void dispose() {
    clearCache();
    _activeLoads.clear();
  }
}
