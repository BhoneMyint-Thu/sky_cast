import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/features/weather/data/di/weather_data_providers.dart';
import 'package:sky_cast/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:sky_cast/features/weather/domain/usecases/get_forecast_weather_usecase.dart';

final getCurrentWeatherUseCaseProvider = Provider<GetCurrentWeatherUseCase>((
  ref,
) {
  final repo = ref.read(currentWeatherRepoProvider);
  return GetCurrentWeatherUseCase(repo);
});

final getForecastWeatherUseCaseProvider = Provider<GetForecastWeatherUsecase>((
  ref,
) {
  final repo = ref.read(forecastWeatherRepoProvider);
  return GetForecastWeatherUsecase(repo);
});
