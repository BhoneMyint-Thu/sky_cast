import 'package:sky_cast/core/enums/temp_units.dart';

class TemperatureVO {
  final double value; // stored in Kelvin internally

  TemperatureVO(this.value);

  factory TemperatureVO.fromKelvin(double kelvin) => TemperatureVO(kelvin);

  double get inKelvin => value;
  double get inCelsius => value - 273.15;
  double get inFahrenheit => (value * 9 / 5) - 459.67;

  double as(TempUnits unit) {
    switch (unit) {
      case TempUnits.standard:
        return inKelvin;
      case TempUnits.metric:
        return inCelsius;
      case TempUnits.imperial:
        return inFahrenheit;
    }
  }

  String display(TempUnits unit) {
    switch (unit) {
      case TempUnits.standard:
        return "${as(unit).toStringAsFixed(1)} K";
      case TempUnits.metric:
        return "${as(unit).toStringAsFixed(1)} °C";
      case TempUnits.imperial:
        return "${as(unit).toStringAsFixed(1)} °F";
    }
  }
}
