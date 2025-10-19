import 'package:flutter/material.dart';

/// Animation timing and curve constants for consistent animations across the app
class AnimationConstants {
  AnimationConstants._();

  // Duration constants
  static const Duration instant = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);

  // Curves for different animation types
  static const Curve standard = Curves.easeInOut;
  static const Curve emphasized = Curves.easeOutCubic;
  static const Curve decelerated = Curves.easeOut;
  static const Curve accelerated = Curves.easeIn;
  static const Curve bounce = Curves.elasticOut;

  // Specific animation configurations
  static const Duration pageTransition = normal;
  static const Curve pageTransitionCurve = emphasized;

  static const Duration cardAnimation = fast;
  static const Curve cardAnimationCurve = standard;

  static const Duration buttonAnimation = instant;
  static const Curve buttonAnimationCurve = standard;

  static const Duration loadingAnimation = slow;
  static const Curve loadingAnimationCurve = standard;

  static const Duration heroAnimation = normal;
  static const Curve heroAnimationCurve = emphasized;

  static const Duration rewardAnimation = verySlow;
  static const Curve rewardAnimationCurve = bounce;
}
