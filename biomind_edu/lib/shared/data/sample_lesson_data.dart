import 'package:biomind_edu/shared/models/lesson.dart';

/// Sample lesson data for testing and development
/// 
/// This file provides mock lesson content until actual 3D models,
/// audio files, and other assets are prepared.
class SampleLessonData {
  /// Cell Lesson - Learn about cell structure
  static Lesson get cellLesson => const Lesson(
        id: 'lesson_cell',
        titleKey: 'lessons.cell.title',
        descriptionKey: 'lessons.cell.description',
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
            nameKey: 'lessons.cell.parts.nucleus',
            descriptionKey: 'lessons.cell.parts.nucleus_description',
            modelPartId: 'nucleus_mesh',
            voiceFile: 'cell_nucleus_explanation.mp3',
            position: [0, 0.5, 0],
          ),
          LessonAnnotation(
            id: 'annotation_membrane',
            nameKey: 'lessons.cell.parts.membrane',
            descriptionKey: 'lessons.cell.parts.membrane_description',
            modelPartId: 'membrane_mesh',
            voiceFile: 'cell_membrane_explanation.mp3',
            position: [0.3, 0, 0.3],
          ),
          LessonAnnotation(
            id: 'annotation_mitochondria',
            nameKey: 'lessons.cell.parts.mitochondria',
            descriptionKey: 'lessons.cell.parts.mitochondria_description',
            modelPartId: 'mitochondria_mesh',
            voiceFile: 'cell_mitochondria_explanation.mp3',
            position: [-0.2, 0.2, 0.1],
          ),
          LessonAnnotation(
            id: 'annotation_cytoplasm',
            nameKey: 'lessons.cell.parts.cytoplasm',
            descriptionKey: 'lessons.cell.parts.cytoplasm_description',
            modelPartId: 'cytoplasm_mesh',
            voiceFile: 'cell_cytoplasm_explanation.mp3',
            position: [0.1, -0.3, -0.2],
          ),
        ],
        thumbnailPath: 'assets/images/cell_thumbnail.png',
        isLocked: false,
        status: LessonStatus.notStarted,
      );

  /// Plant Lesson - Learn about plant structure (LOCKED - requires cell lesson)
  static Lesson get plantLesson => const Lesson(
        id: 'lesson_plant',
        titleKey: 'lessons.plant.title',
        descriptionKey: 'lessons.plant.description',
        difficulty: LessonDifficulty.beginner,
        modelFileName: 'plant_model.glb',
        voiceFiles: {
          'en': [
            'plant_intro_en.mp3',
            'plant_roots_en.mp3',
            'plant_leaves_en.mp3',
          ],
          'uk': [
            'plant_intro_uk.mp3',
            'plant_roots_uk.mp3',
            'plant_leaves_uk.mp3',
          ],
        },
        interactiveTaskId: 'task_plant_parts',
        assessmentTestId: 'test_plant_knowledge',
        rewardId: 'reward_plant_expert',
        order: 2,
        durationMinutes: 15,
        prerequisites: ['lesson_cell'],
        annotations: [
          LessonAnnotation(
            id: 'annotation_roots',
            nameKey: 'lessons.plant.parts.roots',
            descriptionKey: 'lessons.plant.parts.roots_description',
            modelPartId: 'roots_mesh',
            voiceFile: 'plant_roots_explanation.mp3',
            position: [0, -0.8, 0],
          ),
          LessonAnnotation(
            id: 'annotation_stem',
            nameKey: 'lessons.plant.parts.stem',
            descriptionKey: 'lessons.plant.parts.stem_description',
            modelPartId: 'stem_mesh',
            voiceFile: 'plant_stem_explanation.mp3',
            position: [0, 0, 0],
          ),
          LessonAnnotation(
            id: 'annotation_leaves',
            nameKey: 'lessons.plant.parts.leaves',
            descriptionKey: 'lessons.plant.parts.leaves_description',
            modelPartId: 'leaves_mesh',
            voiceFile: 'plant_leaves_explanation.mp3',
            position: [0.3, 0.5, 0.2],
          ),
        ],
        thumbnailPath: 'assets/images/plant_thumbnail.png',
        isLocked: true,
        status: LessonStatus.notStarted,
      );

  /// Heart Lesson - Learn about heart structure (LOCKED - requires plant lesson)
  static Lesson get heartLesson => const Lesson(
        id: 'lesson_heart',
        titleKey: 'lessons.heart.title',
        descriptionKey: 'lessons.heart.description',
        difficulty: LessonDifficulty.intermediate,
        modelFileName: 'heart_model.glb',
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
            nameKey: 'lessons.heart.parts.left_atrium',
            descriptionKey: 'lessons.heart.parts.left_atrium_description',
            modelPartId: 'left_atrium_mesh',
            voiceFile: 'heart_left_atrium_explanation.mp3',
            position: [-0.2, 0.3, 0.1],
          ),
          LessonAnnotation(
            id: 'annotation_left_ventricle',
            nameKey: 'lessons.heart.parts.left_ventricle',
            descriptionKey: 'lessons.heart.parts.left_ventricle_description',
            modelPartId: 'left_ventricle_mesh',
            voiceFile: 'heart_left_ventricle_explanation.mp3',
            position: [-0.2, -0.2, 0.1],
          ),
          LessonAnnotation(
            id: 'annotation_right_atrium',
            nameKey: 'lessons.heart.parts.right_atrium',
            descriptionKey: 'lessons.heart.parts.right_atrium_description',
            modelPartId: 'right_atrium_mesh',
            voiceFile: 'heart_right_atrium_explanation.mp3',
            position: [0.2, 0.3, 0.1],
          ),
          LessonAnnotation(
            id: 'annotation_right_ventricle',
            nameKey: 'lessons.heart.parts.right_ventricle',
            descriptionKey: 'lessons.heart.parts.right_ventricle_description',
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
  static List<Lesson> get allLessons => [
        cellLesson,
        plantLesson,
        heartLesson,
      ];

  /// Initialize sample data in storage (for testing)
  static Future<void> initializeSampleData(
    Future<void> Function(Lesson) saveLessonFn,
  ) async {
    for (final lesson in allLessons) {
      await saveLessonFn(lesson);
    }
  }
}
