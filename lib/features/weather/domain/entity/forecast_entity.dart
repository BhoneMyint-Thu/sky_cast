
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';

class ForecastEntity {
  final List<WeatherEntity> hourly;
  final List<WeatherEntity> daily;

  ForecastEntity({
    required this.hourly,
    required this.daily,
  });
}
