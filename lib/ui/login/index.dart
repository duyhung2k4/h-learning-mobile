import 'package:flutter/material.dart';
import 'package:h_learning_mobile/bloc/auth_bloc/event.dart';
import 'package:h_learning_mobile/bloc/auth_bloc/state.dart';
import 'package:h_learning_mobile/components/button_custom/index.dart';
import 'package:h_learning_mobile/components/loading_custom/index.dart';
import 'package:h_learning_mobile/components/password_field_custom/index.dart';
import 'package:h_learning_mobile/components/text_field_custom/index.dart';
import 'package:h_learning_mobile/constant/router.dart';
import 'package:h_learning_mobile/dto/request/auth.dart';
import 'package:h_learning_mobile/query/api/auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_learning_mobile/router/index.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  final cc = true;
  final formKey = GlobalKey<FormState>();

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loadingLogin = false;

  late AuthBloc authBloc;

  @override
  void initState() {
    authBloc = context.read<AuthBloc>();

    super.initState();
  }

  Future<void> handleLogin() async {
    try {
      if (!widget.formKey.currentState!.validate()) return;

      authBloc.add(LoginPending());

      await AuthApi.login(
        LoginRequest(
          username: usernameController.text,
          password: passwordController.text,
        ),
        authBloc,
      );

      authBloc.add(LoginSuccess());
      Navigator.of(context).pushNamed(RouterName.tabHome);
    } catch (e) {
      authBloc.add(LoginFailure());
      print("Error login: $e");
    }
  }

  void gotoRegister() {
    rootNavigatorKey.currentState!.pushNamed(RouterName.register);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF000000),
        body: Stack(
          children: [
            Form(
              key: widget.formKey,
              child: Center(
                child: Container(
                  width: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: Center(
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(
                                fontSize: 28.0.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextFieldCustom(
                          hintText: "Tên đăng nhập",
                          label: "Tên đăng nhập",
                          textController: usernameController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: PasswordFieldCustom(
                          hintText: "Mật khẩu",
                          label: "Mật khẩu",
                          obscureText: true,
                          suffixIcon: Icon(Icons.lock),
                          textController: passwordController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                        width: width,
                        child: ButtonCustom(
                          text: "Đăng nhập",
                          onPressed: handleLogin,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Bạn đã có tài khoản ? "),
                              GestureDetector(
                                onTap: gotoRegister,
                                child: Text(
                                  "Đăng kí",
                                  style: TextStyle(
                                    color: Color(0xFF8E06C2),
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {},
              builder: (context, state) {
                return state.loadingLogin == true
                    ? LoadingCustom()
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
