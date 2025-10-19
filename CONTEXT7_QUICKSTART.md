# Context7 Quick Start Guide

**Context7 MCP** настроен и готов к использованию в VS Code!

## ✅ Статус установки

- ✅ API Key: `ctx7sk-7e0d31e5-5a6d-4ebf-9494-c04f04edd307`
- ✅ Настроен в `.vscode/settings.json`
- ✅ Доступен через GitHub Copilot Chat
- ✅ Работает через `npx @upstash/context7-mcp`

## 🚀 Быстрый старт

### 1. Перезагрузите VS Code
```bash
# Cmd+Shift+P → "Developer: Reload Window"
# Или просто закройте и откройте VS Code
```

### 2. Проверьте Context7 в Copilot Chat
Откройте GitHub Copilot Chat и попробуйте:
```
@context7 list
```

Если команда работает - Context7 установлен правильно! ✅

## 📚 Основные команды

### Store (Сохранить контекст)
```
@context7 store "Important information to remember"
```

**Примеры для BioMindEDU:**
```
@context7 store "Project: BioMindEDU - AR educational app for kids 3-8 years old teaching biology"

@context7 store "Tech Stack: Flutter 3.32+, Dart 3.8+, Clean Architecture, Feature-first structure, Riverpod, Hive, Firebase"

@context7 store "AR Stack: ar_flutter_plugin (ARCore/ARKit), model_viewer_plus (fallback), GLTF/GLB models"

@context7 store "Performance: 30 FPS AR, <5s loading, <200MB RAM, <150MB app size"

@context7 store "Features: 3 AR lessons (cell, plant, heart), interactive tasks, voice guidance, tests, rewards"
```

### Query (Поиск по контексту)
```
@context7 query "What is the tech stack?"
@context7 query "performance requirements"
@context7 query "AR implementation details"
```

### List (Показать все контексты)
```
@context7 list
```

### Delete (Удалить контекст)
```
@context7 delete <context-id>
```

## 🎯 Рекомендуемые контексты для сохранения

### 1. Архитектура проекта
```
@context7 store "Architecture: Clean Architecture with 3 layers (Presentation, Domain, Data). Feature-first structure with features: ar_lesson, interactive_task, assessment, progress, rewards"
```

### 2. Ключевые решения
```
@context7 store "State Management: Riverpod chosen over Provider for type-safety and better testing"

@context7 store "Local DB: Hive chosen over SQLite for better performance with NoSQL lesson structure"

@context7 store "3D Format: GLTF/GLB with <50k polygons for mobile optimization"
```

### 3. Development phases
```
@context7 store "Phase 0 (Week 1): Research & Setup - AR plugin study, 3D models format, audio system"

@context7 store "Phase 1 (Week 2-3): Core AR Infrastructure - AR session manager, model loader, interactions"

@context7 store "Phase 2 (Week 4-5): First Complete Lesson - Cell lesson with AR, task, test, rewards"
```

### 4. Constraints & Requirements
```
@context7 store "Target: Android 7.0+ (API 24+) with ARCore, iOS 12.0+ with ARKit"

@context7 store "COPPA compliance required for children's app, minimal text (voice guidance), offline mode"

@context7 store "Success Criteria: 90% kids place AR model in 30s, 80% complete task with 1-2 attempts, <1% crash rate"
```

## 💡 Как это помогает

### До Context7:
```
You: Как мне реализовать AR scene?
Copilot: Вот пример с разными библиотеками...
```

### С Context7:
```
You: Как мне реализовать AR scene?
Copilot: Based on your project (BioMindEDU using ar_flutter_plugin), 
here's how to create AR scene with Clean Architecture:

lib/features/ar_lesson/presentation/ar_scene_page.dart
using ARManager service and model_loader_service...
```

## 🔧 Troubleshooting

### Context7 не работает?

1. **Проверьте npx доступен:**
```bash
npx --version
```

2. **Проверьте настройки VS Code:**
```bash
cat .vscode/settings.json | grep -A 10 "github.copilot.chat.mcp.servers"
```

3. **Перезагрузите VS Code:**
```
Cmd+Shift+P → "Developer: Reload Window"
```

4. **Проверьте логи MCP:**
```
Cmd+Shift+P → "GitHub Copilot: Show MCP Logs"
```

### API Key не работает?

Проверьте что в `.vscode/settings.json` правильный ключ:
```json
"env": {
  "CONTEXT7_API_KEY": "ctx7sk-7e0d31e5-5a6d-4ebf-9494-c04f04edd307"
}
```

## 🎓 Best Practices

### 1. Сохраняйте важные решения сразу
```
# Сразу после принятия архитектурного решения:
@context7 store "Decision: Using Riverpod instead of BLoC for simpler state management and better testability. Decided on 2025-10-19"
```

### 2. Используйте короткие, но конкретные описания
```
✅ Good: "AR models: GLTF format, <50k polygons, stored in assets/3d_models/"
❌ Bad: "We use 3D models"
```

### 3. Группируйте связанную информацию
```
@context7 store "Audio System: audioplayers for effects, flutter_tts for voice, just_audio for background. Formats: MP3 (Android), AAC (iOS). Stored in assets/audio/{lang}/"
```

### 4. Обновляйте контекст при изменениях
```
# Если изменили решение:
@context7 store "Updated: Using ar_flutter_plugin from Git (not pub.dev) due to version compatibility. URL: github.com/CariusLars/ar_flutter_plugin"
```

## 📊 Полезность для BioMindEDU

Context7 особенно полезен для:
- 🎯 **43 tasks** - Copilot помнит зависимости и требования
- 🏗️ **Clean Architecture** - Подсказки соответствуют структуре
- 📱 **Flutter specifics** - Правильный синтаксис и паттерны
- 🔄 **Code reviews** - Проверка соответствия архитектуре
- 📚 **Documentation** - Автоматические комментарии в стиле проекта

## 🚀 Готово!

Context7 MCP установлен и настроен. После перезагрузки VS Code можете использовать `@context7` в GitHub Copilot Chat для управления контекстом проекта.

**Следующий шаг**: Сохраните ключевую информацию о проекте используя команды выше! 🎉
