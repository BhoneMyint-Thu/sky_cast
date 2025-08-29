part of 'home_providers.dart';

class WeatherNotifier extends AutoDisposeNotifier<HomeState> {
  late final GetCurrentWeatherUseCase _getWeatherUseCase;

  @override
  HomeState build() {
    _getWeatherUseCase = ref.read(getCurrentWeatherUseCaseProvider);
    return HomeInitial();
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
