import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h_learning_mobile/components/tab_custom/index.dart';
import 'package:h_learning_mobile/constant/router.dart';
import 'package:h_learning_mobile/ui/account/index.dart';
import 'package:h_learning_mobile/ui/courses/index.dart';
import 'package:h_learning_mobile/ui/home/index.dart';
import 'package:h_learning_mobile/ui/my_course/index.dart';

class TabHome extends StatefulWidget {
  final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

  TabHome({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TabHome();
}

class _TabHome extends State<TabHome> {
  String curUrl = RouterName.tabHomeHome;

  void changeScreen(String url) {
    setState(() {
      curUrl = url;
    });
    widget.globalKey.currentState!.pushNamed(url);
  }

  render(RouteSettings settings) {
    switch (settings.name) {
      case RouterName.tabHomeHome:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RouterName.tabHomeCourse:
        return MaterialPageRoute(builder: (_) => CoursesScreen());
      case RouterName.tabHomeMyCourse:
        return MaterialPageRoute(builder: (_) => MyCourseScreen());
      case RouterName.tabHomeAccount:
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
                    key: widget.globalKey,
                    initialRoute: RouterName.tabHomeHome,
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
                      active: curUrl == RouterName.tabHomeHome ? true : false,
                      onTab: () => changeScreen(RouterName.tabHomeHome),
                    ),
                    TabCustom(
                      url: "assets/icons/book-minimalistic-svgrepo-com.svg",
                      active: curUrl == RouterName.tabHomeCourse ? true : false,
                      onTab: () => changeScreen(RouterName.tabHomeCourse),
                    ),
                    TabCustom(
                      url: "assets/icons/square-academic-cap-svgrepo-com.svg",
                      active:
                          curUrl == RouterName.tabHomeMyCourse ? true : false,
                      onTab: () => changeScreen(RouterName.tabHomeMyCourse),
                    ),
                    TabCustom(
                      url: "assets/icons/user-svgrepo-com.svg",
                      active:
                          curUrl == RouterName.tabHomeAccount ? true : false,
                      onTab: () => changeScreen(RouterName.tabHomeAccount),
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
