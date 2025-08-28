// domain/repositories/location_repository.dart

import 'package:dartz/dartz.dart';
import 'package:sky_cast/features/current_location/domain/entity/location_entity.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';

abstract class LocationRepository {
  Future<Either<ErrorWrapper,LocationEntity>> getCurrentLocation();
}
