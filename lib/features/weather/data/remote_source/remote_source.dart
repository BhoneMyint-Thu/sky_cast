import 'package:sky_cast/core/params/weather_param.dart';

abstract class CurrentWeatherRemoteSource {
  Future<Map<String, dynamic>> getCurrentWeather({required WeatherParam query});
}

abstract class ForecastWeatherRemoteSource {
  Future<Map<String, dynamic>> getForecastWeather({required WeatherParam query});
}
