# 🔬 Де і як відображається cell_model.glb

## 📍 ТВОЯ МОДЕЛЬ: `biomind_edu/assets/3d_models/cell_model.glb`

---

## 🎯 УРОК: "Cell Structure" (Будова Клітини)

### 📊 Базова інформація про урок

**ID уроку:** `lesson_cell`  
**Назва:** "Cell Structure" (EN) / "Будова Клітини" (UK)  
**Опис:** "Explore the amazing world inside a living cell"  
**Складність:** Beginner (для дітей 3-5 років)  
**Тривалість:** ~12 хвилин  
**Порядок:** Урок №1 (перший, не заблокований)

---

## 🖼️ ЕТАП 1: Головний екран (Список уроків)

### Де побачиш:
**Файл:** `lib/features/ar_lesson/presentation/lessons_list_page.dart`

### Як виглядає:
```
┌─────────────────────────────────────┐
│  📱 BioMind EDU          🏆 ⚙️     │
├─────────────────────────────────────┤
│                                     │
│  ┌──────────┐    ┌──────────┐     │
│  │   🔬     │    │   🌱     │     │
│  │  CELL    │    │  PLANT   │     │  <- Картка клітини
│  │ Structure│    │  Life    │     │     (з thumbnail)
│  │          │    │  🔒      │     │
│  │ Beginner │    │ Locked   │     │
│  │ 12 min   │    │ 15 min   │     │
│  └──────────┘    └──────────┘     │
│                                     │
│  ┌──────────┐    ┌──────────┐     │
│  │   ❤️     │    │   🧬     │     │
│  │  HEART   │    │  More    │     │
│  │  🔒      │    │  Soon    │     │
│  └──────────┘    └──────────┘     │
└─────────────────────────────────────┘
```

### Що показується:
- **Thumbnail:** `assets/images/cell_thumbnail.png` (ти його вже створив!)
- **Заголовок:** "Cell Structure"
- **Опис:** "Explore the amazing world..."
- **Статус:** "Not Started" або "In Progress" або "Completed"
- **Кнопка:** "START LESSON" (щоб почати)

### Код відображення картки:
```dart
AnimatedLessonCard(
  lessonId: 'lesson_cell',
  titleKey: 'lessons.cell.title',
  thumbnailPath: 'assets/images/cell_thumbnail.png',
  difficulty: LessonDifficulty.beginner,
  status: LessonStatus.notStarted,
  isLocked: false,
  onTap: () {
    // Переходимо до AR екрану уроку
    Navigator.pushNamed('/ar-lesson', arguments: 'lesson_cell');
  },
)
```

---

## 🎮 ЕТАП 2: AR екран уроку (Основний перегляд 3D моделі)

### Де побачиш 3D модель:
**Файл:** `lib/features/ar_lesson/presentation/ar_lesson_page.dart`  
**Widget:** `ARViewWidget` (в `lib/features/ar_lesson/widgets/ar_view_widget.dart`)

### Як виглядає AR екран:
```
┌─────────────────────────────────────┐
│  ← Cell Structure           Info   │  <- Верхня панель
├─────────────────────────────────────┤
│                                     │
│         ╔═══════════╗              │
│         ║           ║              │
│         ║    🔵    ║              │  <- ТВОЯ 3D МОДЕЛЬ
│         ║   CELL   ║              │     cell_model.glb
│         ║  MODEL   ║              │     тут!
│         ║           ║              │
│         ╚═══════════╝              │
│                                     │
│     🔴 Nucleus   (tap to learn)    │  <- Анотації
│     ⚡ Mitochondria               │     (маркери частин)
│                                     │
├─────────────────────────────────────┤
│  [ℹ️ Info]  [➡️ Continue Task]     │  <- Нижня панель
└─────────────────────────────────────┘
```

### 🎨 ДВА РЕЖИМИ ВІДОБРАЖЕННЯ:

