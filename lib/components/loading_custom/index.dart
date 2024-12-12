import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0.sp),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
