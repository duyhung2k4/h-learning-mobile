import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h_learning_mobile/components/course_card/index.dart';
import 'package:h_learning_mobile/query/api/course.dart';
import 'package:h_learning_mobile/ui/home/info.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  static const String url = "/home";
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  List<dynamic> courses = [];

  @override
  initState() {
    super.initState();
    _loadCourse();
  }

  Future<void> _loadCourse() async {
    List<dynamic> data = await CourseApi.getAllCourse();
    setState(() {
      courses = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          InfoUser(),
          // Course recomment
          Container(
            width: fullWidth,
            padding: EdgeInsets.fromLTRB(
              16.0.sp,
              16.0.sp,
              16.0.sp,
              10.0.sp,
            ),
            decoration: BoxDecoration(),
            child: Text(
              "Khóa học đề xuất",
              style: TextStyle(
                fontSize: 18.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            items: courses.map((course) {
              return Builder(
                builder: (BuildContext context) => CourseCard(course: course),
              );
            }).toList(),
          ),
          // Course most
          Container(
            width: fullWidth,
            margin: EdgeInsets.fromLTRB(
              0.0.sp,
              20.0.sp,
              0.0.sp,
              0.0.sp,
            ),
            padding: EdgeInsets.fromLTRB(
              16.0.sp,
              16.0.sp,
              16.0.sp,
              10.0.sp,
            ),
            decoration: BoxDecoration(),
            child: Text(
              "Khóa học phổ biến",
              style: TextStyle(
                fontSize: 18.0.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            items: courses.map((course) {
              return Builder(
                builder: (BuildContext context) => CourseCard(course: course),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
