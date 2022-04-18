import 'package:flutter/material.dart'; 
import '../screens/home/home_page.dart';
import '../screens/init.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const InitPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
    }
    return null;
  }
}
