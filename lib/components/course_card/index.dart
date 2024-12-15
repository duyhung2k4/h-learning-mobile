import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:h_learning_mobile/components/button_custom/index.dart';

class CourseCard extends StatefulWidget {
  final dynamic course;

  CourseCard({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CourseCard();
}

class _CourseCard extends State<CourseCard> {
  final GlobalKey _rootKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    String thumnail = widget.course["thumnail"];
    String? baseUrl = dotenv.env["API_CORE_URL"];
    String url = "$baseUrl/api/v1/public/file/thumnail_course/$thumnail";
    String nameCourse = widget.course["name"];

    return Container(
      key: _rootKey,
      margin: EdgeInsets.fromLTRB(10.0.sp, 0.sp, 10.0.sp, 0.sp),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(8.0.sp)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LayoutBuilder(builder: (
            BuildContext context,
            BoxConstraints constraints,
          ) {
            return Container(
              padding: EdgeInsets.all(8.0.sp),
              height: constraints.maxWidth * 0.5,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0.sp)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.0.sp)),
                child: Image.network(
                  url,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                8.0.sp,
                0.0.sp,
                8.0.sp,
                0.0.sp,
              ),
              child: LayoutBuilder(builder: (
                BuildContext context,
                BoxConstraints constrant,
              ) {
                return Container(
                  width: constrant.maxWidth,
                  decoration: BoxDecoration(),
                  child: Text(
                    nameCourse,
                    style: TextStyle(fontSize: 16.0.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0.sp),
            child: LayoutBuilder(builder: (
              BuildContext context,
              BoxConstraints constraint,
            ) {
              return Container(
                width: constraint.maxWidth,
                child: ButtonCustom(
                  text: "Đăng kí",
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
