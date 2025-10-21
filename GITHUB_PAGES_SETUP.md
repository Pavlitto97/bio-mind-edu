# 🚀 GitHub Pages Deployment Guide

## ✅ Що вже зроблено:

1. ✅ Код запушено на GitHub: https://github.com/Pavlitto97/bio-mind-edu
2. ✅ Створено GitHub Actions workflow для автоматичного деплою
3. ✅ Android APK збілдовано: `biomind_edu/build/app/outputs/flutter-apk/app-release.apk` (66 MB)

## 📋 Наступні кроки (виконати вручну):

### 1. Увімкнути GitHub Pages

Перейдіть на: https://github.com/Pavlitto97/bio-mind-edu/settings/pages

**Налаштування:**
- **Source:** Deploy from a branch → змініть на **GitHub Actions**
- Натисніть **Save**

### 2. Запустити GitHub Actions

Workflow автоматично запуститься після push, але можна запустити вручну:

1. Перейдіть: https://github.com/Pavlitto97/bio-mind-edu/actions
2. Виберіть workflow **Deploy Flutter Web to GitHub Pages**
3. Натисніть **Run workflow** → **Run workflow**

### 3. Дочекатися завершення деплою

- Процес займе ~3-5 хвилин
- Після завершення сайт буде доступний за адресою:

**🌐 https://pavlitto97.github.io/bio-mind-edu/**

## 📱 Android APK

**Локація APK файлу:**
```
biomind_edu/build/app/outputs/flutter-apk/app-release.apk
```

**Розмір:** 66.0 MB

**Встановлення на Android:**
1. Скопіюйте файл на пристрій
2. Увімкніть "Install from unknown sources" в налаштуваннях
3. Запустіть APK для встановлення

## 🔧 Технічні деталі:

### GitHub Actions Workflow:
- **Тригер:** Push в гілку `main` або Manual trigger
- **Flutter версія:** 3.24.0 (stable)
- **Build команда:** `flutter build web --release --base-href /bio-mind-edu/`
- **Deploy:** Використовує `actions/deploy-pages@v4`

### Web Build налаштування:
- Base href: `/bio-mind-edu/` (для коректної роботи на subdomain)
- Release mode (optimized)
- Tree-shaking для іконок (економія розміру)

## ⚠️ Відомі проблеми Android:

При білді видано попередження про NDK версії:
- Рекомендована версія: 27.0.12077973
- Поточна версія: 26.3.11579264

**Виправлення (опціонально):**
Додайте в `android/app/build.gradle.kts`:
```kotlin
android {
    ndkVersion = "27.0.12077973"
}
```

## 📊 Результати:

- ✅ **GitHub Repository:** https://github.com/Pavlitto97/bio-mind-edu
- ⏳ **GitHub Pages:** https://pavlitto97.github.io/bio-mind-edu/ (після активації)
- ✅ **Android APK:** `app-release.apk` (66 MB)
- ✅ **Commits:** 2 commits pushed to main
- ✅ **GitHub Actions:** Workflow готовий до запуску

## 🎯 Тестування після деплою:

1. Відкрийте https://pavlitto97.github.io/bio-mind-edu/
2. Перевірте що відображаються:
   - ✅ Список уроків (Cell, Plant, Heart)
   - ✅ 3D моделі
   - ✅ Popup з описами елементів (з емодзі)
   - ✅ TTS озвучка працює (кнопка Replay)
3. Протестуйте всі 3 уроки

## 📝 Додаткові команди:

### Перебілдити Web локально:
```bash
cd biomind_edu
flutter build web --release
```

### Перебілдити Android APK:
```bash
cd biomind_edu
flutter build apk --release
```

### Перевірити статус GitHub Actions:
```bash
gh run list # потребує GitHub CLI
```

---

**Створено:** 22 жовтня 2025  
**Статус:** ✅ Готово до активації GitHub Pages
