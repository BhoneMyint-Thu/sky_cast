import 'package:sky_cast/features/weather/domain/value_objects/temperature_vo.dart';

class WeatherEntity {
  final int weatherID;
  final String cityName;
  final String country;
  final DateTime dateTime;
  final TemperatureVO temperature;
  final String condition;
  final String description;
  final String icon;

  WeatherEntity({
    required this.weatherID,
    required this.cityName,
    required this.country,
    required this.temperature,
    required this.condition,
    required this.description,
    required this.icon,
    required this.dateTime,
  });
}