#### Режим 1: AR (якщо підтримується)
- **На пристроях з ARCore/ARKit**
- Камера показує реальний світ
- 3D модель клітини "розміщується" на поверхні
- Можна обертати телефон і ходити навколо моделі
- **Файл моделі:** `cell_model.glb` завантажується через ar_flutter_plugin

**Вигляд:**
```
┌─────────────────────────────────────┐
│  [Камера показує стіл/підлогу]     │
│                                     │
│          ╔═══════════╗             │
│   [Стіл] ║  3D CELL  ║ [Стілець]  │  <- Модель "стоїть"
│          ║   MODEL   ║             │     на реальному столі
│   [Підлога] ╚═══╝                  │
│                                     │
│  "Tap to place model"               │
└─────────────────────────────────────┘
```

#### Режим 2: 3D Viewer (fallback для веб/десктоп)
- **На веб, macOS, Windows**
- Темний фон
- 3D модель в центрі екрану
- Можна обертати свайпом/мишкою
- **Файл моделі:** `cell_model.glb` завантажується через model_viewer_plus

**Вигляд:**
```
┌─────────────────────────────────────┐
│  [Темний фон - чорний/сірий]       │
│                                     │
│          ╔═══════════╗             │
│          ║           ║             │
│          ║  🔵 3D   ║             │  <- Модель "плаває"
│          ║   CELL   ║             │     в просторі
│          ║  MODEL   ║             │
│          ║           ║             │
│          ╚═══════════╝             │
│                                     │
│  "Swipe to rotate"                  │
└─────────────────────────────────────┘
```

### 📦 Як завантажується модель:

**Крок 1: Урок передається в ARViewWidget**
```dart
ARViewWidget(
  lesson: cellLesson, // містить modelFileName: 'cell_model.glb'
  isArSupported: true, // або false
  onModelLoaded: () {
    // Модель завантажилась!
  },
  onError: (error) {
    // Помилка завантаження
  },
)
```

**Крок 2: Шлях до моделі формується**
```dart
// В коді:
final modelPath = 'assets/3d_models/${lesson.modelFileName}';
// Результат:
// 'assets/3d_models/cell_model.glb'
```

**Крок 3: Модель завантажується і відображається**
- **Для AR:** `ar_flutter_plugin` → ARView → відображає GLB
- **Для Web:** `model_viewer_plus` → ModelViewer → відображає GLB

---

## 🎯 ЕТАП 3: Інтерактивні анотації (частини клітини)

### Що відображається поверх 3D моделі:

Твоя модель `cell_model.glb` має **4 інтерактивні зони**:

```dart
annotations: [
  LessonAnnotation(
    id: 'annotation_nucleus',
    nameKey: 'Nucleus',           // 🔵 Ядро
    modelPartId: 'nucleus_mesh',  // <- Ця частина в твоїй GLB моделі!
    position: [0, 0.5, 0],        // Позиція маркера
  ),
  LessonAnnotation(
    id: 'annotation_membrane',
    nameKey: 'Membrane',          // 🟢 Мембрана
    modelPartId: 'membrane_mesh', // <- Ця частина в твоїй GLB моделі!
    position: [0.3, 0, 0.3],
  ),
  LessonAnnotation(
    id: 'annotation_mitochondria',
    nameKey: 'Mitochondria',      // 🔴 Мітохондрії
    modelPartId: 'mitochondria_mesh',
    position: [-0.2, 0.2, 0.1],
  ),
  LessonAnnotation(
    id: 'annotation_cytoplasm',
    nameKey: 'Cytoplasm',         // 🔵 Цитоплазма
    modelPartId: 'cytoplasm_mesh',
    position: [0.1, -0.3, -0.2],
  ),
]
```

### Візуалізація анотацій:
```
        🔵 Nucleus ← Маркер (можна натиснути)
           │
    ╔══════▼═════════╗
    ║   ┌──────┐     ║
    ║   │ 🔵  │     ║  Ядро (синє світло)
    ║   └──────┘     ║
    ║  🔴🔴         ║  Мітохондрії (червоні)
    ║    🔴          ║
    ╚════════════════╝
       Мембрана (зелена)
         
   💧 Цитоплазма ← Маркер
```

