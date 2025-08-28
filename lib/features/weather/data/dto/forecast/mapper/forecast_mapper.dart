import 'package:sky_cast/features/weather/data/dto/forecast/forecast_dto.dart';
import 'package:sky_cast/features/weather/domain/entity/forecast_entity.dart';
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';
import 'package:sky_cast/features/weather/domain/value_objects/temperature_vo.dart';

// extension ForecastDtoMapper on ForecastDto {
//   List<WeatherEntity> toForecastList() {
//     return (list ?? []).map((item) {
//       final weatherItem = (item.weather ?? []).isNotEmpty
//           ? item.weather!.first
//           : null;
//       return WeatherEntity(
//         country: city?.country ?? "",
//         cityName: city?.name ?? "",
//         dateTime: DateTime.fromMillisecondsSinceEpoch((item.dt ?? 0) * 1000),
//         temperature: TemperatureVO.fromKelvin(item.main?.temp ?? 0),
//         condition: weatherItem?.main ?? "",
//         description: weatherItem?.description ?? "",
//         icon: weatherItem?.icon ?? "",
//       );
//     }).toList();
//   }
// }

extension ForecastMapper on ForecastDto {
  ForecastEntity toEntity() {
    final cityName = city?.name ?? "";

    // map all items first
    final all = (list ?? []).map((item) {
      final weatherItem = (item.weather ?? []).isNotEmpty
          ? item.weather!.first
          : null;

      return WeatherEntity(
        weatherID: weatherItem?.id ?? -1,
        dateTime: DateTime.fromMillisecondsSinceEpoch((item.dt ?? 0) * 1000),
        temperature: TemperatureVO.fromKelvin(item.main?.temp ?? 0),
        condition: weatherItem?.main ?? "",
        description: weatherItem?.description ?? "",
        icon: weatherItem?.icon ?? "",
        cityName: cityName,
        country: city?.country ?? "",
      );
    }).toList();

    // hourly: just take the next 8 items (~24 hours if 3h interval)
    final hourly = all.take(8).toList();

    // daily: pick 1 item per day (e.g., the one at 12:00)
    final daily = <WeatherEntity>[];
    final grouped = <String, List<WeatherEntity>>{};

    for (final item in all) {
      final key =
          "${item.dateTime.year}-${item.dateTime.month}-${item.dateTime.day}";
      grouped.putIfAbsent(key, () => []).add(item);
    }

    for (final entry in grouped.entries) {
      // pick the forecast closest to midday
      final byHour = entry.value;
      byHour.sort(
        (a, b) => (a.dateTime.hour - 12).abs().compareTo(
          (b.dateTime.hour - 12).abs(),
        ),
      );
      daily.add(byHour.first);
    }

    return ForecastEntity(hourly: hourly, daily: daily);
  }
}
