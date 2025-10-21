import 'package:biomind_edu/shared/models/lesson.dart';

/// Sample lesson data for testing and development
///
/// This file provides mock lesson content until actual 3D models,
/// audio files, and other assets are prepared.
class SampleLessonData {
  /// Cell Lesson - Learn about cell structure
  static Lesson get cellLesson => const Lesson(
    id: 'lesson_cell',
    titleKey: 'lessonsCellTitle',
    descriptionKey: 'lessonsCellDescription',
    difficulty: LessonDifficulty.beginner,
    modelFileName: 'cell_model.glb',
    voiceFiles: {
      'en': [
        'cell_intro_en.mp3',
        'cell_nucleus_en.mp3',
        'cell_membrane_en.mp3',
      ],
      'uk': [
        'cell_intro_uk.mp3',
        'cell_nucleus_uk.mp3',
        'cell_membrane_uk.mp3',
      ],
    },
    interactiveTaskId: 'task_cell_assembly',
    assessmentTestId: 'test_cell_knowledge',
    rewardId: 'reward_cell_explorer',
    order: 1,
    durationMinutes: 12,
    prerequisites: [],
    annotations: [
      LessonAnnotation(
        id: 'annotation_nucleus',
        nameKey: 'lessonsCellPartsNucleus',
        descriptionKey: 'lessonsCellPartsNucleusDescription',
        modelPartId: 'nucleus_mesh',
        voiceFile: 'cell_nucleus_explanation.mp3',
        position: [0, 0.5, 0],
      ),
      LessonAnnotation(
        id: 'annotation_membrane',
        nameKey: 'lessonsCellPartsMembrane',
        descriptionKey: 'lessonsCellPartsMembraneDescription',
        modelPartId: 'membrane_mesh',
        voiceFile: 'cell_membrane_explanation.mp3',
        position: [0.3, 0, 0.3],
      ),
      LessonAnnotation(
        id: 'annotation_mitochondria',
        nameKey: 'lessonsCellPartsMitochondria',
        descriptionKey: 'lessonsCellPartsMitochondriaDescription',
        modelPartId: 'mitochondria_mesh',
        voiceFile: 'cell_mitochondria_explanation.mp3',
        position: [-0.2, 0.2, 0.1],
      ),
      LessonAnnotation(
        id: 'annotation_cytoplasm',
        nameKey: 'lessonsCellPartsCytoplasm',
        descriptionKey: 'lessonsCellPartsCytoplasmDescription',
        modelPartId: 'cytoplasm_mesh',
        voiceFile: 'cell_cytoplasm_explanation.mp3',
        position: [0.1, -0.3, -0.2],
      ),
    ],
    // Updated preview image for the first lesson
    thumbnailPath: 'assets/images/cell_thumbnail.png',
    isLocked: false,
    status: LessonStatus.notStarted,
  );

  /// Plant Lesson - Learn about plant life cycle (LOCKED - requires cell lesson)
  static Lesson get plantLesson => const Lesson(
    id: 'lesson_plant',
    titleKey: 'lessonsPlantTitle',
    descriptionKey: 'lessonsPlantDescription',
    difficulty: LessonDifficulty.beginner,
    modelFileName: 'plant_model.glb',
    voiceFiles: {
      'en': ['plant_intro_en.mp3', 'plant_seed_en.mp3', 'plant_growth_en.mp3'],
      'uk': ['plant_intro_uk.mp3', 'plant_seed_uk.mp3', 'plant_growth_uk.mp3'],
    },
    interactiveTaskId: 'task_plant_life_cycle',
    assessmentTestId: 'test_plant_knowledge',
    rewardId: 'reward_plant_expert',
    order: 2,
    durationMinutes: 15,
    prerequisites: ['lesson_cell'],
    annotations: [
      LessonAnnotation(
        id: 'annotation_seed',
        nameKey: 'lessonsPlantPartsSeed',
        descriptionKey: 'lessonsPlantPartsSeedDescription',
        modelPartId: 'seed_mesh',
        voiceFile: 'plant_seed_explanation.mp3',
        position: [0, -0.8, 0],
      ),
      LessonAnnotation(
        id: 'annotation_sprout',
        nameKey: 'lessonsPlantPartsSprout',
        descriptionKey: 'lessonsPlantPartsSproutDescription',
        modelPartId: 'sprout_mesh',
        voiceFile: 'plant_sprout_explanation.mp3',
        position: [-0.3, -0.3, 0],
      ),
      LessonAnnotation(
        id: 'annotation_growth',
        nameKey: 'lessonsPlantPartsGrowth',
        descriptionKey: 'lessonsPlantPartsGrowthDescription',
        modelPartId: 'growth_mesh',
        voiceFile: 'plant_growth_explanation.mp3',
        position: [0, 0.2, 0],
      ),
      LessonAnnotation(
        id: 'annotation_bloom',
        nameKey: 'lessonsPlantPartsBloom',
        descriptionKey: 'lessonsPlantPartsBloomDescription',
        modelPartId: 'bloom_mesh',
        voiceFile: 'plant_bloom_explanation.mp3',
        position: [0.3, 0.6, 0.2],
      ),
    ],
    thumbnailPath: 'assets/images/plant_life_thumbnail.png',
    isLocked: true,
    status: LessonStatus.notStarted,
  );

