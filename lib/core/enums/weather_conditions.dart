enum WeatherCondition {
  clear,
  clouds,
  rain,
  drizzle,
  snow,
  thunderstorm,
  atmosphere,
  unknown,
}


WeatherCondition mapToCondition(int code) {
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
