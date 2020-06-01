import 'package:flutter/material.dart';
import 'package:flutterweather/src/ui/app_bar.dart';

class ErrorPage extends MyAppBar {
  final String title;
  final Color color;

  ErrorPage({this.title, this.color}) : super(title: title, color: color);

  @override
  Widget buildBody() {
    return Align(
      alignment: Alignment.center,
      child: Text("Try again"),
    );
  }
}
