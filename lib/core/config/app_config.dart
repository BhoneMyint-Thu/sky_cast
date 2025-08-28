import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final apiKey = dotenv.env['weather_api_key'] ?? '';
  static final apiBaseUrl = dotenv.env['api_base_url'] ?? '';
}
