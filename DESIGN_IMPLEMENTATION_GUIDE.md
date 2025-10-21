# 🎨 Гід по імплементації нового дизайну BioMindEDU

## 📋 Зміст

1. [Кольорова палітра](#кольорова-палітра)
2. [Оновлення теми Flutter](#оновлення-теми-flutter)
3. [Gradient мапінг](#gradient-мапінг)
4. [Анімації](#анімації)
5. [Компоненти для оновлення](#компоненти-для-оновлення)

---

## 🎨 Кольорова палітра

### Нова палітра (замість зеленої):

```dart
// lib/core/theme/app_colors.dart

class AppColors {
  // === PRIMARY COLORS ===
  static const primary = Color(0xFF1E88E5);        // Deep Blue
  static const primaryDark = Color(0xFF1976D2);    // Darker Blue
  static const primaryLight = Color(0xFF42A5F5);   // Light Blue
  
  static const secondary = Color(0xFF7B1FA2);      // Purple
  static const secondaryDark = Color(0xFF6A1B9A);  // Darker Purple
  static const secondaryLight = Color(0xFF9C27B0); // Light Purple
  
  static const tertiary = Color(0xFF009688);       // Teal
  static const tertiaryDark = Color(0xFF00796B);   // Darker Teal
  static const tertiaryLight = Color(0xFF26A69A);  // Light Teal
  
  // === ACCENT COLORS ===
  static const accentOrange = Color(0xFFFF6F00);   // Bright Orange
  static const accentCyan = Color(0xFF00BCD4);     // Cyan
  static const accentPink = Color(0xFFE91E63);     // Pink
  static const accentYellow = Color(0xFFFFC107);   // Yellow
  
  // === BACKGROUND COLORS ===
  static const backgroundLight = Color(0xFFE3F2FD); // Light Blue 50
  static const backgroundLavender = Color(0xFFF3E5F5); // Purple 50
  static const backgroundTeal = Color(0xFFE0F2F1);  // Teal 50
  static const backgroundWhite = Color(0xFFFAFCFF); // White with blue tint
  
  // === SEMANTIC COLORS ===
  static const success = Color(0xFF2196F3);        // Blue (замість зеленого)
  static const warning = Color(0xFFFF9800);        // Orange
  static const error = Color(0xFFF44336);          // Red
  static const info = Color(0xFF00BCD4);           // Cyan
  
  // === TEXT COLORS ===
  static const textPrimary = Color(0xFF0D47A1);    // Dark Blue
  static const textSecondary = Color(0xFF616161);  // Medium Gray
  static const textDisabled = Color(0xFFBDBDBD);   // Light Gray
  static const textOnPrimary = Color(0xFFFFFFFF);  // White
  
  // === GRADIENTS ===
  static const gradientBlue = [
    Color(0xFF2196F3),
    Color(0xFF42A5F5),
    Color(0xFF64B5F6),
  ];
  
  static const gradientPurple = [
    Color(0xFF7B1FA2),
    Color(0xFF9C27B0),
    Color(0xFFBA68C8),
  ];
  
  static const gradientTeal = [
    Color(0xFF009688),
    Color(0xFF26A69A),
    Color(0xFF4DB6AC),
  ];
  
  static const gradientOcean = [
    Color(0xFF00BCD4),
    Color(0xFF26C6DA),
    Color(0xFF4DD0E1),
  ];
  
  static const gradientSunset = [
    Color(0xFFFF6F00),
    Color(0xFFFF8A50),
    Color(0xFFFFA726),
  ];
  
  static const gradientPink = [
    Color(0xFFE91E63),
    Color(0xFFF06292),
    Color(0xFFF48FB1),
  ];
  
  // === LESSON SPECIFIC COLORS ===
  static const cellLessonColors = gradientBlue;
  static const plantLessonColors = gradientTeal;
  static const heartLessonColors = gradientPink;
}
```

---

## 🎨 Оновлення теми Flutter

### Файл: `lib/core/theme/app_theme.dart`

```dart
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      
      // === COLOR SCHEME ===
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryLight,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondaryLight,
        tertiary: AppColors.tertiary,
        tertiaryContainer: AppColors.tertiaryLight,
        surface: AppColors.backgroundWhite,
        background: AppColors.backgroundLight,
        error: AppColors.error,
        onPrimary: AppColors.textOnPrimary,
        onSecondary: AppColors.textOnPrimary,
        onSurface: AppColors.textPrimary,
        onBackground: AppColors.textPrimary,
        onError: AppColors.textOnPrimary,
      ),
      
      // === APP BAR THEME ===
      appBarTheme: AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        // Gradient background буде додано через BoxDecoration
      ),
      
      // === CARD THEME ===
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: AppColors.backgroundWhite,
      ),
      
      // === BUTTON THEMES ===
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.secondary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primary,
          side: BorderSide(color: AppColors.primary, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      
      // === TEXT THEME ===
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: AppColors.textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          color: AppColors.textSecondary,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: AppColors.textSecondary,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.textPrimary,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
        labelSmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.textSecondary,
        ),
      ),
      
      // === INPUT DECORATION THEME ===
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.backgroundWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
      
      // === FLOATING ACTION BUTTON THEME ===
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.accentOrange,
        foregroundColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
```

---

## 🌈 Gradient Widgets

### Створіть новий файл: `lib/shared/widgets/gradient_container.dart`

```dart
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  
  const GradientContainer({
    super.key,
    required this.child,
    required this.colors,
    this.begin = Alignment.topLeft,
    this.end = Alignment.bottomRight,
    this.borderRadius,
    this.padding,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: colors,
        ),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}

class AnimatedGradientContainer extends StatefulWidget {
  final Widget child;
  final List<Color> colors;
  final Duration duration;
  final Curve curve;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;
  
  const AnimatedGradientContainer({
    super.key,
    required this.child,
    required this.colors,
    this.duration = const Duration(seconds: 3),
    this.curve = Curves.easeInOut,
    this.borderRadius,
    this.padding,
  });
  
  @override
  State<AnimatedGradientContainer> createState() => _AnimatedGradientContainerState();
}

class _AnimatedGradientContainerState extends State<AnimatedGradientContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: true);
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          padding: widget.padding,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: widget.colors,
              stops: [
                _controller.value * 0.5,
                0.5 + _controller.value * 0.3,
                1.0,
              ],
            ),
            borderRadius: widget.borderRadius,
          ),
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
```

---

## ✨ Анімації

### Оновлений Splash Screen з анімаціями

```dart
// lib/shared/widgets/splash_screen.dart

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _rotationController;
  late AnimationController _gradientController;
  
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  
  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _gradientController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    
    // Fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeIn),
    );
    
    // Scale animation with bounce
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.5, end: 1.2),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.2, end: 1.0),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    ));
    
    // Rotation animation
    _rotationAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 0.1),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.1, end: 0.0),
        weight: 50,
      ),
    ]).animate(CurvedAnimation(
      parent: _rotationController,
      curve: Curves.easeInOut,
    ));
    
    // Start animations
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 200), () {
      _scaleController.forward();
      _rotationController.forward();
    });
    
    _initializeAndNavigate();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _gradientController,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.backgroundLight,
                  AppColors.backgroundLavender,
                  AppColors.backgroundTeal,
                ],
                stops: [
                  _gradientController.value * 0.3,
                  0.5,
                  1.0 - _gradientController.value * 0.3,
                ],
              ),
            ),
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: RotationTransition(
                    turns: _rotationAnimation,
                    child: _buildLogo(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  
  Widget _buildLogo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/images/app_logo_splash.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 32),
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ).createShader(bounds);
          },
          child: const Text(
            'BioMindEDU',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Explore Biology with AR!',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.textSecondary,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 48),
        SizedBox(
          width: 40,
          height: 40,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
          ),
        ),
      ],
    );
  }
  
  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _rotationController.dispose();
    _gradientController.dispose();
    super.dispose();
  }
}
```

---

## 📝 Чеклист для оновлення компонентів

### 1. Оновити кольори в Lesson Cards

**Файл**: `lib/features/ar_lesson/widgets/animated_lesson_card.dart`

```dart
List<Color> _getGradientColors() {
  switch (widget.lesson.id) {
    case 'cell':
      return AppColors.cellLessonColors;  // Синій градієнт
    case 'plant':
      return AppColors.plantLessonColors; // Teal градієнт
    case 'heart':
      return AppColors.heartLessonColors; // Рожевий градієнт
    default:
      return AppColors.gradientBlue;
  }
}

// Замінити всі Colors.green на AppColors.success
// Замінити всі зелені кольори на відповідні з AppColors
```

### 2. Оновити AppBar Gradient

**Файл**: `lib/features/ar_lesson/presentation/lessons_list_page.dart`

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primary, AppColors.primaryDark],
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Image.asset(
            'assets/images/app_logo_header.png',
            height: 40,
            fit: BoxFit.contain,
          ),
          // ... інші елементи
        ),
      ),
    ),
    // ... решта коду
  );
}
```

### 3. Оновити Interactive Task Page

**Файл**: `lib/features/interactive_task/presentation/interactive_task_page.dart`

Замінити:
- `'#4CAF50'` → `AppColors.success` (синій замість зеленого)
- `'#66BB6A'` → `AppColors.primaryLight`
- `Colors.green` → `AppColors.success`
- `Colors.green.shade50` → `AppColors.backgroundLight`

### 4. Оновити Rewards Page

Замінити всі зелені кольори на сині/фіолетові з AppColors.

---

## 🚀 Покрокова імплементація

### Крок 1: Створити AppColors клас
```bash
# Створіть файл
lib/core/theme/app_colors.dart
```

### Крок 2: Оновити AppTheme
```bash
# Оновіть файл
lib/core/theme/app_theme.dart
```

### Крок 3: Замінити логотипи
```bash
# Розмістіть нові файли:
biomind_edu/assets/images/app_logo_splash.png
biomind_edu/assets/images/app_logo_header.png
```

### Крок 4: Оновити Splash Screen
```bash
# Оновіть файл
lib/shared/widgets/splash_screen.dart
```

### Крок 5: Оновити всі інші компоненти
Використовуйте Find & Replace:
- `Color(0xFF4CAF50)` → `AppColors.success`
- `Color(0xFF2E7D32)` → `AppColors.primary`
- `Colors.green` → `AppColors.success`

### Крок 6: Тестування
```bash
flutter clean
flutter pub get
flutter run -d chrome
```

---

## ✅ Перевірочний список

- [ ] AppColors клас створено
- [ ] AppTheme оновлено
- [ ] Нові логотипи з прозорим фоном
- [ ] Splash Screen з анімаціями
- [ ] AppBar з градієнтом
- [ ] Lesson Cards з новими кольорами
- [ ] Interactive Task Page оновлено
- [ ] Rewards Page оновлено
- [ ] Всі зелені кольори замінено
- [ ] Градієнти працюють
- [ ] Анімації плавні (60 FPS)
- [ ] Тестування на різних платформах

---

**Час імплементації**: ~4-6 годин  
**Складність**: Середня  
**Пріоритет**: Високий
