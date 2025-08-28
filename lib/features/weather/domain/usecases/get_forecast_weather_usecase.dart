import 'package:dartz/dartz.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
import 'package:sky_cast/features/weather/domain/entity/forecast_entity.dart';
import 'package:sky_cast/features/weather/domain/repositories/forecast_weather_repo.dart';

class GetForecastWeatherUsecase {
  final ForecastWeatherRepo _repo;

  GetForecastWeatherUsecase(this._repo);

  Future<Either<ErrorWrapper, ForecastEntity>> call({
    required WeatherParam query,
  }) {
    return _repo.getForecastWeather(query: query,);
  }
}