### Що відбувається при натисканні на маркер:

**1. З'являється попап з інформацією:**
```
┌─────────────────────────────────────┐
│  ╔═══════════════════════════════╗  │
│  ║  🔵 Nucleus                   ║  │
│  ║                               ║  │
│  ║  The nucleus is the control   ║  │
│  ║  center of the cell. It       ║  │
│  ║  contains DNA and directs     ║  │
│  ║  all cell activities.         ║  │
│  ║                               ║  │
│  ║  [🔊 Play Voice] [✓ Got it]  ║  │
│  ╚═══════════════════════════════╝  │
└─────────────────────────────────────┘
```

**2. Частина моделі підсвічується:**
- В твоїй GLB моделі частина з id `nucleus_mesh` змінює колір
- Або додається свіття/обведення
- Інші частини стають трохи прозорими

**3. Відтворюється голосове пояснення:**
- Файл: `cell_nucleus_explanation.mp3` (коли ти його створиш)
- TTS читає опис англійською або українською

---

## 🎮 ЕТАП 4: Інтерактивна гра (після перегляду моделі)

### Після вивчення всіх 4 частин клітини:

**Файл:** `lib/features/interactive_task/presentation/interactive_task_page.dart`

### Гра: "Збери клітину!"

```
┌─────────────────────────────────────┐
│  Build the Cell! 🔬                │
├─────────────────────────────────────┤
│                                     │
│  Drag parts to the correct place:  │
│                                     │
│  🔵 [Nucleus]     ┌─────────┐     │
│  🔴 [Mitochondria]│         │     │  <- Порожня
│  🟢 [Membrane]    │  CELL   │     │     клітина
│  💧 [Cytoplasm]   │         │     │     (треба
│                   └─────────┘     │     заповнити)
│                                     │
│  Time: 45s   Score: 0/4            │
└─────────────────────────────────────┘
```

**Завдання:**
1. Перетягни (drag & drop) кожну частину
2. Помісти у правильне місце в клітині
3. За кожну правильну відповідь - зірочка ⭐
4. За завершення - нагорода 🏆

---

## 🏆 ЕТАП 5: Оцінювання і нагороди

### Після гри - тест:

**Файл:** `lib/features/assessment/presentation/assessment_page.dart`

```
┌─────────────────────────────────────┐
│  Test Your Knowledge! 📝           │
├─────────────────────────────────────┤
│                                     │
│  Question 1 of 5:                   │
│                                     │
│  What is the control center         │
│  of the cell?                       │
│                                     │
│  ○ Mitochondria                     │
│  ● Nucleus        ✓ Correct!        │
│  ○ Cytoplasm                        │
│                                     │
│  [Next Question →]                  │
└─────────────────────────────────────┘
```

### При успішному завершенні:

```
┌─────────────────────────────────────┐
│          🎉 SUCCESS! 🎉            │
│                                     │
│  You earned:                        │
│  🏆 Cell Explorer Badge             │
│  ⭐⭐⭐⭐⭐ 5 stars               │
│  💎 50 points                       │
│                                     │
│  [View Rewards] [Next Lesson]      │
└─────────────────────────────────────┘
```

---

## 📂 ТЕХНІЧНІ ДЕТАЛІ ІНТЕГРАЦІЇ

### 1. Конфігурація в коді

**Файл:** `lib/shared/data/sample_lesson_data.dart`

```dart
static Lesson get cellLesson => const Lesson(
  id: 'lesson_cell',
  titleKey: 'lessons.cell.title',
  modelFileName: 'cell_model.glb', // ← ТВОЯ МОДЕЛЬ ТУТ!
  thumbnailPath: 'assets/images/cell_thumbnail.png',
  // ... інші налаштування
);
```

### 2. Шлях до файлу

**Повний шлях:**
```
/Users/user/Projects/BioMind/BioMindEDU/biomind_edu/
  assets/
    3d_models/
      cell_model.glb  ← ТУТ ТВОЯ МОДЕЛЬ!
```

