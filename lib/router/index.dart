import 'package:flutter/material.dart';
import 'package:h_learning_mobile/constant/router.dart';
import 'package:h_learning_mobile/layout/tabhome/index.dart';
import 'package:h_learning_mobile/ui/detail_course/index.dart';
import 'package:h_learning_mobile/ui/login/index.dart';
import 'package:h_learning_mobile/ui/register/index.dart';
import 'package:h_learning_mobile/utils/auth.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static generateRouter(RouteSettings settings, BuildContext context) {
    String path = AuthUtils.checkToken(context, settings);

    switch (path) {
      case RouterName.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(
            key: GlobalKey<State<LoginScreen>>(),
          ),
          settings: settings,
        );
      case RouterName.register:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
          settings: settings,
        );
      case RouterName.tabHome:
        return MaterialPageRoute(
          builder: (context) => TabHome(),
          settings: settings,
        );
      case RouterName.detailCourse:
        return MaterialPageRoute(
          builder: (context) => DetailCourse(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Container(),
          settings: settings,
        );
    }
  }
}
