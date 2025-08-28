import 'package:flutter_test/flutter_test.dart';
import 'package:sky_cast/core/enums/temp_units.dart';
import 'package:sky_cast/features/weather/domain/value_objects/temperature_vo.dart';

void main() {
  group('TemperatureVO', () {
    final kelvinValue = 300.0;
    final temperature = TemperatureVO.fromKelvin(kelvinValue);

    test('should store and return Kelvin correctly', () {
      expect(temperature.inKelvin, kelvinValue);
      expect(temperature.as(TempUnits.standard), kelvinValue);
    });

    test('should convert to Celsius correctly', () {
      final expectedCelsius = kelvinValue - 273.15;
      expect(temperature.inCelsius, expectedCelsius);
      expect(temperature.as(TempUnits.metric), expectedCelsius);
    });

    test('should convert to Fahrenheit correctly', () {
      final expectedFahrenheit = (kelvinValue * 9 / 5) - 459.67;
      expect(temperature.inFahrenheit, expectedFahrenheit);
      expect(temperature.as(TempUnits.imperial), expectedFahrenheit);
    });

    test('should display formatted values correctly', () {
      expect(temperature.display(TempUnits.standard), "${kelvinValue.toStringAsFixed(1)} K");
      expect(temperature.display(TempUnits.metric), "${(kelvinValue - 273.15).toStringAsFixed(1)} °C");
      expect(temperature.display(TempUnits.imperial), "${((kelvinValue * 9 / 5) - 459.67).toStringAsFixed(1)} °F");
    });
  });
}
