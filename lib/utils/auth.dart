import 'package:flutter/widgets.dart';
import 'package:h_learning_mobile/config/prefs.dart';
import 'package:h_learning_mobile/constant/router.dart';
import 'package:h_learning_mobile/constant/token.dart';

class AuthUtils {
  static String checkToken(
    BuildContext context,
    RouteSettings settings,
  ) {
    String? token = Prefs.prefs.getString(Token.accessToken);
    if (token == null || settings.name == RouterName.register) {
      return RouterName.login;
    }

    if (settings.name == "/") {
      return RouterName.tabHome;
    }

    return settings.name ?? "/404";
  }
}
