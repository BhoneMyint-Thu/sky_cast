// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDto _$ForecastDtoFromJson(Map<String, dynamic> json) => ForecastDto(
  cod: json['cod'] as String?,
  message: (json['message'] as num?)?.toInt(),
  cnt: (json['cnt'] as num?)?.toInt(),
  list: (json['list'] as List<dynamic>?)
      ?.map((e) => ForecastItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  city: json['city'] == null
      ? null
      : CityDto.fromJson(json['city'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ForecastDtoToJson(ForecastDto instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list,
      'city': instance.city,
    };

ForecastItemDto _$ForecastItemDtoFromJson(Map<String, dynamic> json) =>
    ForecastItemDto(
      dt: (json['dt'] as num?)?.toInt(),
      main: json['main'] == null
          ? null
          : MainDto.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherConditionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      clouds: json['clouds'] == null
          ? null
          : CloudsDto.fromJson(json['clouds'] as Map<String, dynamic>),
      wind: json['wind'] == null
          ? null
          : WindDto.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: (json['visibility'] as num?)?.toInt(),
      pop: (json['pop'] as num?)?.toDouble(),
      rain: json['rain'] == null
          ? null
          : RainDto.fromJson(json['rain'] as Map<String, dynamic>),
      sys: json['sys'] == null
          ? null
          : SysForecastDto.fromJson(json['sys'] as Map<String, dynamic>),
      dtTxt: json['dt_txt'] as String?,
    );

Map<String, dynamic> _$ForecastItemDtoToJson(ForecastItemDto instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'clouds': instance.clouds,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'pop': instance.pop,
      'rain': instance.rain,
      'sys': instance.sys,
      'dt_txt': instance.dtTxt,
    };

RainDto _$RainDtoFromJson(Map<String, dynamic> json) =>
    RainDto(threeH: (json['3h'] as num?)?.toDouble());

Map<String, dynamic> _$RainDtoToJson(RainDto instance) => <String, dynamic>{
  '3h': instance.threeH,
};

SysForecastDto _$SysForecastDtoFromJson(Map<String, dynamic> json) =>
    SysForecastDto(pod: json['pod'] as String?);

Map<String, dynamic> _$SysForecastDtoToJson(SysForecastDto instance) =>
    <String, dynamic>{'pod': instance.pod};

CityDto _$CityDtoFromJson(Map<String, dynamic> json) => CityDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  coord: json['coord'] == null
      ? null
      : CoordDto.fromJson(json['coord'] as Map<String, dynamic>),
  country: json['country'] as String?,
  population: (json['population'] as num?)?.toInt(),
  timezone: (json['timezone'] as num?)?.toInt(),
  sunrise: (json['sunrise'] as num?)?.toInt(),
  sunset: (json['sunset'] as num?)?.toInt(),
);

Map<String, dynamic> _$CityDtoToJson(CityDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'coord': instance.coord,
  'country': instance.country,
  'population': instance.population,
  'timezone': instance.timezone,
  'sunrise': instance.sunrise,
  'sunset': instance.sunset,
};
