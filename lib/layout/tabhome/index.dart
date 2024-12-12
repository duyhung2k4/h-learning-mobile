import 'package:flutter/material.dart';
import 'package:h_learning_mobile/components/tab_custom/index.dart';
import 'package:h_learning_mobile/constant/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h_learning_mobile/ui/account/index.dart';
import 'package:h_learning_mobile/ui/courses/index.dart';
import 'package:h_learning_mobile/ui/home/index.dart';
import 'package:h_learning_mobile/ui/login/index.dart';
import 'package:h_learning_mobile/ui/my_course/index.dart';

class TabHome extends StatefulWidget {
  static const String url = RouterName.tabHome;

  TabHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabHome();
}

class _TabHome extends State<TabHome> {
  String curUrl = "/home-tab";
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _loginScreenKey = GlobalKey<State<LoginScreen>>();

  void changeScreen(String url) {
    setState(() {
      curUrl = url;
    });
    print(_loginScreenKey.currentWidget?.key);
    _navigatorKey.currentState?.pushNamed(url);
  }

  render(RouteSettings settings) {
    switch (settings.name) {
      case '/home-tab':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/course-tab':
        return MaterialPageRoute(builder: (_) => CoursesScreen());
      case '/my-course-tab':
        return MaterialPageRoute(builder: (_) => MyCourseScreen());
      case '/account-tab':
        return MaterialPageRoute(builder: (_) => AccountScreen());
      default:
        return MaterialPageRoute(builder: (_) => Container(child: Text("404")));
    }
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;
    double tabHeight = 50.0.sp;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: fullWidth,
                  child: Navigator(
                    key: _navigatorKey,
                    initialRoute: "/home-tab",
                    onGenerateRoute: (context) => render(context),
                  ),
                ),
              ),
              Container(
                height: tabHeight,
                width: fullWidth,
                color: Color(0xFF0C0C0C),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TabCustom(
                      url: "assets/icons/home-svgrepo-com.svg",
                      active: curUrl == "/home-tab" ? true : false,
                      onTab: () => changeScreen("/home-tab"),
                    ),
                    TabCustom(
                      url: "assets/icons/book-minimalistic-svgrepo-com.svg",
                      active: curUrl == "/course-tab" ? true : false,
                      onTab: () => changeScreen("/course-tab"),
                    ),
                    TabCustom(
                      url: "assets/icons/square-academic-cap-svgrepo-com.svg",
                      active: curUrl == "/my-course-tab" ? true : false,
                      onTab: () => changeScreen("/my-course-tab"),
                    ),
                    TabCustom(
                      url: "assets/icons/user-svgrepo-com.svg",
                      active: curUrl == "/account-tab" ? true : false,
                      onTab: () => changeScreen("/account-tab"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFF151517),
      ),
    );
  }
}
