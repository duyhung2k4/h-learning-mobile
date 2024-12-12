import 'package:flutter/material.dart';

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
    return Container(child: Text("Home"));
  }
}
