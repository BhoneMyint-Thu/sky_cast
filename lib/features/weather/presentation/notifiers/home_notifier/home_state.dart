part of 'home_providers.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class CurrentWeatherLoading extends HomeState {}

final class CurrentWeatherLoaded extends HomeState {
  final WeatherEntity weather;
  CurrentWeatherLoaded(this.weather);
}

final class CurrentWeatherError extends HomeState {
  final ErrorWrapper error;
  CurrentWeatherError(this.error);
}
