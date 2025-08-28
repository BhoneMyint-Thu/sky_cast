import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';
import 'package:sky_cast/features/weather/domain/repositories/current_weather_repo.dart';
import 'package:sky_cast/features/weather/domain/usecases/get_current_weather_usecase.dart';
import 'package:sky_cast/features/weather/domain/value_objects/temperature_vo.dart';

class MockCurrentWeatherRepo extends Mock implements CurrentWeatherRepo {}

void main() {
  late GetCurrentWeatherUseCase useCase;
  late MockCurrentWeatherRepo mockRepo;

  setUp(() {
    mockRepo = MockCurrentWeatherRepo();
    useCase = GetCurrentWeatherUseCase(mockRepo);
  });

  final query = const WeatherByCityParam('Yangon');
  final weatherEntity = WeatherEntity(
    weatherID: 1,
    cityName: 'Yangon',
    country: 'Myanmar',
    dateTime: DateTime.parse('2025-08-29 12:00:00'),
    temperature: TemperatureVO.fromKelvin(300),
    condition: 'Clear',
    description: 'Sunny',
    icon: '01d',
  );

  group('GetCurrentWeatherUseCase', () {
    test('should return WeatherEntity when repository returns Right', () async {
      when(
        () => mockRepo.getCurrentWeather(query: query),
      ).thenAnswer((_) async => Right(weatherEntity));

      final result = await useCase.call(query: query);

      expect(result.isRight(), true);
      result.fold(
        (_) => fail('Expected Right, got Left'),
        (entity) => expect(entity.cityName, 'Yangon'),
      );
      verify(() => mockRepo.getCurrentWeather(query: query)).called(1);
    });

    test('should return ErrorWrapper when repository returns Left', () async {
      final error = ErrorWrapper(message: 'Network error');

      when(
        () => mockRepo.getCurrentWeather(query: query),
      ).thenAnswer((_) async => Left(error));

      final result = await useCase.call(query: query);

      expect(result.isLeft(), true);
      result.fold(
        (e) => expect(e.message, 'Network error'),
        (_) => fail('Expected Left, got Right'),
      );
      verify(() => mockRepo.getCurrentWeather(query: query)).called(1);
    });
  });
}
