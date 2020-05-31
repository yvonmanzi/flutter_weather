import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterweather/src/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

import '../data/repository/weather_api_repo.dart';
import 'blocs.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final repo = WeatherRepository(httpClient: http.Client());

  @override
  WeatherState get initialState => WeatherInitialState();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherSearch) {
      yield WeatherLoading();
      try {
        Weather weather = await repo.getWeather(city: event.cityName);
        debugPrint('${weather.temp}');
        yield WeatherLoaded(weather: weather);
      } catch (error) {
        yield WeatherFailedToLoad(error: error.toString());
      }
    }
  }
}
