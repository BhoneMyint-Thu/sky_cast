// data/mapper/weather_mapper.dart

import 'package:flutter/material.dart';
import 'package:sky_cast/core/enums/weather_conditions.dart';
import 'package:sky_cast/core/utils/color_util.dart';

class WeatherConditionUtil {
  static WeatherCondition mapCodeToCondition(int code) {
    if (code >= 200 && code < 300) {
      return WeatherCondition.thunderstorm;
    } else if (code >= 300 && code < 400) {
      return WeatherCondition.drizzle;
    } else if (code >= 500 && code < 600) {
      return WeatherCondition.rain;
    } else if (code >= 600 && code < 700) {
      return WeatherCondition.snow;
    } else if (code >= 700 && code < 800) {
      return WeatherCondition.atmosphere;
    } else if (code == 800) {
      return WeatherCondition.clear;
    } else if (code > 800 && code < 900) {
      return WeatherCondition.clouds;
    } else {
      return WeatherCondition.unknown;
    }
  }

  static LinearGradient gradientFor(WeatherCondition condition) {
    switch (condition) {
      case WeatherCondition.clear:
        return const LinearGradient(
          colors: [ColorUtil.yellow, ColorUtil.amber],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );

      case WeatherCondition.clouds:
        return const LinearGradient(
          colors: [ColorUtil.darkGray, ColorUtil.slate],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );

      case WeatherCondition.rain:
      case WeatherCondition.drizzle:
        return const LinearGradient(
          colors: [ColorUtil.teal, ColorUtil.stormBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );

      case WeatherCondition.snow:
        return const LinearGradient(
          colors: [ColorUtil.icyBlue, ColorUtil.mediumBlue],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );

      case WeatherCondition.thunderstorm:
        return const LinearGradient(
          colors: [ColorUtil.darkNavy, ColorUtil.darkTeal],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );

      case WeatherCondition.atmosphere:
        return const LinearGradient(
          colors: [ColorUtil.deepGray, ColorUtil.tealGray],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );

      case WeatherCondition.unknown:
        return const LinearGradient(
          colors: [ColorUtil.unknownDark, ColorUtil.unknownDarker],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        );
    }
  }
}
