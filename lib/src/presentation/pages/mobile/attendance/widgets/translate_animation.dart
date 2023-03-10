import 'package:flutter/material.dart';

class TranslateAnimation extends StatelessWidget {
  const TranslateAnimation({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 0),
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOut,
      builder: (context, value, child) => Transform.translate(
        offset: Offset(0, 100 * value),
        child: child,
      ),
      child: child,
    );
  }
}

class TranslateRightToLeftAnimation extends StatelessWidget {
  const TranslateRightToLeftAnimation({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: -20, end: 0),
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      builder: (context, value, child) => Transform.translate(
        offset: Offset(-20 * value, 0),
        child: child,
      ),
      child: child,
    );
  }
}
