import 'package:flutterweather/src/data/models/weather_model.dart';
import 'package:flutterweather/src/data/provider/weather_api_provider.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class WeatherRepository {
  final http.Client httpClient;

  WeatherRepository({@required this.httpClient}) : assert(httpClient != null);

  Future<Weather> getWeather({String city}) async {
    var weatherApiClient = WeatherApiClient(httpClient: httpClient);
//    you see what's happening here? We have 2 methods fetching stuff(i.e: providing access to stuff.
//    instead of fetching id, and then fetching the temp in provider, we just
//  do it in the repo
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
