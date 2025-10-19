# 🚀 Полная инструкция по setup BioMindEDU на macOS

## ✅ Что уже установлено

- ✅ Flutter SDK 3.32.6
- ✅ Dart 3.8.1
- ✅ Android Studio 2025.1
- ✅ Xcode 16.0
- ✅ CocoaPods 1.16.2
- ✅ VS Code с расширениями Dart и Flutter
- ✅ Homebrew
- ✅ Git
- ✅ spec-kit (Specify CLI)
- ✅ Chrome для web debugging

## ⚠️ Требует внимания

### 1. Android SDK Command Line Tools

**Проблема**: Отсутствует cmdline-tools компонент

**Решение**:
1. Откройте Android Studio
2. Preferences → Appearance & Behavior → System Settings → Android SDK
3. Перейдите на вкладку "SDK Tools"
4. Отметьте "Android SDK Command-line Tools"
5. Нажмите "Apply" → "OK"

Альтернативно через терминал:
```bash
# Установите через sdkmanager
cd ~/Library/Android/sdk
mkdir -p cmdline-tools
cd cmdline-tools
# Скачайте latest command line tools с https://developer.android.com/studio#command-line-tools-only
wget https://dl.google.com/android/repository/commandlinetools-mac-11076708_latest.zip
unzip commandlinetools-mac-*.zip
mv cmdline-tools latest
```

### 2. Android Licenses

После установки cmdline-tools:
```bash
flutter doctor --android-licenses
# Принимайте все лицензии нажимая 'y'
```

### 3. Xcode Simulators (опционально)

Если хотите использовать iOS симуляторы:
```bash
xcodebuild -downloadPlatform iOS
```

## 📦 Установка зависимостей для BioMindEDU

### 1. Перейдите в папку проекта Flutter:
```bash
cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu
```

### 2. Установите зависимости:
```bash
flutter pub get
```

### 3. Проверьте установку:
```bash
flutter doctor -v
```

Все категории должны показать ✅ (кроме connected device - это нормально)

## 🔥 Настройка Firebase

### 1. Создайте Firebase проект:
1. Перейдите на https://console.firebase.google.com
2. Нажмите "Add project"
3. Имя проекта: `biomind-edu`
4. Включите Google Analytics (опционально)

### 2. Установите FlutterFire CLI:
```bash
dart pub global activate flutterfire_cli
```

### 3. Настройте Firebase в проекте:
```bash
cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu
flutterfire configure
```

Выберите:
- Project: biomind-edu
- Platforms: Android, iOS, Web
- Package name: com.biomind.biomind_edu

### 4. Добавьте Firebase dependencies в pubspec.yaml:
```yaml
dependencies:
  firebase_core: ^3.10.0
  cloud_firestore: ^5.7.0
  firebase_analytics: ^11.4.1
```

Затем:
```bash
flutter pub get
```

## 📱 Настройка для AR разработки

### Android (ARCore):

1. **Обновите android/app/build.gradle**:
```gradle
android {
    defaultConfig {
        minSdkVersion 24  // ARCore требует минимум API 24
        targetSdkVersion 34
    }
}
```

2. **Добавьте в AndroidManifest.xml**:
```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-feature android:name="android.hardware.camera.ar" android:required="true" />

<application>
    <meta-data
        android:name="com.google.ar.core"
        android:value="required" />
</application>
```

### iOS (ARKit):

1. **Обновите ios/Podfile**:
```ruby
platform :ios, '12.0'  # ARKit требует iOS 12+
```

2. **Добавьте в Info.plist**:
```xml
<key>NSCameraUsageDescription</key>
<string>Это приложение использует камеру для дополненной реальности</string>
<key>NSMicrophoneUsageDescription</key>
<string>Это приложение использует микрофон для записи звука</string>
```

3. **Установите pods**:
```bash
cd ios
pod install
cd ..
```

## 🎨 Установка AR и 3D зависимостей

Создайте или обновите `pubspec.yaml`:

```yaml
name: biomind_edu
description: AR-приложение для обучения биологии детей 3-8 лет
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: ^3.8.0

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
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
  
  # Firebase (после настройки)
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
  intl: ^0.19.0

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

flutter:
  uses-material-design: true
  
  assets:
    - assets/3d_models/
    - assets/audio/
    - assets/images/
    - assets/animations/

  fonts:
    - family: ComicNeue
      fonts:
        - asset: assets/fonts/ComicNeue-Regular.ttf
        - asset: assets/fonts/ComicNeue-Bold.ttf
          weight: 700
```

Затем установите все зависимости:
```bash
flutter pub get
```

## 🧪 Проверка работоспособности

### 1. Запуск на эмуляторе:
```bash
# Android
flutter emulators --launch <emulator_id>
flutter run

# iOS Simulator
open -a Simulator
flutter run
```

### 2. Запуск на физическом устройстве (для AR):

**Android:**
1. Включите "Developer options" и "USB debugging" на устройстве
2. Подключите устройство по USB
3. Запустите:
```bash
flutter devices
flutter run -d <android_device_id>
```

**iOS:**
1. Подключите iPhone/iPad по кабелю
2. Откройте Xcode и добавьте свой Apple ID в Preferences → Accounts
3. Выберите Development Team в проекте
4. Запустите:
```bash
flutter run -d <ios_device_id>
```

### 3. Проверка AR capabilities:
```bash
# На Android устройстве проверьте ARCore поддержку
adb shell pm list features | grep ar

# Должно показать: feature:android.hardware.camera.ar
```

## 🐛 Отладка и логи

```bash
# Verbose logging
flutter run --verbose

# Android logcat
flutter logs

# Или
adb logcat | grep flutter

# iOS logs (требует подключенного устройства)
idevicesyslog | grep flutter
```

## 📚 Полезные ресурсы

- [Flutter Documentation](https://docs.flutter.dev/)
- [ARCore Flutter Plugin](https://pub.dev/packages/ar_flutter_plugin)
- [Firebase for Flutter](https://firebase.flutter.dev/)
- [Riverpod Documentation](https://riverpod.dev/)
- [BioMindEDU Specification](.specify/specs/001-biomind-mvp/spec.md)

## 🎯 Следующие шаги

1. ✅ Завершите настройку Android SDK Command Line Tools
2. ✅ Примите Android licenses
3. ✅ Настройте Firebase проект
4. ✅ Установите все dependencies
5. ✅ Запустите тестовое приложение на эмуляторе
6. ✅ Протестируйте на физическом устройстве с AR поддержкой
7. 🚀 Начните разработку согласно [Implementation Plan](.specify/specs/001-biomind-mvp/plan.md)

## 📞 Поддержка

Если возникнут проблемы:
1. Проверьте `flutter doctor -v`
2. Посмотрите [Troubleshooting Guide](https://docs.flutter.dev/get-started/install/macos#troubleshooting)
3. Проверьте [Flutter GitHub Issues](https://github.com/flutter/flutter/issues)

---

**Успешной разработки! 🚀**
