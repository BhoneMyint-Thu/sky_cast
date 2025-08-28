part of 'weather_detail_provider.dart';

class CurrentWeatherNotifier extends AutoDisposeNotifier<WeatherDetailState> {
  late final GetCurrentWeatherUseCase _getWeatherUseCase;

  @override
  WeatherDetailState build() {
    _getWeatherUseCase = ref.read(getCurrentWeatherUseCaseProvider);
    return WeatherDetailInitial();
  }

  Future<void> getCurrentWeather({required WeatherParam query}) async {
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
  }
}
