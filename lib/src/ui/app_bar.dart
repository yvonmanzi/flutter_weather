import 'package:flutter/material.dart';

abstract class MyAppBar extends StatelessWidget {
  final String title;

  MyAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
