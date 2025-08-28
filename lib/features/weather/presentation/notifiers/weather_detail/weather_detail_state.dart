part of 'weather_detail_provider.dart';

sealed class WeatherDetailState {}

final class WeatherDetailInitial extends WeatherDetailState {}

final class CurrentWeatherLoading extends WeatherDetailState {}

final class CurrentWeatherLoaded extends WeatherDetailState {
  final WeatherEntity weather;
  CurrentWeatherLoaded(this.weather);
}

final class CurrentWeatherError extends WeatherDetailState {
  final ErrorWrapper error;
  CurrentWeatherError(this.error);
}

final class ForecastWeatherLoading extends WeatherDetailState {}

final class ForecastWeatherLoaded extends WeatherDetailState {
  final ForecastEntity forecasts;
  ForecastWeatherLoaded(this.forecasts);
}

final class ForecastWeatherError extends WeatherDetailState {
  final ErrorWrapper error;
  ForecastWeatherError(this.error);
}
