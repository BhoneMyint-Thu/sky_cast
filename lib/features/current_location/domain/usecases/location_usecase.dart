import 'package:dartz/dartz.dart';
import 'package:sky_cast/features/current_location/domain/entity/location_entity.dart';
import 'package:sky_cast/features/current_location/domain/repositories/location_repo.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';

class GetCurrentLocationUsecase {
  final LocationRepository repository;

  GetCurrentLocationUsecase(this.repository);

  Future<Either<ErrorWrapper, LocationEntity>> call() async {
    try {
      final location = await repository.getCurrentLocation();
      return location;
    } catch (e) {
      return Left(ErrorWrapper(message: "Failed to get location."));
    }
  }
}
