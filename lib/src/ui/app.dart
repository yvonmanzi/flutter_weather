import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterweather/src/ui/weather_display.dart';

import '../blocs/blocs.dart';
import 'error_page.dart';
import 'loading_page.dart';
import 'weather_search.dart' as searchPage;

class App extends StatelessWidget {
  final String title = 'City';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherInitialState) return searchPage.WeatherSearch();
        if (state is WeatherLoaded)
          return WeatherDisplay(temp: state.weather.temp);
        if (state is WeatherFailedToLoad)
          return ErrorPage(
            title: state.error.toString(),
          );
        if (state is WeatherLoading)
          return LoadingPage(
            title: 'Flutter Weather',
          ); //why does it work both ways? seems like with and without arguments
        //it is still showing no error.
        else
          return Center(
            child: Text("Nous sommes fucked!"),
          );
      }),
    );
  }
}