import 'package:flutter/material.dart';

/// App color palette - blue/purple theme for children aged 3-8
/// Replaces green colors with blue/purple/teal scheme
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
  
  // === SEMANTIC COLORS (replacing green) ===
  static const success = Color(0xFF2196F3);        // Blue (instead of green)
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
  
  // Private constructor to prevent instantiation
  AppColors._();
}
