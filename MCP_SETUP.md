# BioMindEDU - Полезные MCP серверы для разработки

## Установленные MCP серверы

### 1. GitHub MCP (уже доступен)
- Управление issues, PRs, workflows
- Полезен для collaborative development

### 2. Browser MCP (Playwright)
Для тестирования веб-версии Flutter Web приложения:
```bash
npx @playwright/test --version
```

### 3. GitKraken MCP
Для управления workspace и репозиториями:
- Просмотр workspace
- Получение файлов из репозитория

## Рекомендуемые MCP для Flutter разработки

### Для отладки и тестирования:
1. **Flutter DevTools MCP** (если доступен)
   - Инспекция виджетов
   - Performance profiling
   - Memory analysis

2. **Firebase MCP** (если доступен)
   - Управление Firestore
   - Analytics
   - Remote Config

### Для AR разработки:
1. **Unity MCP** (если планируете масштабировать AR features)
2. **Blender MCP** (для работы с 3D моделями)

## Настройка VS Code для Flutter

### Расширения (уже установлены):
- ✅ Dart
- ✅ Flutter

### Дополнительные рекомендуемые расширения:
```json
{
  "recommendations": [
    "dart-code.dart-code",
    "dart-code.flutter",
    "alexisvt.flutter-snippets",
    "jeroen-meijer.pubspec-assist",
    "felixangelov.bloc"
  ]
}
```

## Flutter Doctor checklist

Выполните команду для проверки:
```bash
flutter doctor -v
```

Убедитесь что установлены:
- ✅ Flutter SDK
- ✅ Android toolchain (Android Studio + SDK)
- ✅ Xcode (для iOS)
- ✅ CocoaPods
- ✅ Chrome (для web debug)
- ✅ VS Code + extensions

## Полезные команды

### Разработка:
```bash
# Запуск на эмуляторе/устройстве
flutter run

# Запуск с hot reload
flutter run --hot

# Проверка проблем
flutter doctor

# Анализ кода
flutter analyze

# Форматирование
dart format .

# Тесты
flutter test
flutter test --coverage

# Build
flutter build apk
flutter build ios
flutter build web
```

### Зависимости:
```bash
# Установка зависимостей
flutter pub get

# Обновление зависимостей
flutter pub upgrade

# Проверка устаревших пакетов
flutter pub outdated

# Code generation (для Riverpod, Freezed, etc)
dart run build_runner build
dart run build_runner watch
```

### Отладка AR:
```bash
# Включить verbose logging
flutter run --verbose

# Запуск на физическом устройстве (AR требует реальное устройство)
flutter devices
flutter run -d <device-id>

# Logcat для Android
adb logcat | grep flutter

# iOS logs
idevicesyslog | grep flutter
```

## ✅ Context7 MCP (Upstash) - УСТАНОВЛЕН

**Описание**: AI Context Management от Upstash для управления контекстом в AI приложениях

**URL**: https://github.com/upstash/context7

**Статус**: ✅ Настроен в VS Code на уровне IDE

**API Key**: `ctx7sk-7e0d31e5-5a6d-4ebf-9494-c04f04edd307`

### Функциональность:
- 🧠 Управление долговременным контекстом для AI
- 💾 Хранение и извлечение релевантного контекста
- ⚡ Оптимизация token usage
- 🤖 Интеграция с AI agents и GitHub Copilot
- 📚 Векторное хранилище для семантического поиска

### Установка в VS Code:

Context7 MCP настроен в `.vscode/settings.json`:

```json
"github.copilot.chat.mcp.servers": {
  "context7": {
    "command": "npx",
    "args": ["-y", "@upstash/context7-mcp"],
    "env": {
      "CONTEXT7_API_KEY": "ctx7sk-7e0d31e5-5a6d-4ebf-9494-c04f04edd307"
    }
  }
}
```

### Как использовать:

#### 1. В VS Code GitHub Copilot Chat:
```
@context7 store "User prefers Clean Architecture with Feature-first structure"
@context7 query "What architecture does the user prefer?"
@context7 list
```

#### 2. Полезные команды:
- **Store context**: Сохранить информацию в долговременный контекст
- **Query context**: Найти релевантную информацию из контекста
- **List contexts**: Показать все сохраненные контексты
- **Delete context**: Удалить контекст по ID

#### 3. Примеры использования в BioMindEDU:

```bash
# Сохранить ключевые архитектурные решения
@context7 store "BioMindEDU uses Flutter 3.32+ with Clean Architecture, Feature-first structure, Riverpod for state management, Hive for local database"

# Сохранить требования к производительности
@context7 store "AR rendering must be ≥30 FPS, scene loading <5 seconds, memory <200MB, app size <150MB"

# Сохранить важные решения
@context7 store "Using ar_flutter_plugin from Git, model_viewer_plus for 3D fallback, GLTF/GLB for 3D models"

# Запросить информацию при разработке
@context7 query "What are the performance requirements for AR rendering?"
@context7 query "Which state management solution is used?"
```

### Использование в коде Flutter:

```dart
// В main.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Загрузить .env
  await dotenv.load();
  
  // Получить API key (если нужно использовать Context7 из приложения)
  final context7ApiKey = dotenv.env['CONTEXT7_API_KEY'];
  
  runApp(MyApp());
}
```

### Преимущества для разработки:
- ✅ Copilot помнит архитектурные решения проекта
- ✅ Автоматические подсказки соответствуют вашему стеку
- ✅ Контекст сохраняется между сессиями
- ✅ Уменьшается повторение инструкций

**Примечание**: 
- API key передается напрямую в VS Code settings (не через .env для IDE)
- `.env` файл используется для Flutter приложения
- Context7 автоматически доступен через GitHub Copilot Chat после перезагрузки VS Code

## Настройка для AR разработки

### Android (ARCore):
1. Убедитесь что устройство поддерживает ARCore
2. Установите ARCore Services из Google Play
3. В `android/app/build.gradle`:
```gradle
minSdkVersion 24 // ARCore требует минимум API 24
```

### iOS (ARKit):
1. Убедитесь что устройство поддерживает ARKit (iPhone 6S+)
2. В `ios/Podfile`:
```ruby
platform :ios, '12.0' # ARKit требует iOS 12+
```

3. В `Info.plist`:
```xml
<key>NSCameraUsageDescription</key>
<string>Это приложение использует камеру для дополненной реальности</string>
```

## Firebase Setup

1. Создайте Firebase project на https://console.firebase.google.com
2. Добавьте Android app:
   - Package name: `com.biomind.biomind_edu`
   - Download `google-services.json` → `android/app/`
3. Добавьте iOS app:
   - Bundle ID: `com.biomind.biomindEdu`
   - Download `GoogleService-Info.plist` → `ios/Runner/`
4. Установите FlutterFire CLI:
```bash
dart pub global activate flutterfire_cli
flutterfire configure
```
