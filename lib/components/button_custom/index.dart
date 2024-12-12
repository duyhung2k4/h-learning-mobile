import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonCustom extends StatefulWidget {
  final String? text;
  final bool? loading;

  final void Function()? onPressed;

  ButtonCustom({
    this.text,
    this.loading,
    this.onPressed,
  });

  @override
  State<StatefulWidget> createState() => _ButtonCustom();
}

class _ButtonCustom extends State<ButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.loading == true ? () {} : widget.onPressed ?? () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF8E07C2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: widget.loading == true
          ? LoadingAnimationWidget.twoRotatingArc(
              color: Color(0xFFFFFFFF),
              size: 18.0.sp,
            )
          : Text(
              widget.text ?? "",
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
    );
  }
}
