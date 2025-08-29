import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_app/core/routing/routs.dart';
import 'package:radio_app/feature/home/ui/main_screen.dart';
import 'package:radio_app/feature/splash/ui/splash_screen.dart';

class AppRouter {
  final getIt = GetIt.instance;

  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routing.main:
        return createRoute(MainScreen());
      case Routing.splash:
        return createRoute(SplashScreen());

      default:
        return createRoute(const Column());
    }
  }
}

Route<dynamic> createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (_, animation, __) => page,
    transitionsBuilder: (_, animation, __, child) {
      return FadeTransition(opacity: animation, child: child);
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}
