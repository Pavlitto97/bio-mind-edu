import 'package:flutter/material.dart';
import 'package:biomind_edu/core/theme/animation_constants.dart';

/// Custom page route with fade transition
class FadePageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  FadePageRoute({
    required this.builder,
    RouteSettings? settings,
    this.transitionDuration = AnimationConstants.pageTransition,
    this.reverseTransitionDuration = AnimationConstants.pageTransition,
  }) : super(settings: settings);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: AnimationConstants.pageTransitionCurve,
      ),
      child: child,
    );
  }
}

/// Custom page route with slide transition
class SlidePageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;
  final AxisDirection direction;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  SlidePageRoute({
    required this.builder,
    this.direction = AxisDirection.left,
    RouteSettings? settings,
    this.transitionDuration = AnimationConstants.pageTransition,
    this.reverseTransitionDuration = AnimationConstants.pageTransition,
  }) : super(settings: settings);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    Offset begin;
    switch (direction) {
      case AxisDirection.up:
        begin = const Offset(0.0, 1.0);
        break;
      case AxisDirection.down:
        begin = const Offset(0.0, -1.0);
        break;
      case AxisDirection.left:
        begin = const Offset(1.0, 0.0);
        break;
      case AxisDirection.right:
        begin = const Offset(-1.0, 0.0);
        break;
    }

    return SlideTransition(
      position: Tween<Offset>(begin: begin, end: Offset.zero).animate(
        CurvedAnimation(
          parent: animation,
          curve: AnimationConstants.pageTransitionCurve,
        ),
      ),
      child: child,
    );
  }
}

/// Custom page route with scale and fade transition
class ScalePageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  @override
  final Duration transitionDuration;

  @override
  final Duration reverseTransitionDuration;

  ScalePageRoute({
    required this.builder,
    RouteSettings? settings,
    this.transitionDuration = AnimationConstants.pageTransition,
    this.reverseTransitionDuration = AnimationConstants.pageTransition,
  }) : super(settings: settings);

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: AnimationConstants.pageTransitionCurve,
      ),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: AnimationConstants.pageTransitionCurve,
          ),
        ),
        child: child,
      ),
    );
  }
}
