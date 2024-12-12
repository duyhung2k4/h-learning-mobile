import 'package:flutter/material.dart';
import 'package:h_learning_mobile/constant/router.dart';
import 'package:h_learning_mobile/ui/login/index.dart';
import 'package:h_learning_mobile/ui/register/index.dart';
import 'package:h_learning_mobile/ui/tabview/index.dart';

class AppRouter {
  static generateRouter(RouteSettings settings) {
    String path = settings.name ?? "";

    switch (path) {
      case RouterName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RouterName.register:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case RouterName.home:
        return MaterialPageRoute(builder: (context) => AppShell());
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
