import 'package:flutter/material.dart';

import 'app_bar.dart';

class LoadingPage extends MyAppBar {
  final String title;
  final Color color;

  LoadingPage({this.title, this.color}) : super(title: title, color: color);

  @override
  Widget buildBody() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
