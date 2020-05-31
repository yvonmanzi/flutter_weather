import 'package:flutter/material.dart';

import 'app_bar.dart';

class LoadingPage extends MyAppBar {
  final String title;

  LoadingPage({this.title}) : super(title: title);

  @override
  Widget buildBody() {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
