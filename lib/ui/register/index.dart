import 'package:flutter/material.dart';
import 'package:h_learning_mobile/components/button_custom/index.dart';
import 'package:h_learning_mobile/components/password_field_custom/index.dart';
import 'package:h_learning_mobile/components/text_field_custom/index.dart';
import 'package:h_learning_mobile/ui/login/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String url = "/register";
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterScreen();
  }
}

class _RegisterScreen extends State<RegisterScreen> {
  Future<void> handleRegister() async {}

  void gotoLogin() {
    Navigator.of(context).pushNamed(LoginScreen.url);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF000000),
        body: Center(
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
                      "Đăng kí",
                      style: TextStyle(
                          fontSize: 28.0.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: TextFieldCustom(
                    hintText: "Email",
                    label: "Email",
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: PasswordFieldCustom(
                    hintText: "Mật khẩu",
                    label: "Mật khẩu",
                    obscureText: true,
                    suffixIcon: Icon(Icons.lock),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: PasswordFieldCustom(
                    hintText: "Xác nhận mật khẩu",
                    label: "Xác nhận mật khẩu",
                    obscureText: true,
                    suffixIcon: Icon(Icons.lock),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  width: width,
                  child: ButtonCustom(
                    text: "Đăng kí",
                    onPressed: handleRegister,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Bạn đã có tài khoản ? ",
                        ),
                        GestureDetector(
                          onTap: gotoLogin,
                          child: Text(
                            "Đăng nhập",
                            style: TextStyle(
                              color: Color(0xFF8E06C2),
                            ),
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
    );
  }
}
