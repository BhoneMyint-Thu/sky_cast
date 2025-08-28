import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/features/weather/data/dto/forecast/forecast_dto.dart';
import 'package:sky_cast/features/weather/data/dto/forecast/mapper/forecast_mapper.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
import 'package:sky_cast/features/weather/data/remote_source/remote_source.dart';
import 'package:sky_cast/features/weather/domain/entity/forecast_entity.dart';
import 'package:sky_cast/features/weather/domain/repositories/forecast_weather_repo.dart';

class ForecastWeatherRepoImpl implements ForecastWeatherRepo {
  final ForecastWeatherRemoteSource _remoteSource;
  ForecastWeatherRepoImpl(this._remoteSource);
  @override
  Future<Either<ErrorWrapper, ForecastEntity>> getForecastWeather({
    required WeatherParam query,
  }) async {
    try {
      // Call forecast API
      final forecastResponse = await _remoteSource.getForecastWeather(
        query: query,
      );
      final forecastDto = ForecastDto.fromJson(forecastResponse);

      return Right(forecastDto.toEntity());
    } on DioException catch (e) {
      return Left(ErrorWrapper.dio(e));
    } catch (e) {
      return Left(ErrorWrapper(message: "Unexpected error."));
    }
  }
}
