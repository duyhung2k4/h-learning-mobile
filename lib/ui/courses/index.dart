import 'package:flutter/material.dart';
import 'package:h_learning_mobile/constant/router.dart';
import 'package:h_learning_mobile/router/index.dart';

class CoursesScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CoursesScreen();
}

class _CoursesScreen extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          rootNavigatorKey.currentState!.pushNamed(RouterName.detailCourse);
        },
        child: Text("detail"),
      ),
    );
  }
}
