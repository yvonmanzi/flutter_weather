import 'package:flutter/material.dart';

class WeatherDisplay extends StatelessWidget {
  final String title = 'Flutter Weather';
  final double temp;

  WeatherDisplay({this.temp});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: WeatherPage(temp: temp),
      ),
    );
  }
}

class WeatherPage extends StatelessWidget {
  final double temp;

  WeatherPage({this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[Text(temp as String)],
      ),
    );
  }
}
