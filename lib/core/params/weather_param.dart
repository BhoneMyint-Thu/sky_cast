sealed class WeatherParam {
  const WeatherParam();
}

class WeatherByCityParam extends WeatherParam {
  final String cityName;
  const WeatherByCityParam(this.cityName);
}

class WeatherByLatLngParam extends WeatherParam {
  final double lat;
  final double lon;
  const WeatherByLatLngParam({required this.lat,required  this.lon});
}
