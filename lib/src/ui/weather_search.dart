import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweather/src/blocs/blocs.dart';

import '../blocs/blocs.dart' as blocs;

class WeatherSearch extends StatefulWidget {
  final String title;

  WeatherSearch({this.title});

  @override
  _WeatherSearchState createState() => _WeatherSearchState();
}

class _WeatherSearchState extends State<WeatherSearch> {
  final _cityController = TextEditingController();
  WeatherBloc _weatherBloc;

  @override
  void initState() {
    super.initState();
    _weatherBloc = BlocProvider.of<WeatherBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                  filled: false,
                  hintText: 'City',
                ),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  _weatherBloc.add(blocs.WeatherSearch(
                      cityName: _cityController.text.toString()));
                  debugPrint(
                      "pressed! with ${_cityController.text.toString()}");
                })
          ],
        ),
      ),
    );
  }
}
