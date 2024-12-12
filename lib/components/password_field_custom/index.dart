import 'package:flutter/material.dart';

class PasswordFieldCustom extends StatefulWidget {
  final String? hintText;
  final bool? obscureText;
  final Icon? suffixIcon;
  final String? label;
  final TextEditingController? textController;

  PasswordFieldCustom({
    this.hintText,
    this.obscureText,
    this.suffixIcon,
    this.label,
    this.textController,
  });

  @override
  State<StatefulWidget> createState() => _PasswordFieldCustom();
}

class _PasswordFieldCustom extends State<PasswordFieldCustom> {
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    showPassword = widget.obscureText ?? false;
  }

  void showPasswordHandle() {
    if (widget.obscureText == null) return;

    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null ? Text(widget.label ?? "") : Container(),
          TextFormField(
            obscureText: showPassword,
            controller: widget.textController,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              filled: true,
              suffixIcon: IconButton(
                icon: Icon(
                    showPassword ? Icons.visibility_off : Icons.visibility),
                onPressed: showPasswordHandle,
              ),
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Color(0xFF767676),
              ),
              fillColor: Color(0xFF211428),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: Color(0xFF8E06C5),
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
          )
        ],
      ),
    );
  }
}
