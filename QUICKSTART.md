# ⚡ Quick Start - Что сделать прямо сейчас

## 1️⃣ Завершите настройку Android SDK (5 минут)

### Вариант A: Через Android Studio (рекомендуется)
1. Откройте **Android Studio**
2. **Android Studio** → **Preferences** (или **Settings** на Windows/Linux)
3. **Appearance & Behavior** → **System Settings** → **Android SDK**
4. Перейдите на вкладку **"SDK Tools"**
5. Найдите и отметьте ☑️ **"Android SDK Command-line Tools"**
6. Нажмите **"Apply"** → **"OK"**
7. Дождитесь завершения установки

### Вариант B: Через терминал
```bash
# Откройте Android Studio SDK Manager через терминал
open -a "Android Studio"
```

## 2️⃣ Примите Android лицензии (2 минуты)

После установки cmdline-tools:
```bash
flutter doctor --android-licenses
```

Нажимайте **"y"** для принятия всех лицензий.

## 3️⃣ Проверьте что всё работает (1 минута)

```bash
cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu
flutter doctor -v
```

**Ожидаемый результат**: Все категории должны показывать ✅ (зеленые галочки)

## 4️⃣ Установите зависимости Flutter (2 минуты)

```bash
cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu
flutter pub get
```

## 5️⃣ Запустите тестовое приложение (3 минуты)

### На эмуляторе:
```bash
# Список доступных эмуляторов
flutter emulators

# Запуск эмулятора (замените на ваш ID)
flutter emulators --launch <emulator_id>

# Запуск приложения
flutter run
```

### На Chrome (Web):
```bash
flutter run -d chrome
```

## 🎉 Готово!

Если всё работает, вы увидите:
- Flutter default app с счётчиком
- Возможность hot reload с **"r"**
- Возможность hot restart с **"R"**

## 📱 Следующие шаги для AR разработки

### Обязательно для AR тестирования:
1. **Физическое устройство** с ARCore (Android) или ARKit (iOS)
2. **ARCore Services** установлены на Android устройстве
3. **Разрешения камеры** в настройках устройства

### Запуск на физическом устройстве:

**Android**:
```bash
# Включите USB debugging на устройстве
# Подключите USB кабель
flutter devices
flutter run -d <android_device_id>
```

**iOS**:
```bash
# Подключите iPhone/iPad
# Настройте Signing в Xcode
flutter run -d <ios_device_id>
```

## 🆘 Проблемы?

### Flutter doctor показывает ошибки?
→ Смотрите **SETUP_INSTRUCTIONS.md** раздел "Troubleshooting"

### Не можете запустить эмулятор?
```bash
# Android
flutter emulators --launch Pixel_5_API_31

# iOS
open -a Simulator
```

### Ошибки при flutter pub get?
```bash
flutter clean
flutter pub get
```

## 📚 Дальше читайте:

- **PROJECT_SUMMARY.md** - что было сделано и план дальнейших действий
- **README.md** - общая информация о проекте
- **.specify/specs/001-biomind-mvp/spec.md** - детальная спецификация
- **.specify/specs/001-biomind-mvp/plan.md** - план разработки
- **SETUP_INSTRUCTIONS.md** - полные инструкции по настройке

## 🎯 Готовы начать разработку?

Выполните Spec-Kit команды:
```bash
# В AI assistant (GitHub Copilot Chat)
/speckit.constitution    # Создайте принципы проекта
/speckit.tasks          # Разбейте план на задачи
/speckit.implement      # Начните реализацию
```

---

**Время выполнения: ~15 минут**  
**Результат: Полностью настроенное окружение для Flutter + AR разработки** 🚀
