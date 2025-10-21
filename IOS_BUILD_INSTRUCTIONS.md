# 📱 Інструкція: Створення iOS білда для BioMindEDU

## 🎯 Опції встановлення на iPhone/iPad

### Варіант 1: TestFlight (Рекомендовано) ✅

**Потрібно:**
- Apple Developer акаунт ($99/рік)
- Доступ до App Store Connect

**Кроки:**

1. **Налаштуйте Xcode:**
   ```bash
   cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu
   open ios/Runner.xcworkspace
   ```

2. **В Xcode:**
   - Виберіть `Runner` проект → `Signing & Capabilities`
   - Виберіть вашу Development Team
   - Bundle Identifier: `com.biomind.biomindEdu`
   - Automatic signing: Увімкнути

3. **Створіть архів:**
   - Product → Archive
   - Після успішної збірки відкриється Organizer
   - Натисніть `Distribute App`
   - Виберіть `TestFlight & App Store`
   - Виберіть `Upload`

4. **В App Store Connect:**
   - Зайдіть на https://appstoreconnect.apple.com
   - TestFlight → Внутрішнє тестування
   - Додайте тестерів (до 100 email адрес безкоштовно)
   - Тестери отримають запрошення на email

5. **Встановлення:**
   - Встановіть TestFlight на iPhone з App Store
   - Прийміть запрошення
   - Встановіть додаток через TestFlight

---

### Варіант 2: AltStore / Sideloadly (Без Apple Developer) 🆓

**Для будь-якого iPhone без джейлбрейку**

**Потрібно:**
- Windows/Mac комп'ютер
- AltStore або Sideloadly
- Apple ID (безкоштовний)

**Кроки:**

1. **Створіть .app файл в Xcode:**
   - Відкрийте: `open ios/Runner.xcworkspace`
   - Product → Scheme → Edit Scheme → Run → Info → Build Configuration → Release
   - Product → Clean Build Folder
   - Product → Build
   - Знайдіть .app в:
     ```
     /Users/user/Projects/BioMind/BioMindEDU/biomind_edu/build/ios/iphoneos/Runner.app
     ```

2. **Створіть IPA:**
   ```bash
   cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu/build/ios/iphoneos
   mkdir Payload
   cp -r Runner.app Payload/
   zip -r BioMindEDU.ipa Payload
   rm -rf Payload
   ```

3. **Встановіть через AltStore:**
   - Завантажте AltStore: https://altstore.io
   - Встановіть на iPhone
   - Відкрийте AltStore → My Apps → +
   - Виберіть BioMindEDU.ipa
   - Готово! (Треба перепідписувати кожні 7 днів)

4. **Або через Sideloadly:**
   - Завантажте: https://sideloadly.io
   - Підключіть iPhone
   - Перетягніть BioMindEDU.ipa
   - Введіть Apple ID
   - Встановіть

---

### Варіант 3: Ad-Hoc розповсюдження (З Developer акаунтом) 📦

**Для встановлення на конкретні пристрої**

**Потрібно:**
- Apple Developer акаунт ($99/рік)
- UDID пристроїв (до 100 на рік)

**Кроки:**

1. **Отримайте UDID iPhone:**
   - Підключіть iPhone до Mac
   - Відкрийте Finder → iPhone → Серійний номер (клацніть → покаже UDID)
   - Або через Xcode: Window → Devices and Simulators

2. **В Apple Developer:**
   - https://developer.apple.com/account
   - Certificates, Identifiers & Profiles
   - Devices → Register Device → Додайте UDID

3. **Створіть Provisioning Profile:**
   - Profiles → Ad Hoc
   - Виберіть App ID: com.biomind.biomindEdu
   - Виберіть Certificate
   - Виберіть Devices
   - Завантажте .mobileprovision

4. **В Xcode:**
   - Signing & Capabilities → Manual signing
   - Import Downloaded Profile
   - Product → Archive
   - Distribute → Ad Hoc
   - Export IPA

5. **Встановіть:**
   - Використайте Apple Configurator 2 (з Mac App Store)
   - Підключіть iPhone
   - Перетягніть IPA на пристрій

---

### Варіант 4: Simulator (Тільки для Mac тестування) 🖥️

**Якщо хочете просто подивитись на Mac**

```bash
cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu
flutter run -d "iPhone 15 Pro"
```

Або відкрийте iPhone Simulator і встановіть .app:
```bash
xcrun simctl install booted build/ios/iphonesimulator/Runner.app
```

---

## 🚀 Швидкий старт для відправки в Telegram

### Спосіб 1: Через TestFlight посилання (Краще)
1. Завантажте на TestFlight (див. Варіант 1)
2. Отримайте публічне посилання
3. Відправте в Telegram: `https://testflight.apple.com/join/XXXXXXXX`
4. Користувачі встановлюють через TestFlight

### Спосіб 2: Через .ipa файл (Для технічних користувачів)
1. Створіть IPA (див. Варіант 2, крок 2)
2. Завантажте на Google Drive / Dropbox
3. Відправте посилання в Telegram
4. Користувачі встановлюють через AltStore/Sideloadly

---

## ⚠️ Важливі примітки

### Без Apple Developer ($99/рік):
- ✅ Можна: AltStore/Sideloadly (безкоштовно, перепідпис кожні 7 днів)
- ✅ Можна: Поділитись .ipa файлом
- ❌ Не можна: TestFlight
- ❌ Не можна: App Store

### З Apple Developer:
- ✅ TestFlight (100 внутрішніх тестерів безкоштовно)
- ✅ Ad-Hoc (100 пристроїв на рік)
- ✅ App Store розповсюдження

### Безпека:
- AltStore/Sideloadly безпечні
- Використовують ваш власний Apple ID
- Не потрібен джейлбрейк
- Офіційно підтримуються спільнотою

---

## 📝 Поточний статус

✅ **Готово:**
- iOS проект налаштований
- Bundle ID: `com.biomind.biomindEdu`
- iOS Framework зібрано в: `build/ios_framework/`
- Xcode workspace відкрито: `ios/Runner.xcworkspace`

⏳ **Потрібно:**
- Вибрати метод розповсюдження
- Налаштувати підпис (якщо є Developer акаунт)
- Створити IPA або завантажити на TestFlight

---

## 🆘 Якщо виникли проблеми

### "No development certificates available"
→ Потрібен Apple Developer акаунт або використайте AltStore

### "iOS 18.0 is not installed"
→ Xcode → Settings → Components → Завантажте iOS 18.0

### "Unable to find destination"
→ Підключіть справжній iPhone або використайте Simulator

### Білд не створюється
→ Спробуйте:
```bash
cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu
flutter clean
flutter pub get
flutter build ios --release --no-codesign
```

---

## 💡 Рекомендація

**Для швидкого тестування:**
→ Використайте **AltStore** (безкоштовно, 10 хвилин налаштування)

**Для професійного використання:**
→ Оформіть **Apple Developer** + **TestFlight**

**Для швидкої демонстрації:**
→ **Web версія** вже працює! Просто надішліть посилання: http://localhost:8585

---

Створено: 21 жовтня 2025
Версія: BioMindEDU v1.0.0
