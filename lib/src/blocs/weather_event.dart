import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherSearch extends WeatherEvent {
  final String cityName;

  const WeatherSearch({@required this.cityName});

  @override
  List<Object> get props => [cityName];
}
