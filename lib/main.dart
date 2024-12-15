import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h_learning_mobile/bloc/index.dart';
import 'package:h_learning_mobile/config/prefs.dart';
import 'package:h_learning_mobile/router/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h_learning_mobile/ui/login/index.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Prefs.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      RootBloc(
        child: RepaintBoundary(
          child: MyApp(),
        ),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          home: Navigator(
            initialRoute: LoginScreen.url,
            onGenerateRoute: (RouteSettings settings) =>
                AppRouter.generateRouter(settings, context),
          ),
          theme: ThemeData(
            textTheme: TextTheme(
              bodySmall: TextStyle(color: Color(0xFFFFFFFF), fontSize: 12.0.sp),
              bodyMedium:
                  TextStyle(color: Color(0xFFFFFFFF), fontSize: 14.0.sp),
              bodyLarge: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18.0.sp),
            ),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
