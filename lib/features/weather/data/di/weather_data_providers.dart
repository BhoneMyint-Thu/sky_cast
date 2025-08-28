import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/core/dependency_container/dependency_container.dart';
import 'package:sky_cast/features/weather/data/remote_source/remote_service.dart';
import 'package:sky_cast/features/weather/data/remote_source/remote_source.dart';
import 'package:sky_cast/features/weather/data/repo_impl/current_weather_repo_impl.dart';
import 'package:sky_cast/features/weather/data/repo_impl/forecast_weather_repo_impl.dart';
import 'package:sky_cast/features/weather/domain/repositories/current_weather_repo.dart';
import 'package:sky_cast/features/weather/domain/repositories/forecast_weather_repo.dart';

final currentWeatherRemoteServiceProvider =
    Provider<CurrentWeatherRemoteSource>((ref) {
      final dio = ref.read(dioProvider);
      return CurrentWeatherRemoteService(dio);
    });

final currentWeatherRepoProvider = Provider<CurrentWeatherRepo>((ref) {
  final remoteSource = ref.read(currentWeatherRemoteServiceProvider);
  return CurrentWeatherRepoImpl(remoteSource);
});

final forecastWeatherRemoteServiceProvider =
    Provider<ForecastWeatherRemoteSource>((ref) {
      final dio = ref.read(dioProvider);
      return ForecastWeatherRemoteService(dio);
    });

final forecastWeatherRepoProvider = Provider<ForecastWeatherRepo>((ref) {
  final remoteSource = ref.read(forecastWeatherRemoteServiceProvider);
  return ForecastWeatherRepoImpl(remoteSource);
});
