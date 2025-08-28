import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/core/enums/temp_units.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/features/weather/data/error_wrapper/error_wrapper.dart';
import 'package:sky_cast/features/weather/domain/di/weather_domain_providers.dart';
import 'package:sky_cast/features/weather/domain/entity/weather_entity.dart';
import 'package:sky_cast/features/weather/domain/usecases/get_current_weather_usecase.dart';

part 'home_state.dart';
part 'home_notifier.dart';

final weatherNotifierProvider =
    AutoDisposeNotifierProvider<WeatherNotifier, HomeState>(
      WeatherNotifier.new,
    );


final selectedTempUnitProvider=AutoDisposeStateProvider((ref) => TempUnits.standard,);