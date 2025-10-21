# ⚡️ Швидкий старт: IPA для iPhone

## 🎯 Проблема
Flutter вимагає фізичний iPhone або симулятор для збірки, навіть з `--no-codesign`.

## ✅ Рішення: 3 простих кроки

### Крок 1️⃣: Підключіть iPhone до Mac через USB

1. З'єднайте iPhone з Mac USB кабелем
2. На iPhone: Розблокуйте екран
3. Коли з'явиться "Довіряти цьому комп'ютеру?" → натисніть **Довіряти**
4. Введіть код-пароль iPhone

### Крок 2️⃣: Перевірте, чи iPhone видимий

```bash
# У терміналі:
flutter devices
```

Ви повинні побачити щось типу:
```
iPhone (mobile) • 00008030-001234567890ABCD • ios • iOS 17.5
```

### Крок 3️⃣: Створіть IPA

Тепер, коли iPhone підключений, виконайте:

```bash
cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu

# Очистити
flutter clean

# Отримати залежності
flutter pub get

# Збірка БЕЗ підпису (працює тільки з підключеним iPhone)
flutter build ios --release --no-codesign

# Знайти Runner.app
cd build/ios/iphoneos

# Створити Payload структуру
mkdir -p Payload
cp -r Runner.app Payload/

# Створити IPA (це просто ZIP файл)
zip -r ../../../BioMindEDU.ipa Payload

# Очистити
rm -rf Payload

echo "✅ IPA створено: $(pwd)/../../../BioMindEDU.ipa"
```

---

## 📤 Відправка в Telegram

### Варіант A: З комп'ютера
```bash
# Знайти IPA
open /Users/user/Projects/BioMind/BioMindEDU/biomind_edu

# Перетягнути BioMindEDU.ipa в Telegram
```

### Варіант B: З терміналу (якщо використовуєте Telegram Desktop)
```bash
# Скопіювати в Downloads для легкого знаходження
cp /Users/user/Projects/BioMind/BioMindEDU/biomind_edu/BioMindEDU.ipa ~/Downloads/

# Відкрити папку
open ~/Downloads
```

---

## 📲 Встановлення IPA на iPhone

Тепер використовуйте **Sideloadly**:

1. **Завантажити Sideloadly**: https://sideloadly.io/
2. **Відкрити Sideloadly**
3. **Перетягнути** `BioMindEDU.ipa` у вікно
4. **Ввести Apple ID** (ваш звичайний, безкоштовний)
5. **Вибрати iPhone** зі списку
6. **Натиснути Start**
7. **Дочекатися завершення** (~1-2 хв)

### На iPhone:
1. Налаштування → Основні → VPN та керування пристроєм
2. Developer App → [ваш email]
3. Довіряти

**Готово!** BioMindEDU тепер на вашому iPhone! 🎉

---

## 🔄 Повторне підписання (кожні 7 днів)

Безкоштовний Apple ID дає лише **7 днів підпису**.

Через 7 днів:
1. Підключіть iPhone
2. Відкрийте Sideloadly
3. Повторіть кроки 3-7 вище
4. Дані НЕ видаляться!

---

## 🚀 Альтернатива: Web версія (рекомендую)

Якщо не хочете морочитися кожні 7 днів:

```bash
cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu

# Збірка web
flutter build web --release

# Деплой на безкоштовний хостинг
# Firebase / Netlify / Vercel / GitHub Pages
```

Потім просто шеріть **посилання** в Telegram:
```
https://biomind-edu.web.app
```

**Працює на iPhone, Android, Desktop - без встановлення!**

---

## ❓ Troubleshooting

### "Unable to find a destination"
→ Підключіть iPhone через USB і перевірте `flutter devices`

### "iOS 18.0 is not installed"
→ Це помилка, ігноруйте. Просто підключіть iPhone.

### "Could not find Runner.app"
→ Збірка не вдалася. Перевірте, чи iPhone підключений і розблокований.

### "Lockdown Error" у Sideloadly
→ На iPhone: Довіряйте цьому комп'ютеру (Settings)

---

## 📊 Порівняння методів

| Метод | Вартість | Зусилля | Тривалість |
|-------|----------|---------|-----------|
| **IPA + Sideloadly** | 🆓 | ⭐️⭐️ | 7 днів |
| **TestFlight** | $99/рік | ⭐️⭐️⭐️ | 90 днів |
| **Web версія** | 🆓 | ⭐️ | ♾️ |

**Моя рекомендація**: Web версія для швидкого шерінгу в Telegram! 🚀
