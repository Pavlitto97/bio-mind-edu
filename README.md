# 🧬 BioMindEDU

Мобильное и веб-приложение для обучения биологии детей 3-8 лет с использованием дополненной реальности (AR).

![Flutter](https://img.shields.io/badge/Flutter-3.32+-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.8+-0175C2?logo=dart)
![License](https://img.shields.io/badge/License-MIT-green)

## 🎯 Цели проекта

- Создать цифровую платформу для обучения биологии с использованием AR
- Демократизировать доступ к высококачественным инструментам раннего STEM-образования
- Сделать обучение биологии увлекательным через 3D-визуализации, геймификацию и озвученные инструкции

## ✨ Основные функции MVP

- **AR-контент**: 3 интерактивные AR-сцены (клетка, растение, сердце)
- **Интерактивные задания**: Drag-and-drop механика для закрепления знаний
- **Голосовое сопровождение**: Озвученные инструкции и объяснения
- **Мини-тесты**: Оценка усвоения материала (5-7 вопросов)
- **Система наград**: Виртуальные стикеры и значки
- **Отчет о прогрессе**: Статистика для родителей и педагогов

## 🛠 Технологический стек

### Frontend Framework
- **Flutter 3.32+** - кросс-платформенный фреймворк
- **Dart 3.8+** - язык программирования

### AR Technologies
- `ar_flutter_plugin` - унифицированный ARCore/ARKit plugin
- ARCore для Android
- ARKit для iOS

### 3D & Визуализация
- `flutter_cube` - 3D модели
- `model_viewer_plus` - Model Viewer для Web
- GLTF/GLB формат для 3D assets

### База данных
- **Hive** - локальная NoSQL база
- **Firebase Firestore** - облачная синхронизация (опционально)
- **Shared Preferences** - настройки

### Аудио
- `audioplayers` - воспроизведение звуков
- `flutter_tts` - Text-to-Speech для озвучки
- `just_audio` - продвинутый аудио плеер

### State Management
- `riverpod` / `flutter_bloc` - управление состоянием

### AI Development Tools
- **Context7 MCP** - AI context management для GitHub Copilot (настроен)

### Анимации
- `rive` - интерактивные анимации
- `lottie` - Lottie анимации
- `flutter_animate` - утилиты для анимаций

### Firebase Services
- Firebase Core
- Cloud Firestore
- Firebase Analytics

## 🚀 Быстрый старт

### Предварительные требования

- Flutter SDK 3.32+
- Dart SDK 3.8+
- Android Studio (для Android разработки)
- Xcode (для iOS разработки, macOS only)
- CocoaPods (macOS only)
- Физическое устройство с поддержкой AR

### Установка

1. **Клонируйте репозиторий:**
```bash
git clone https://github.com/yourusername/biomind-edu.git
cd biomind-edu/BioMindEDU/biomind_edu
```

2. **Установите зависимости:**
```bash
flutter pub get
```

3. **Настройте Firebase** (опционально):
```bash
# Установите FlutterFire CLI
dart pub global activate flutterfire_cli

# Настройте Firebase проект
flutterfire configure
```

4. **Запустите приложение:**
```bash
# На Android
flutter run -d android

# На iOS
flutter run -d ios

# На Web (без AR)
flutter run -d chrome
```

### Проверка окружения

```bash
flutter doctor -v
```

Убедитесь что установлены:
- ✅ Flutter SDK
- ✅ Android toolchain
- ✅ Xcode (macOS)
- ✅ CocoaPods (macOS)
- ✅ VS Code / Android Studio
- ✅ Connected device

## 📱 Платформы

| Платформа | Статус | AR Support | Минимальная версия |
|-----------|--------|------------|-------------------|
| Android   | ✅ Поддерживается | ARCore | Android 7.0+ (API 24+) |
| iOS       | ✅ Поддерживается | ARKit | iOS 12.0+ |
| Web       | ⚠️ Ограничено | ❌ Только 3D viewer | Modern browsers |

## 🏗 Архитектура проекта

```
biomind_edu/
├── lib/
│   ├── core/              # Общие утилиты, константы, сервисы
│   ├── features/          # Функциональные модули (Clean Architecture)
│   │   ├── ar_lesson/
│   │   ├── interactive_task/
│   │   ├── assessment/
│   │   ├── progress/
│   │   └── rewards/
│   └── shared/            # Переиспользуемые компоненты
├── assets/
│   ├── 3d_models/         # GLTF/GLB модели
│   ├── audio/             # Аудио файлы
│   ├── images/            # Изображения
│   └── animations/        # Rive/Lottie анимации
└── test/                  # Тесты
```

## 📊 Development Roadmap

- [x] Phase 0: Research & Setup
- [x] Spec & Plan creation
- [ ] Phase 1: Core AR Infrastructure
- [ ] Phase 2: First Complete Lesson (Клетка)
- [ ] Phase 3: Content Expansion (Растение, Сердце)
- [ ] Phase 4: Progress & Polish
- [ ] Phase 5: Testing & MVP Release

## 🧪 Тестирование

```bash
# Unit tests
flutter test

# Widget tests
flutter test test/widget/

# Integration tests
flutter test integration_test/

# Coverage report
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## 📝 Спецификация

Полная спецификация и план разработки находятся в:
- [Спецификация MVP](.specify/specs/001-biomind-mvp/spec.md)
- [План разработки](.specify/specs/001-biomind-mvp/plan.md)

## 🤝 Contributing

Проект использует **spec-driven development** подход с помощью [GitHub Spec Kit](https://github.com/github/spec-kit).

Основные команды:
```bash
# Создать спецификацию
/speckit.specify [описание функции]

# Создать план разработки
/speckit.plan [технические детали]

# Разбить на задачи
/speckit.tasks

# Выполнить реализацию
/speckit.implement
```

## 🤖 AI Development Tools

Проект использует **Context7 MCP** для улучшения работы с GitHub Copilot:
- ✅ Настроен в `.vscode/settings.json`
- ✅ Сохраняет контекст проекта между сессиями
- ✅ Улучшает качество подсказок Copilot
- 📚 См. [CONTEXT7_QUICKSTART.md](CONTEXT7_QUICKSTART.md) для деталей

**Использование:**
```
@context7 query "architecture"
@context7 store "Important project decision"
```

## 📄 Лицензия

MIT License - см. [LICENSE](LICENSE) файл

## 👥 Команда

- **Ivana Fedoronko** - Original concept and research
- [Ваше имя] - Development lead

## 📞 Контакты

- Website: [biomind-edu.com](https://biomind-edu.com) (coming soon)
- Email: contact@biomind-edu.com

---

**Создано с ❤️ для детей и их любопытных умов**

<div align="center">
  <sub>Powered by Flutter • ARCore • ARKit • Firebase</sub>
</div>
