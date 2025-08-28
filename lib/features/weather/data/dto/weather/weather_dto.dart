import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

@JsonSerializable()
class WeatherDto {
  final CoordDto? coord;
  final List<WeatherConditionDto>? weather;
  final MainDto? main;
  final WindDto? wind;
  final CloudsDto? clouds;
  final int? dt;
  final SysDto? sys;
  final int? timezone;
  final int? id;
  final String? name;

  WeatherDto({
    this.coord,
    this.weather,
    this.main,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
  });

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}

@JsonSerializable()
class CoordDto {
  final double? lon;
  final double? lat;

  CoordDto({this.lon, this.lat});

  factory CoordDto.fromJson(Map<String, dynamic> json) =>
      _$CoordDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CoordDtoToJson(this);
}

@JsonSerializable()
class WeatherConditionDto {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  WeatherConditionDto({this.id, this.main, this.description, this.icon});

  factory WeatherConditionDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherConditionDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherConditionDtoToJson(this);
}

@JsonSerializable()
class MainDto {
  final double? temp;
  @JsonKey(name: "feels_like")
  final double? feelsLike;
  @JsonKey(name: "temp_min")
  final double? tempMin;
  @JsonKey(name: "temp_max")
  final double? tempMax;
  final int? pressure;
  final int? humidity;

  MainDto({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory MainDto.fromJson(Map<String, dynamic> json) =>
      _$MainDtoFromJson(json);
  Map<String, dynamic> toJson() => _$MainDtoToJson(this);
}

@JsonSerializable()
class WindDto {
  final double? speed;
  final int? deg;

  WindDto({this.speed, this.deg});

  factory WindDto.fromJson(Map<String, dynamic> json) =>
      _$WindDtoFromJson(json);
  Map<String, dynamic> toJson() => _$WindDtoToJson(this);
}

@JsonSerializable()
class CloudsDto {
  final int? all;

  CloudsDto({this.all});

  factory CloudsDto.fromJson(Map<String, dynamic> json) =>
      _$CloudsDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CloudsDtoToJson(this);
}

@JsonSerializable()
class SysDto {
  final String? country;
  final int? sunrise;
  final int? sunset;

  SysDto({this.country, this.sunrise, this.sunset});

  factory SysDto.fromJson(Map<String, dynamic> json) => _$SysDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SysDtoToJson(this);
}
