// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
  coord: json['coord'] == null
      ? null
      : CoordDto.fromJson(json['coord'] as Map<String, dynamic>),
  weather: (json['weather'] as List<dynamic>?)
      ?.map((e) => WeatherConditionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  main: json['main'] == null
      ? null
      : MainDto.fromJson(json['main'] as Map<String, dynamic>),
  wind: json['wind'] == null
      ? null
      : WindDto.fromJson(json['wind'] as Map<String, dynamic>),
  clouds: json['clouds'] == null
      ? null
      : CloudsDto.fromJson(json['clouds'] as Map<String, dynamic>),
  dt: (json['dt'] as num?)?.toInt(),
  sys: json['sys'] == null
      ? null
      : SysDto.fromJson(json['sys'] as Map<String, dynamic>),
  timezone: (json['timezone'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
);

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'main': instance.main,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
    };

CoordDto _$CoordDtoFromJson(Map<String, dynamic> json) => CoordDto(
  lon: (json['lon'] as num?)?.toDouble(),
  lat: (json['lat'] as num?)?.toDouble(),
);

Map<String, dynamic> _$CoordDtoToJson(CoordDto instance) => <String, dynamic>{
  'lon': instance.lon,
  'lat': instance.lat,
};

WeatherConditionDto _$WeatherConditionDtoFromJson(Map<String, dynamic> json) =>
    WeatherConditionDto(
      id: (json['id'] as num?)?.toInt(),
      main: json['main'] as String?,
      description: json['description'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherConditionDtoToJson(
  WeatherConditionDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'main': instance.main,
  'description': instance.description,
  'icon': instance.icon,
};

MainDto _$MainDtoFromJson(Map<String, dynamic> json) => MainDto(
  temp: (json['temp'] as num?)?.toDouble(),
  feelsLike: (json['feels_like'] as num?)?.toDouble(),
  tempMin: (json['temp_min'] as num?)?.toDouble(),
  tempMax: (json['temp_max'] as num?)?.toDouble(),
  pressure: (json['pressure'] as num?)?.toInt(),
  humidity: (json['humidity'] as num?)?.toInt(),
);

Map<String, dynamic> _$MainDtoToJson(MainDto instance) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feelsLike,
  'temp_min': instance.tempMin,
  'temp_max': instance.tempMax,
  'pressure': instance.pressure,
  'humidity': instance.humidity,
};

WindDto _$WindDtoFromJson(Map<String, dynamic> json) => WindDto(
  speed: (json['speed'] as num?)?.toDouble(),
  deg: (json['deg'] as num?)?.toInt(),
);

Map<String, dynamic> _$WindDtoToJson(WindDto instance) => <String, dynamic>{
  'speed': instance.speed,
  'deg': instance.deg,
};

CloudsDto _$CloudsDtoFromJson(Map<String, dynamic> json) =>
    CloudsDto(all: (json['all'] as num?)?.toInt());

Map<String, dynamic> _$CloudsDtoToJson(CloudsDto instance) => <String, dynamic>{
  'all': instance.all,
};

SysDto _$SysDtoFromJson(Map<String, dynamic> json) => SysDto(
  country: json['country'] as String?,
  sunrise: (json['sunrise'] as num?)?.toInt(),
  sunset: (json['sunset'] as num?)?.toInt(),
);

Map<String, dynamic> _$SysDtoToJson(SysDto instance) => <String, dynamic>{
  'country': instance.country,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};
