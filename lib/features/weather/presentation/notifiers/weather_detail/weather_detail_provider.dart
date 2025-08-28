import 'package:flutter/material.dart' show Gradient, Color, Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/core/enums/weather_conditions.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/core/utils/weather_condition_util.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
import 'package:sky_cast/features/weather/domain/di/weather_domain_providers.dart';
import 'package:sky_cast/features/weather/domain/entity/forecast_entity.dart';
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';
import 'package:sky_cast/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:sky_cast/features/weather/domain/usecases/get_forecast_weather_usecase.dart';

part 'weather_detail_state.dart';
part 'weather_detail_notifier.dart';

final currentWeatherProvider =
    AutoDisposeNotifierProvider<CurrentWeatherNotifier, WeatherDetailState>(
      CurrentWeatherNotifier.new,
    );
final forecastWeatherProvider =
    AutoDisposeNotifierProvider<ForecastWeatherNotifier, WeatherDetailState>(
      ForecastWeatherNotifier.new,
    );

final weatherBackgroundProvider =
    AutoDisposeStateProvider.family<Gradient, int>((ref, id) {
      final condition = WeatherConditionUtil.mapCodeToCondition(id);
      return WeatherConditionUtil.gradientFor(condition);
    });
