# Implementation Plan: BioMindEDU MVP

**Branch**: `001-biomind-mvp` | **Date**: 2025-10-19 | **Spec**: [spec.md](./spec.md)
**Input**: Feature specification from `/specs/001-biomind-mvp/spec.md`

## Summary

Создание кросс-платформенного AR-приложения для обучения биологии детей 3-8 лет используя Flutter + ARCore/ARKit стек. MVP включает 3 AR-урока (клетка, растение, сердце) с интерактивными заданиями, тестами и системой наград.

## Technical Context

**Language/Version**: Dart 3.8+, Flutter 3.32+  
**Primary Dependencies**: 
  - AR: `ar_flutter_plugin` (унифицированный ARCore/ARKit)
  - 3D: `flutter_cube`, `model_viewer_plus`
  - Database: `hive`, `firebase_core`, `cloud_firestore`
  - Audio: `audioplayers`, `flutter_tts`
  - State: `riverpod` / `flutter_bloc`
  - Animations: `rive`, `lottie`

**Storage**: 
  - Local: Hive (NoSQL embedded database)
  - Cloud: Firebase Firestore (optional sync)
  - Assets: Local 3D models, audio files, images

**Testing**: 
  - Unit: `flutter_test`
  - Widget: `flutter_test`
  - Integration: `integration_test`
  - AR: Manual testing на physical devices

**Target Platform**: 
  - Android 7.0+ (API 24+) с ARCore
  - iOS 12.0+ с ARKit
  - Web: Limited 3D viewer (no AR)

**Project Type**: Mobile app (cross-platform)

**Performance Goals**: 
  - AR rendering: ≥30 FPS
  - Scene loading: <5 seconds
  - Memory usage: <200MB active
  - App size: <150MB

**Constraints**: 
  - COPPA compliance для children's app
  - Минимальное использование текста (голосовые инструкции)
  - Работа в offline mode для основного контента
  - Простой UI для детей 3-8 лет

**Scale/Scope**: 
  - MVP: 3 lessons
  - Expected users: 1000-5000 в первый месяц
  - Content: ~50-75MB 3D models + audio per lesson

## Constitution Check

*GATE: Must pass before Phase 0 research. Re-check after Phase 1 design.*

✅ **Code Quality**
- Следовать Flutter/Dart best practices
- Использовать linting (flutter_lints)
- Документировать public APIs

✅ **Testing Standards**
- Minimum 70% code coverage для business logic
- All AR features требуют manual testing на реальных устройствах
- Widget tests для всех UI components

✅ **User Experience**
- Все взаимодействия должны иметь feedback (visual + audio)
- Максимум 2 тапа до любой основной функции
- Голосовые инструкции для всех critical paths

✅ **Performance**
- Оптимизация 3D models (low-poly для mobile)
- Lazy loading для assets
- Мониторинг memory leaks

✅ **Security & Privacy**
- COPPA compliance
- Минимальный сбор данных
- Опциональная синхронизация с родительского согласия

## Project Structure

### Documentation (this feature)

```
specs/001-biomind-mvp/
├── plan.md              # This file
├── spec.md              # Feature specification
├── research.md          # Phase 0 research notes
├── data-model.md        # Database schema & models
├── quickstart.md        # Development guide
├── contracts/           # API & component contracts
└── tasks.md             # Implementation tasks
```

### Source Code (repository root)

```
biomind_edu/
├── lib/
│   ├── main.dart
│   ├── app.dart
│   ├── core/
│   │   ├── constants/
│   │   ├── theme/
│   │   ├── utils/
│   │   ├── extensions/
│   │   └── services/
│   ├── features/
│   │   ├── ar_lesson/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   ├── presentation/
│   │   │   └── widgets/
│   │   ├── interactive_task/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── assessment/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── progress/
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   └── rewards/
│   │       ├── data/
│   │       ├── domain/
│   │       └── presentation/
│   └── shared/
│       ├── models/
│       ├── widgets/
│       └── providers/
├── test/
│   ├── unit/
│   ├── widget/
│   └── integration/
├── assets/
│   ├── 3d_models/
│   ├── audio/
│   ├── images/
│   └── animations/
├── ios/
├── android/
├── web/
├── pubspec.yaml
└── analysis_options.yaml
```

**Structure Decision**: Использую Feature-first структуру (по функциональным модулям) с Clean Architecture внутри каждого feature. Это обеспечивает масштабируемость и четкое разделение ответственности. Shared содержит переиспользуемые компоненты.

## Architecture

### High-Level Architecture

