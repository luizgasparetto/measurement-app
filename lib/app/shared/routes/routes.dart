import 'package:flutter/material.dart';
import 'package:measurement/app/modules/presentation/ui/pages/auth/signup_page.dart';
import 'package:measurement/app/modules/presentation/ui/pages/home_page.dart';
import 'package:measurement/app/modules/presentation/ui/pages/auth/login_page.dart';

class AppRouter {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case LoginPage.routeName:
        return LoginPage.route();
      case SignUpPage.routeName:
        return SignUpPage.route();
      case HomePage.routeName:
        return HomePage.route();

      default:
        return defaultRoute();
    }
  }

  static Route defaultRoute() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
