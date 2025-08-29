part of 'weather_detail_provider.dart';

class CurrentWeatherNotifier extends AutoDisposeNotifier<WeatherDetailState> {
  late final GetCurrentWeatherUseCase _getWeatherUseCase;

  @override
  WeatherDetailState build() {
    _getWeatherUseCase = ref.read(getCurrentWeatherUseCaseProvider);
    return WeatherDetailInitial();
  }

  Future<void> getCurrentWeather({required WeatherParam query}) async {
    try {
      state = CurrentWeatherLoading();
      final result = await _getWeatherUseCase.call(query: query);
      result.fold(
        (error) {
          state = CurrentWeatherError(error);
        },
        (weather) {
          state = CurrentWeatherLoaded(weather);
        },
      );
    } catch (_) {
      state = CurrentWeatherError(ErrorWrapper.somethingWentWrong());
    }
  }
}

class ForecastWeatherNotifier extends AutoDisposeNotifier<WeatherDetailState> {
  late final GetForecastWeatherUsecase _getWeatherUseCase;

  @override
  WeatherDetailState build() {
    _getWeatherUseCase = ref.read(getForecastWeatherUseCaseProvider);
    return WeatherDetailInitial();
  }

  Future<void> getForecastWeather({required WeatherParam query}) async {
    try {
      state = ForecastWeatherLoading();
      final result = await _getWeatherUseCase.call(query: query);
      result.fold(
        (error) {
          state = ForecastWeatherError(error);
        },
        (weather) {
          state = ForecastWeatherLoaded(weather);
        },
      );
    } catch (_) {
      state = ForecastWeatherError(ErrorWrapper.somethingWentWrong());
    }
  }
}