```
┌─────────────────────────────────────┐
│         Presentation Layer          │
│  (Widgets, Pages, State Management) │
└─────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────┐
│          Domain Layer               │
│  (Use Cases, Entities, Repositories)│
└─────────────────────────────────────┘
                  ↓
┌─────────────────────────────────────┐
│           Data Layer                │
│  (Data Sources, Models, Repository  │
│   Implementations)                  │
└─────────────────────────────────────┘
                  ↓
    ┌──────────┬───────────┬──────────┐
    │          │           │          │
┌───▼───┐ ┌───▼────┐ ┌────▼───┐ ┌───▼────┐
│ Hive  │ │Firebase│ │ Assets │ │   AR   │
│ Local │ │ Remote │ │Storage │ │ Plugins│
└───────┘ └────────┘ └────────┘ └────────┘
```

### Key Technical Decisions

1. **State Management**: Riverpod
   - Более type-safe чем Provider
   - Лучше для тестирования
   - Compile-time safety

2. **Local Database**: Hive
   - Быстрее SQLite для нашего use case
   - Меньше boilerplate
   - Лучше для NoSQL структуры уроков

3. **AR Plugin**: `ar_flutter_plugin`
   - Unified API для ARCore/ARKit
   - Активная поддержка
   - Хорошая документация

4. **Audio**: `audioplayers`
   - Простой API
   - Хорошая производительность
   - Поддержка множественных аудио-потоков

5. **3D Rendering**: `flutter_cube` для AR, `model_viewer_plus` для Web fallback

## Development Phases

### Phase 0: Research & Setup (Week 1)
- Изучить AR plugins и limitations
- Определить формат 3D models (GLTF/GLB)
- Настроить development environment
- Подготовить тестовые устройства
- Создать Firebase project

### Phase 1: Core AR Infrastructure (Week 2-3)
- Реализовать AR view с ARCore/ARKit
- Создать систему загрузки 3D models
- Реализовать основные AR interactions (rotate, scale, tap)
- Добавить fallback 3D viewer
- Создать первую тестовую AR-сцену

### Phase 2: First Complete Lesson (Week 4-5)
- Реализовать урок "Клетка"
- Добавить аудио-сопровождение
- Создать интерактивное задание (drag-and-drop)
- Реализовать тест
- Добавить систему наград

### Phase 3: Расширение контента (Week 6)
- Добавить урок "Растение"
- Добавить урок "Сердце"
- Создать мультиязычность (EN, UK)

### Phase 4: Progress & Polish (Week 7)
- Реализовать tracking прогресса
- Добавить родительский раздел
- Firebase integration
- UI/UX improvements
- Accessibility features

### Phase 8: Testing & Release (Week 8)
- Integration testing
- Performance optimization
- User acceptance testing
- App Store preparation
- MVP Release

## Critical Dependencies & Packages

```yaml
# pubspec.yaml

dependencies:
  flutter:
    sdk: flutter
  
  # AR & 3D
  ar_flutter_plugin: ^1.0.1
  flutter_cube: ^0.1.1
  model_viewer_plus: ^1.7.1
  vector_math: ^2.1.4
  
  # State Management
  flutter_riverpod: ^2.5.1
  riverpod_annotation: ^2.3.5
  
  # Database
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  
  # Firebase
  firebase_core: ^3.10.0
  cloud_firestore: ^5.7.0
  firebase_analytics: ^11.4.1
  
  # Audio
  audioplayers: ^6.1.0
  flutter_tts: ^4.2.0
  just_audio: ^0.9.40
  
  # UI & Animations
  rive: ^0.13.22
  lottie: ^3.3.0
  flutter_animate: ^4.5.0
  
  # Utilities
  get_it: ^8.0.3
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0
  path_provider: ^2.1.5
  shared_preferences: ^2.3.5
  flutter_dotenv: ^5.2.1
  
  # Localization
  intl: ^0.19.0
  flutter_localizations:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  integration_test:
    sdk: flutter
  
  # Code Generation
  build_runner: ^2.4.13
  freezed: ^2.5.7
  json_serializable: ^6.8.0
  hive_generator: ^2.0.1
  riverpod_generator: ^2.4.3
```

## Next Steps

1. Run `/speckit.tasks` to break down into actionable tasks
2. Set up Flutter project with proper structure
3. Configure Firebase project
4. Acquire or create 3D models for 3 lessons
5. Record or source audio files
6. Begin Phase 0 research

## Notes

- Приоритет на Android development сначала (более простой AR setup)
- iOS testing требует physical device с ARKit
- Web version будет limited (3D viewer без AR)
- Рассмотреть использование Unity для более сложных AR features в future
