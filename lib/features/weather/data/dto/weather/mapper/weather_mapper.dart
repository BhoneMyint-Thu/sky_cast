import 'package:sky_cast/features/weather/data/dto/weather/weather_dto.dart';
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';
import 'package:sky_cast/features/weather/domain/value_objects/temperature_vo.dart';

extension WeatherMapper on WeatherDto {
  WeatherEntity toEntity() {
    final weather = (this.weather ?? []).isNotEmpty
        ? this.weather!.first
        : null;

    return WeatherEntity(
      weatherID: weather?.id ?? -1,
      cityName: name ?? "",
      country: sys?.country ?? "",
      dateTime: DateTime.fromMillisecondsSinceEpoch((dt ?? 0) * 1000),
      temperature: TemperatureVO.fromKelvin(main?.temp ?? 0),
      condition: weather?.main ?? "",
      description: weather?.description ?? "",
      icon: weather?.icon ?? "",
    );
  }
}
