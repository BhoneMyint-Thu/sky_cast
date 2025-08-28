import 'package:sky_cast/core/api_constants.dart';

class UrlUtil {
  /// Get OpenWeatherMap icon url
  /// - [size] = 1 → default (50x50, no suffix)
  /// - [size] = 2 → 100x100 (@2x)
  /// - [size] = 4 → 200x200 (@4x)
  static String getWeatherIconUrl(String icon, {int size = 1}) {
    String suffix = "";

    if (size == 2) {
      suffix = "@2x";
    } else if (size == 4) {
      suffix = "@4x";
    }

    final url = "${ApiConstants.weatherIconBase}$icon$suffix.png";
    print("url==>$url");
    return url;
  }
}
