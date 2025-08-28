// data/repositories/location_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sky_cast/features/current_location/domain/entity/location_entity.dart';
import 'package:sky_cast/features/current_location/domain/repositories/location_repo.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';

class LocationRepositoryImpl implements LocationRepository {
  @override
  Future<Either<ErrorWrapper, LocationEntity>> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Left(ErrorWrapper(message: "Location permissions are denied."));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Left(
        ErrorWrapper(message: "Location permissions are permanently denied"),
      );
    }

    // Get position
    final pos = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.medium),
    );

    return Right(
      LocationEntity(latitude: pos.latitude, longitude: pos.longitude),
    );
  }
}
