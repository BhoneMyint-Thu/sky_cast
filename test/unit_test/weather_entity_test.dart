import 'package:flutter_test/flutter_test.dart';
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';
import 'package:sky_cast/features/weather/domain/value_objects/temperature_vo.dart';

void main() {
  group('WeatherEntity', () {
    final dateTime = DateTime.parse('2025-08-29 12:00:00');
    final tempVO = TemperatureVO.fromKelvin(300);

    test('should create WeatherEntity correctly', () {
      final weather = WeatherEntity(
        weatherID: 1,
        cityName: 'Yangon',
        country: 'Myanmar',
        dateTime: dateTime,
        temperature: tempVO,
        condition: 'Clear',
        description: 'Sunny',
        icon: '01d',
      );

      expect(weather.weatherID, 1);
      expect(weather.cityName, 'Yangon');
      expect(weather.country, 'Myanmar');
      expect(weather.dateTime, dateTime);
      expect(weather.temperature, tempVO);
      expect(weather.condition, 'Clear');
      expect(weather.description, 'Sunny');
      expect(weather.icon, '01d');
    });

    test('should correctly expose TemperatureVO values', () {
      final weather = WeatherEntity(
        weatherID: 2,
        cityName: 'Mandalay',
        country: 'Myanmar',
        dateTime: dateTime,
        temperature: tempVO,
        condition: 'Cloudy',
        description: 'Overcast',
        icon: '02d',
      );

      expect(weather.temperature.inCelsius,closeTo( 26.85,0.01));
      expect(weather.temperature.inFahrenheit,closeTo( 80.33,0.01));
      expect(weather.temperature.inKelvin, closeTo(300,0.01));
    });
  });
}
