import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BadgeCustom extends StatelessWidget {
  final String text;
  final Color bg;

  BadgeCustom({
    required this.text,
    required this.bg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(4.0.sp, 0.0.sp, 4.0.sp, 0.0.sp),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.all(Radius.circular(4.0.sp)),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