**В pubspec.yaml:**
```yaml
flutter:
  assets:
    - assets/3d_models/  # ← Вся папка включена
```

### 3. Завантаження моделі

**Для Web (через model_viewer_plus):**
```dart
// Майбутній код (коли інтегруємо viewer):
ModelViewer(
  src: 'assets/3d_models/cell_model.glb',
  alt: 'Cell 3D Model',
  autoRotate: true,
  cameraControls: true,
)
```

**Для Mobile AR (через ar_flutter_plugin):**
```dart
// Майбутній код (коли розкоментуємо):
ARView(
  onARViewCreated: (controller) {
    controller.loadModel(
      'assets/3d_models/cell_model.glb',
      name: 'cell',
    );
  },
)
```

---

## 🔍 ЩО ПОВИННО БУТИ В ТВОЇЙ GLB МОДЕЛІ

### Обов'язкові вимоги:

#### 1. **Mesh Names (назви частин)**

Твоя модель повинна мати 4 окремих mesh об'єкти з такими назвами:

```
cell_model.glb
├─ nucleus_mesh         (Ядро - синє)
├─ membrane_mesh        (Мембрана - зелена)
├─ mitochondria_mesh    (Мітохондрії - червоні)
└─ cytoplasm_mesh       (Цитоплазма - блакитна)
```

**Чому це важливо?**
- Код шукає частини по ID: `modelPartId: 'nucleus_mesh'`
- Коли юзер натискає на анотацію - підсвічується саме ця частина
- Без правильних назв - анотації не працюватимуть!

#### 2. **Розмір і оптимізація**

```
✅ Полігони: < 50,000 (для mobile)
✅ Текстури: 1024x1024px або менше
✅ Формат: GLB (не GLTF + bin + textures)
✅ Розмір файлу: < 5MB
```

#### 3. **Кольори і матеріали**

```
🔵 Nucleus:       Синій (#4A90E2) з легким світінням
🟢 Membrane:      Зелений (#7ED321) напівпрозорий
🔴 Mitochondria:  Червоний (#D0021B) яскравий
💧 Cytoplasm:     Блакитний (#50E3C2) прозорий
```

#### 4. **Позиція і масштаб**

```
Center: (0, 0, 0)       - Модель в центрі
Scale: ~1.0 unit        - Розмір як баскетбольний м'яч
Rotation: Ядро зверху   - Правильна орієнтація
```

---

## 🎨 ПРИКЛАД РОБОТИ З BLENDER (якщо треба підправити)

### Як перевірити/змінити назви mesh:

```blender
1. Відкрити cell_model.glb в Blender
2. Outliner панель → розгорнути Tree
3. Знайти всі Mesh об'єкти
4. Перейменувати:
   - Mesh.001 → nucleus_mesh
   - Mesh.002 → membrane_mesh
   - Mesh.003 → mitochondria_mesh
   - Mesh.004 → cytoplasm_mesh
5. File → Export → glTF 2.0 (.glb)
6. Зберегти як cell_model.glb
```

### Як додати матеріали:

```blender
1. Вибрати nucleus_mesh
2. Material Properties → New Material
3. Назва: "Nucleus_Material"
4. Base Color: синій #4A90E2
5. Emission: легке світіння
6. Повторити для інших частин
7. Export GLB з матеріалами
```

---

## 🧪 ТЕСТУВАННЯ МОДЕЛІ

### Як перевірити що модель працює:

#### 1. **Веб-тест (простіший)**

```bash
cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu
flutter run -d chrome
```

**Що перевірити:**
- [ ] Модель завантажується без помилок
- [ ] Показується на AR екрані уроку
- [ ] Можна обертати
- [ ] Кольори правильні
- [ ] Розмір адекватний

#### 2. **Прямий тест моделі (без Flutter)**

Створи простий HTML файл:

```html
<!-- test_cell_model.html -->
<!DOCTYPE html>
<html>
<head>
  <title>Cell Model Test</title>
  <script type="module" src="https://unpkg.com/@google/model-viewer/dist/model-viewer.min.js"></script>
</head>
<body>
  <model-viewer 
    src="assets/3d_models/cell_model.glb"
    alt="Cell 3D Model"
    auto-rotate
    camera-controls
    style="width: 100%; height: 600px;"
  ></model-viewer>
</body>
</html>
```

