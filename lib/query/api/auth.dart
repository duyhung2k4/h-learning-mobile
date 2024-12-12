import 'package:h_learning_mobile/config/prefs.dart';
import 'package:h_learning_mobile/constant/token.dart';
import 'package:h_learning_mobile/dto/request/auth.dart';
import 'package:h_learning_mobile/dto/response/auth.dart';
import 'package:h_learning_mobile/query/baseQuery.dart';
import 'package:h_learning_mobile/query/endpoint/auth.dart';

class AuthApi {
  static Future login(LoginRequest payload) async {
    Map<String, dynamic> result = await BaseQuery.query(BaseQueryPayload(
      data: payload.toJson(),
      queryParam: {},
      endpoint: AuthEndpoint.loginEndpoint(),
    ));

    String accessToken = result["data"][LoginResponse.accessToken];
    await Prefs.prefs.setString(Token.accessToken, accessToken);

    return result;
  }
}
