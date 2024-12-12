import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabCustom extends StatefulWidget {
  final String url;
  final bool active;
  final VoidCallback? onTab;

  TabCustom({
    required this.url,
    required this.active,
    this.onTab,
  });

  @override
  State<StatefulWidget> createState() => _TabCustom();
}

class _TabCustom extends State<TabCustom> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTab ?? () {},
      child: Container(
        decoration: widget.active
            ? BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF8E06C2),
                    blurRadius: 16.0.sp,
                    offset: Offset(0, 0),
                  ),
                ],
              )
            : null,
        child: SvgPicture.asset(
          widget.url,
          height: 24.0.sp,
          width: 24.0.sp,
          colorFilter: ColorFilter.mode(
            widget.active ? Color(0xFF8E06C2) : Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

// "assets/icons/book-minimalistic-svgrepo-com.svg"
// "assets/icons/square-academic-cap-svgrepo-com.svg"
// "assets/icons/user-svgrepo-com.svg"