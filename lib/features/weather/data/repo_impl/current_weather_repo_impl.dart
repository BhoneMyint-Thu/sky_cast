import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/features/weather/data/dto/weather/mapper/weather_mapper.dart';
import 'package:sky_cast/features/weather/data/dto/weather/weather_dto.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
import 'package:sky_cast/features/weather/data/remote_source/remote_source.dart';
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';
import 'package:sky_cast/features/weather/domain/repositories/current_weather_repo.dart';

class CurrentWeatherRepoImpl implements CurrentWeatherRepo {
  final CurrentWeatherRemoteSource _remoteSource;
  CurrentWeatherRepoImpl(this._remoteSource);

  @override
  Future<Either<ErrorWrapper, WeatherEntity>> getCurrentWeather({
    required WeatherParam query,
  }) async {
    try {
      final response = await _remoteSource.getCurrentWeather(
        query: query,
      );
      final weatherDto = WeatherDto.fromJson(response);
      final weatherEntity = weatherDto.toEntity();
      return Right(weatherEntity);
    } on DioException catch (e) {
      return Left(ErrorWrapper.dio(e));
    } catch (e) {
      return Left(ErrorWrapper(message: "Unexpected error: $e"));
    }
  }
}
