// providers/location_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/features/current_location/data/location_repo_impl.dart';
import 'package:sky_cast/features/current_location/domain/entity/location_entity.dart';
import 'package:sky_cast/features/current_location/domain/repositories/location_repo.dart';
import 'package:sky_cast/features/current_location/domain/usecases/location_usecase.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
part 'location_notifier.dart';
part 'location_state.dart';

// Repo
final locationRepositoryProvider = Provider<LocationRepository>(
  (ref) => LocationRepositoryImpl(),
);

// UseCase
final getCurrentLocationUsecaseProvider = Provider(
  (ref) => GetCurrentLocationUsecase(ref.read(locationRepositoryProvider)),
);

final getCurrentLocationProvider =
    AutoDisposeNotifierProvider<LocationNotifier, LocationState>(
      LocationNotifier.new,
    );
