import 'package:flutter/material.dart';

class DetailCourse extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DetailCourse();
}

class _DetailCourse extends State<DetailCourse> {
  @override
  Widget build(BuildContext context) {
    // Object? args = ModalRoute.of(context)!.settings.arguments;

    // if (args == null) {
    //   return Container(
    //     child: Text("null"),
    //   );
    // }

    // print(args);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF151517),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(),
                child: Text("Hello"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
