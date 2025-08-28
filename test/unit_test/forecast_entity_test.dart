import 'package:flutter_test/flutter_test.dart';
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';
import 'package:sky_cast/features/weather/domain/entity/forecast_entity.dart';
import 'package:sky_cast/features/weather/domain/value_objects/temperature_vo.dart';

void main() {
  group('ForecastEntity', () {
    final dateTime = DateTime.parse('2025-08-29 12:00:00');
    final tempVO = TemperatureVO.fromKelvin(300);

    final weather1 = WeatherEntity(
      weatherID: 1,
      cityName: 'Yangon',
      country: 'Myanmar',
      dateTime: dateTime,
      temperature: tempVO,
      condition: 'Clear',
      description: 'Sunny',
      icon: '01d',
    );

    final weather2 = WeatherEntity(
      weatherID: 2,
      cityName: 'Mandalay',
      country: 'Myanmar',
      dateTime: dateTime.add(const Duration(hours: 1)),
      temperature: tempVO,
      condition: 'Cloudy',
      description: 'Overcast',
      icon: '02d',
    );

    test('should create ForecastEntity with hourly and daily lists', () {
      final forecast = ForecastEntity(
        hourly: [weather1, weather2],
        daily: [weather1],
      );

      expect(forecast.hourly.length, 2);
      expect(forecast.daily.length, 1);
      expect(forecast.hourly[0].cityName, 'Yangon');
      expect(forecast.daily[0].cityName, 'Yangon');
    });

    test('should correctly integrate with WeatherEntity', () {
      final forecast = ForecastEntity(
        hourly: [weather1],
        daily: [weather2],
      );

      expect(forecast.hourly[0].temperature.inCelsius, closeTo(26.85,0.01));
      expect(forecast.daily[0].temperature.inFahrenheit, closeTo(80.33,0.01));
    });
  });
}
