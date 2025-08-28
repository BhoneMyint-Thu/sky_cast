import 'package:dio/dio.dart';
import 'package:sky_cast/core/api_constants.dart';
import 'package:sky_cast/core/config/app_config.dart';
import 'package:sky_cast/core/enums/temp_units.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/core/utils/dio_util.dart';
import 'package:sky_cast/features/weather/data/remote_source/remote_source.dart';

class CurrentWeatherRemoteService implements CurrentWeatherRemoteSource {
  final Dio _dio;
  CurrentWeatherRemoteService(this._dio);

  @override
  Future<Map<String, dynamic>> getCurrentWeather({
    required WeatherParam query,
  }) async {
    try {
      return switch (query) {
        WeatherByCityParam(cityName: final city) => _weatherByCity(city),
        WeatherByLatLngParam(lat: final lat, lon: final lon) =>
          _weatherByLatLng(lat, lon),
      };
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _weatherByCity(String city) async {
    final response = await DioUtil.getAPI(
      ApiConstants.weather,
      dio: _dio,
      queryParam: {
        "appid": AppConfig.apiKey,
        "units": TempUnits.standard.name,
        "q": city,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> _weatherByLatLng(double lat, double lon) async {
    final response = await DioUtil.getAPI(
      ApiConstants.weather,
      dio: _dio,
      queryParam: {
        "appid": AppConfig.apiKey,

        "units": TempUnits.standard.name,
        "lat": lat,
        "lon": lon,
      },
    );
    return response.data;
  }

}


class ForecastWeatherRemoteService implements ForecastWeatherRemoteSource{
    final Dio _dio;
  ForecastWeatherRemoteService(this._dio);

  @override
  Future<Map<String, dynamic>> getForecastWeather({
    required WeatherParam query,
  }) async {
    try {
      return switch (query) {
        WeatherByCityParam(cityName: final city) => _weatherForecastByCity(city),
        WeatherByLatLngParam(lat: final lat, lon: final lon) =>
          _weatherForecastByLatLng(lat, lon),
      };
    } on DioException catch (_) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> _weatherForecastByCity(String city) async {
    final response = await DioUtil.getAPI(
      ApiConstants.weatherForecast,
      dio: _dio,
      queryParam: {
        "appid": AppConfig.apiKey,
        "units": TempUnits.standard.name,
        "q": city,
      },
    );
    return response.data;
  }

  Future<Map<String, dynamic>> _weatherForecastByLatLng(
    double lat,
    double lon,
  ) async {
    final response = await DioUtil.getAPI(
      ApiConstants.weatherForecast,
      dio: _dio,
      queryParam: {
        "appid": AppConfig.apiKey,
        "units": TempUnits.standard.name,
        "lat": lat,
        "lon": lon,
      },
    );
    return response.data;
  }
}