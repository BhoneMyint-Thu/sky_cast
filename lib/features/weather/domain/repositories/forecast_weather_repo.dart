
import 'package:dartz/dartz.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
import 'package:sky_cast/features/weather/domain/entity/forecast_entity.dart';

abstract class ForecastWeatherRepo {
  Future<Either<ErrorWrapper, ForecastEntity>> getForecastWeather({
    required WeatherParam query,
  });
}
