part of 'location_providers.dart';
sealed class LocationState {}
final class LocationInitial extends LocationState {}

final class CurrentLocationLoading extends LocationState {}

final class CurrentLocationLoaded extends LocationState {
  final LocationEntity location;
  CurrentLocationLoaded(this.location);
}

final class CurrentLocationErorr extends LocationState {
  final ErrorWrapper error;
  CurrentLocationErorr(this.error);
}
