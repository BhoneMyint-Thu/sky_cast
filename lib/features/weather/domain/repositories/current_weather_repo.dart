import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CurrentWeatherRepo {
  Future<Either<ErrorWrapper, WeatherEntity>> getCurrentWeather({
    required WeatherParam query,
  });
}
