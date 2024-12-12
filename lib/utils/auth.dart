import 'package:flutter/widgets.dart';
import 'package:h_learning_mobile/config/prefs.dart';
import 'package:h_learning_mobile/constant/router.dart';
import 'package:h_learning_mobile/constant/token.dart';
import 'package:h_learning_mobile/ui/login/index.dart';

class AuthUtils {
  static String checkToken(
      BuildContext context, RouteSettings settings, bool init) {
    String? token = Prefs.prefs.getString(Token.accessToken);
    if (token == null) {
      return LoginScreen.url;
    }

    if (init) {
      return RouterName.tabHome;
    }

    return settings.name ?? "/404";
  }
}
