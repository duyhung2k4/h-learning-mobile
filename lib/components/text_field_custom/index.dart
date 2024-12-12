import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  final String? hintText;
  final String? label;
  final TextEditingController? textController;

  TextFieldCustom({
    this.hintText,
    this.label,
    this.textController,
  });

  @override
  State<StatefulWidget> createState() => _TextFieldCustom();
}

class _TextFieldCustom extends State<TextFieldCustom> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.label != null ? Text(widget.label ?? "") : Container(),
          TextFormField(
            controller: widget.textController,
            style: Theme.of(context).textTheme.bodyMedium,
            decoration: InputDecoration(
              filled: true,
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Color(0xFF767676)),
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