Відкрий в браузері і перевір модель.

#### 3. **Перевірка в Sketchfab**

1. Іди на https://sketchfab.com/
2. Upload → вибери cell_model.glb
3. Подивись як виглядає онлайн
4. Перевір mesh names в 3D Settings

---

## 📊 ЩО ВІДБУВАЄТЬСЯ З МОДЕЛЛЮ В КОДІ

### Lifecycle (життєвий цикл):

```
1. App запускається
   └─> LessonsListPage завантажується
       └─> Показує cell_thumbnail.png

2. Юзер натискає "START LESSON"
   └─> Navigator.push('/ar-lesson', 'lesson_cell')
       └─> ARLessonPage ініціалізується
           └─> Завантажує cellLesson з sample_lesson_data
               └─> modelFileName = 'cell_model.glb'

3. ARViewWidget створюється
   └─> Перевіряє AR підтримку
       └─> Якщо Web:
           └─> Завантажує через model_viewer_plus
               └─> 'assets/3d_models/cell_model.glb'
       └─> Якщо Mobile AR:
           └─> Завантажує через ar_flutter_plugin
               └─> 'assets/3d_models/cell_model.glb'

4. Модель відображається
   └─> Юзер може обертати
       └─> Натискає на анотації
           └─> Код шукає modelPartId в GLB
               └─> Підсвічує nucleus_mesh / membrane_mesh / etc.

5. Урок завершується
   └─> Модель вивантажується з пам'яті
       └─> Перехід до Interactive Task
```

---

## 🎯 ВИСНОВОК: Де твоя модель відображається

### ✅ Відображається В:

1. **AR Lesson Screen** (основний екран уроку)
   - Файл: `ar_lesson_page.dart`
   - Widget: `ARViewWidget`
   - Розмір: Повний екран (мінус UI панелі)
   - Інтерактивність: Обертання + анотації

2. **3D Viewer Mode** (fallback для web)
   - На темному фоні
   - З можливістю обертання
   - Зум і панорамування

3. **AR Camera Mode** (для mobile з AR)
   - Поверх камери
   - "Стоїть" на реальній поверхні
   - Можна ходити навколо

### ❌ НЕ Відображається В:

- ❌ Головному екрані (там тільки thumbnail)
- ❌ Interactive Task (там простіші іконки/SVG)
- ❌ Assessment (там текст і питання)
- ❌ Rewards (там іконки нагород)

---

## 🔧 ЩО ДАЛІ (Next Steps)

### Щоб модель запрацювала повністю:

#### 1. **Перевір модель** (5 хв)
```bash
# Відкрий GLB в Blender або онлайн viewer
# Перевір що є 4 mesh з правильними назвами
```

#### 2. **Запусти застосунок** (5 хв)
```bash
cd /Users/user/Projects/BioMind/BioMindEDU/biomind_edu
flutter run -d chrome
```

#### 3. **Натисни "Cell Structure"** (1 хв)
- Має відкритись AR екран
- Має показатись твоя модель (зараз placeholder)

#### 4. **Інтегруй model_viewer_plus** (30 хв)
- Розкоментуй код в `ar_view_widget.dart`
- Додай `<model-viewer>` тег для web
- Протестуй завантаження GLB

#### 5. **Додай анотації** (1 год)
- Налаштуй modelPartId підсвічування
- Додай попапи при кліку
- Протестуй всі 4 анотації

---

## 🎉 ГОТОВО!

Тепер ти знаєш **ТОЧНО**:
- ✅ У якому уроці відображається модель
- ✅ На якому екрані вона з'явиться
- ✅ Як вона завантажується
- ✅ Які вимоги до структури GLB
- ✅ Як тестувати модель

**Наступний крок:** Запусти застосунок і подивись як виглядає твоя модель клітини! 🔬✨
