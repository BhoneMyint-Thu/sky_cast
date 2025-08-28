part of 'location_providers.dart';
class LocationNotifier extends AutoDisposeNotifier<LocationState> {
  late final GetCurrentLocationUsecase _getCurrentLocation;

  @override
  LocationState build() {
    _getCurrentLocation = ref.read(getCurrentLocationUsecaseProvider);
    return LocationInitial();
  }

  Future<void> getCurrentLocation() async {
    try {
      state = CurrentLocationLoading();
      final result = await _getCurrentLocation.call();
      result.fold(
        (error) {
          state = CurrentLocationErorr(error);
        },
        (loc) {
          state = CurrentLocationLoaded(loc);
        },
      );
    } catch (_) {
      state = CurrentLocationErorr(ErrorWrapper.somethingWentWrong());
    }
  }
}
