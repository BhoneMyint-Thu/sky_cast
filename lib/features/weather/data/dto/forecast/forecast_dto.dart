import 'package:json_annotation/json_annotation.dart';
import 'package:sky_cast/features/weather/data/dto/weather/weather_dto.dart';

part 'forecast_dto.g.dart';

@JsonSerializable()
class ForecastDto {
  final String? cod;
  final int? message;
  final int? cnt;
  final List<ForecastItemDto>? list;
  final CityDto? city;

  ForecastDto({
    this.cod,
    this.message,
    this.cnt,
    this.list,
    this.city,
  });

  factory ForecastDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDtoToJson(this);
}

@JsonSerializable()
class ForecastItemDto {
  final int? dt;
  final MainDto? main;
  final List<WeatherConditionDto>? weather;
  final CloudsDto? clouds;
  final WindDto? wind;
  final int? visibility;
  final double? pop;
  final RainDto? rain;
  final SysForecastDto? sys;

  @JsonKey(name: "dt_txt")
  final String? dtTxt;

  ForecastItemDto({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.pop,
    this.rain,
    this.sys,
    this.dtTxt,
  });

  factory ForecastItemDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemDtoFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastItemDtoToJson(this);
}

@JsonSerializable()
class RainDto {
  @JsonKey(name: "3h")
  final double? threeH;

  RainDto({this.threeH});

  factory RainDto.fromJson(Map<String, dynamic> json) =>
      _$RainDtoFromJson(json);
  Map<String, dynamic> toJson() => _$RainDtoToJson(this);
}

@JsonSerializable()
class SysForecastDto {
  final String? pod; // "d" or "n"

  SysForecastDto({this.pod});

  factory SysForecastDto.fromJson(Map<String, dynamic> json) =>
      _$SysForecastDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SysForecastDtoToJson(this);
}

@JsonSerializable()
class CityDto {
  final int? id;
  final String? name;
  final CoordDto? coord;
  final String? country;
  final int? population;
  final int? timezone;
  final int? sunrise;
  final int? sunset;

  CityDto({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
    this.sunrise,
    this.sunset,
  });

  factory CityDto.fromJson(Map<String, dynamic> json) =>
      _$CityDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CityDtoToJson(this);
}
