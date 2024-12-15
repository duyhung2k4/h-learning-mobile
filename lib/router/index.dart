import 'package:flutter/material.dart';
import 'package:h_learning_mobile/constant/router.dart';
import 'package:h_learning_mobile/layout/tabhome/index.dart';
import 'package:h_learning_mobile/ui/detail_course/index.dart';
import 'package:h_learning_mobile/ui/login/index.dart';
import 'package:h_learning_mobile/ui/register/index.dart';
import 'package:h_learning_mobile/utils/auth.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> tabHomeGlobalKey = GlobalKey<NavigatorState>();

class AppRouter {
  static generateRouter(RouteSettings settings, BuildContext context) {
    String path = AuthUtils.checkToken(context, settings);

    print("how: $path");

    switch (path) {
      case RouterName.login:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(
            key: GlobalKey<State<LoginScreen>>(),
          ),
        );
      case RouterName.register:
        return MaterialPageRoute(builder: (context) => RegisterScreen());
      case RouterName.tabHome:
        return MaterialPageRoute(builder: (context) => TabHome());
      case RouterName.detailCourse:
        return MaterialPageRoute(builder: (context) => DetailCourse());
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
