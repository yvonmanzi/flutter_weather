import 'package:flutter/material.dart';
import 'package:flutterweather/src/ui/app_bar.dart';

class ErrorPage extends MyAppBar {
  final String title;

  ErrorPage({this.title}) : super(title: title);

  @override
  Widget buildBody() {
    return Container(
      color: Colors.redAccent,
      alignment: Alignment.center,
      child: Text("Try again"),
    );
  }
}
