import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
import 'package:sky_cast/features/weather/data/remote_source/remote_source.dart';
import 'package:sky_cast/features/weather/data/repo_impl/current_weather_repo_impl.dart';

class MockRemoteSource extends Mock implements CurrentWeatherRemoteSource {}

void main() {
  late CurrentWeatherRepoImpl repo;
  late MockRemoteSource mockRemote;

  setUp(() {
    mockRemote = MockRemoteSource();
    repo = CurrentWeatherRepoImpl(mockRemote);
  });
  final weatherJson = {
    "coord": {"lon": 96.15, "lat": 16.85},
    "weather": [
      {"id": 800, "main": "Clear", "description": "Sunny", "icon": "01d"},
    ],
    "main": {
      "temp": 300.0,
      "feels_like": 300.0,
      "temp_min": 298.0,
      "temp_max": 302.0,
      "pressure": 1010,
      "humidity": 70,
    },
    "wind": {"speed": 3.6, "deg": 200},
    "clouds": {"all": 0},
    "dt": 1693305600,
    "sys": {"country": "MM", "sunrise": 1693264800, "sunset": 1693310400},
    "timezone": 21600,
    "id": 1283240,
    "name": "Yangon",
  };

  // WeatherDto.fromJson(weatherJson).toEntity();
  final query = const WeatherByCityParam('Yangon');

  group('CurrentWeatherRepoImpl', () {
    test('should return WeatherEntity on successful remote call', () async {
      when(
        () => mockRemote.getCurrentWeather(query: query),
      ).thenAnswer((_) async => weatherJson);

      final result = await repo.getCurrentWeather(query: query);

      expect(result.isRight(), true);
      result.fold(
        (_) => fail('Expected Right, got Left'),
        (entity) => expect(entity.cityName, 'Yangon'),
      );
    });

    test('should return ErrorWrapper on DioException', () async {
      when(
        () => mockRemote.getCurrentWeather(query: query),
      ).thenThrow(DioException(requestOptions: RequestOptions(path: '')));

      final result = await repo.getCurrentWeather(query: query);

      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error, isA<ErrorWrapper>()),
        (_) => fail('Expected Left, got Right'),
      );
    });

    test('should return ErrorWrapper on generic exception', () async {
      when(
        () => mockRemote.getCurrentWeather(query: query),
      ).thenThrow(Exception('Something went wrong'));

      final result = await repo.getCurrentWeather(query: query);

      expect(result.isLeft(), true);
      result.fold(
        (error) => expect(error.message, contains('Unexpected error')),
        (_) => fail('Expected Left, got Right'),
      );
    });
  });
}
