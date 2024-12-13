import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:h_learning_mobile/components/badge/index.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  static const String url = "/home";
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: fullWidth,
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.all(18.0.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    //Box Name
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Chào buổi sáng!"),
                          Text(
                            "Nguyễn Duy Hùng",
                            style: TextStyle(
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        "assets/icons/bell-svgrepo-com.svg",
                        height: 26.0.sp,
                        width: 26.0.sp,
                        colorFilter: ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    // Box course progress
                    width: fullWidth,
                    margin: EdgeInsets.fromLTRB(0, 20.0.sp, 0, 0),
                    decoration: BoxDecoration(
                      color: Color(0xFF211428),
                      borderRadius: BorderRadius.all(Radius.circular(8.0.sp)),
                      border: Border.all(
                        width: 2.0.sp,
                        color: Color(0xFF8801C0),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF8801C0),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: SvgPicture.asset(
                                    "assets/icons/golf-svgrepo-com.svg",
                                    colorFilter: ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10.0.sp, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tiến trình",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    BadgeCustom(
                                      text: "Tôt",
                                      bg: Colors.green,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          CircularPercentIndicator(
                            radius: 30.0.sp,
                            lineWidth: 5.0.sp,
                            percent: 0.75,
                            center: Text("100%"),
                            progressColor: Color(0xFF8801C0),
                            circularStrokeCap: CircularStrokeCap.round,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [],
          ),
        ],
      ),
    );
  }
}
