import 'package:dartz/dartz.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';
import 'package:sky_cast/features/weather/domain/repositories/current_weather_repo.dart';

class GetCurrentWeatherUseCase {
  final CurrentWeatherRepo _repo;

  GetCurrentWeatherUseCase(this._repo);

  Future<Either<ErrorWrapper, WeatherEntity>> call({
    required WeatherParam query,
  }) {
    return _repo.getCurrentWeather(query: query,);
  }
}
