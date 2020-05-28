import 'package:equatable/equatable.dart';
import 'package:flutterweather/src/data/models/weather_model.dart';
import 'package:meta/meta.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitialState extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Weather weather;

  const WeatherLoaded({@required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherFailedToLoad extends WeatherState {
  final String error;

  const WeatherFailedToLoad({@required this.error});

  @override
  List<Object> get props => [error];
}
