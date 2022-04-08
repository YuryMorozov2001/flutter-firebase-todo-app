import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/auth/auth_page.dart';
import 'package:flutter_firebase_app/screens/home/home_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
    return null;
  }
}
