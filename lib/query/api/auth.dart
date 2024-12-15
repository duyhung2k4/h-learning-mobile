import 'package:h_learning_mobile/bloc/auth_bloc/event.dart';
import 'package:h_learning_mobile/bloc/auth_bloc/state.dart';
import 'package:h_learning_mobile/config/prefs.dart';
import 'package:h_learning_mobile/constant/token.dart';
import 'package:h_learning_mobile/dto/request/auth.dart';
import 'package:h_learning_mobile/dto/response/auth.dart';
import 'package:h_learning_mobile/query/baseQuery.dart';
import 'package:h_learning_mobile/query/endpoint/auth.dart';

class AuthApi {
  static Future<dynamic> login(
    LoginRequest payload,
    AuthBloc bloc,
  ) async {
    bloc.add(LoginPending());
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
