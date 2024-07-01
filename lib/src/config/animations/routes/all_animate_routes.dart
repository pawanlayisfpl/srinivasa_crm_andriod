import 'package:flutter/material.dart';

class ScaleRoute extends PageRouteBuilder {
  final Widget screen;

  ScaleRoute({required this.screen})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
        );
}

class ScaleDownRoute extends PageRouteBuilder {
  final Widget screen;

  ScaleDownRoute({required this.screen})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: Tween<double>(begin: 1.0, end: 0.0).animate(animation),
              child: child,
            );
          },
        );
}

class ScaleUpRoute extends PageRouteBuilder {
  final Widget screen;

  ScaleUpRoute({required this.screen})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: Tween<double>(begin: 0.0, end: 1.0).animate(animation),
              child: child,
            );
          },
        );
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget screen;

  SlideRightRoute({required this.screen})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget screen;

  SlideLeftRoute({required this.screen})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => screen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}