  /// Heart Lesson - Learn about heart structure (LOCKED - requires plant lesson)
  static Lesson get heartLesson => const Lesson(
    id: 'lesson_heart',
    titleKey: 'lessonsHeartTitle',
    descriptionKey: 'lessonsHeartDescription',
    difficulty: LessonDifficulty.intermediate,
    modelFileName: '3d+heart+model.glb',
    voiceFiles: {
      'en': [
        'heart_intro_en.mp3',
        'heart_chambers_en.mp3',
        'heart_valves_en.mp3',
      ],
      'uk': [
        'heart_intro_uk.mp3',
        'heart_chambers_uk.mp3',
        'heart_valves_uk.mp3',
      ],
    },
    interactiveTaskId: 'task_heart_blood_flow',
    assessmentTestId: 'test_heart_knowledge',
    rewardId: 'reward_heart_specialist',
    order: 3,
    durationMinutes: 18,
    prerequisites: ['lesson_cell', 'lesson_plant'],
    annotations: [
      LessonAnnotation(
        id: 'annotation_left_atrium',
        nameKey: 'lessonsHeartPartsLeftAtrium',
        descriptionKey: 'lessonsHeartPartsLeftAtriumDescription',
        modelPartId: 'left_atrium_mesh',
        voiceFile: 'heart_left_atrium_explanation.mp3',
        position: [-0.2, 0.3, 0.1],
      ),
      LessonAnnotation(
        id: 'annotation_left_ventricle',
        nameKey: 'lessonsHeartPartsLeftVentricle',
        descriptionKey: 'lessonsHeartPartsLeftVentricleDescription',
        modelPartId: 'left_ventricle_mesh',
        voiceFile: 'heart_left_ventricle_explanation.mp3',
        position: [-0.2, -0.2, 0.1],
      ),
      LessonAnnotation(
        id: 'annotation_right_atrium',
        nameKey: 'lessonsHeartPartsRightAtrium',
        descriptionKey: 'lessonsHeartPartsRightAtriumDescription',
        modelPartId: 'right_atrium_mesh',
        voiceFile: 'heart_right_atrium_explanation.mp3',
        position: [0.2, 0.3, 0.1],
      ),
      LessonAnnotation(
        id: 'annotation_right_ventricle',
        nameKey: 'lessonsHeartPartsRightVentricle',
        descriptionKey: 'lessonsHeartPartsRightVentricleDescription',
        modelPartId: 'right_ventricle_mesh',
        voiceFile: 'heart_right_ventricle_explanation.mp3',
        position: [0.2, -0.2, 0.1],
      ),
    ],
    thumbnailPath: 'assets/images/heart_thumbnail.png',
    isLocked: true,
    status: LessonStatus.notStarted,
  );

  /// Get all sample lessons
  static List<Lesson> get allLessons => [cellLesson, plantLesson, heartLesson];

  /// Initialize sample data in storage (for testing)
  static Future<void> initializeSampleData(
    Future<void> Function(Lesson) saveLessonFn,
  ) async {
    for (final lesson in allLessons) {
      await saveLessonFn(lesson);
    }
  }
}
