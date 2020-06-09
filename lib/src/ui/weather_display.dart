import 'package:flutter/material.dart';
import 'package:flutterweather/src/data/models/weather_model.dart';
import 'package:flutterweather/src/ui/weather_search.dart';

import 'weather_settings.dart';

class WeatherDisplay extends StatelessWidget {
  final String title = 'Flutter Weather';
  final Weather weather;

  WeatherDisplay({this.weather});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/weather_search': (context) => WeatherSearch(
              title: title,
            ),
        '/weather_settings': (context) => WeatherSettings(),
      },
      theme: ThemeData(primarySwatch: Colors.indigo),
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF536DFE),
          title: Text(title),
          actions: <Widget>[WeatherDisplayAppBarActions()],
        ),
        body: WeatherPage(weather: weather),
        backgroundColor: Color(0xFF303F9F),
      ),
    );
  }
}

class WeatherDisplayAppBarActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => Navigator.pushNamed(context, '/weather_settings'),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () => Navigator.pushNamed(context, '/weather_search'),
        ),
      ],
    );
  }
}

//TODO: try to see if you can use abstraction to create those rows.
class WeatherPage extends StatelessWidget {
  final Weather weather;

  WeatherPage({this.weather});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 0.0),
      children: <Widget>[
        RowOne(weather),
        SizedBox(
          height: 8.0,
        ),
        RowTwo(weather),
        SizedBox(
          height: 8.0,
        ),
        RowThree(weather),
      ],
    );
  }
}

class RowOne extends StatelessWidget {
  final Weather weather;

  RowOne(this.weather);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              weather.location,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(color: Colors.white),
            ),
            Text(
              'Updated: ${weather.lastUpdated.toString()}',
              style: TextStyle(),
            ),
          ],
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}

class RowTwo extends StatelessWidget {
  final Weather weather;

  RowTwo(this.weather);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.cloud),
        Text(
          '${weather.temp}',
          style: TextStyle(),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '${weather.maxTemp.toString()}',
              style: TextStyle(),
            ),
            Text(
              '${weather.minTemp.toString()}',
              style: TextStyle(),
            ),
          ],
        )
      ],
    );
  }
}

class RowThree extends StatelessWidget {
  final Weather weather;

  RowThree(this.weather);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${weather.formattedCondition.toString()}',
        style: TextStyle(),
      ),
    );
  }
}
