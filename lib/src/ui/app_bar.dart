import 'package:flutter/material.dart';

abstract class MyAppBar extends StatelessWidget {
  final String title;
  final Color color;

  MyAppBar({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: color,
      ),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: buildBody(),
      ),
    );
  }

  Widget buildBody();
}
