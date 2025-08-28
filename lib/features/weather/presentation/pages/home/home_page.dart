import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/core/enums/temp_units.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/core/utils/color_util.dart';
import 'package:sky_cast/core/utils/date_helper.dart';
import 'package:sky_cast/core/utils/dialog_util.dart';
import 'package:sky_cast/core/utils/extensions/responsive_size_ext.dart';
import 'package:sky_cast/core/utils/extensions/text_theme_ext.dart';
import 'package:sky_cast/core/utils/screen_util.dart';
import 'package:sky_cast/core/utils/url_util.dart';
import 'package:sky_cast/features/current_location/domain/entity/location_entity.dart';
import 'package:sky_cast/features/current_location/presentation/notifier/location_providers.dart';
import 'package:sky_cast/features/weather/presentation/notifiers/home_notifier/home_providers.dart';
import 'package:sky_cast/features/weather/presentation/pages/weather_detail/weather_detail_page.dart';
import 'package:sky_cast/features/weather/presentation/widgets/custom_cached_network_image.dart';
import 'package:sky_cast/features/weather/presentation/widgets/custom_retry_error_widget.dart';
import 'package:sky_cast/features/weather/presentation/widgets/custom_text_form_field.dart';
import 'package:sky_cast/features/weather/presentation/widgets/shimmers/weather_item_shimmer.dart';
part 'widgets/weather_item.dart';
part 'widgets/pop_up_menu_button.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _searchBarCnt = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(getCurrentLocationProvider.notifier).getCurrentLocation();
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchBarCnt.dispose();
    super.dispose();
  }

  void goToWeatherDetail({
    required TempUnits selectedTempUnit,
    required String cityName,
  }) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>
          WeatherDetailPage(cityName: cityName, tempUnit: selectedTempUnit),
    ),
  );

  LocationEntity? _currentLocation;
  @override
  Widget build(BuildContext context) {
    ref.listen(getCurrentLocationProvider, (previous, next) {
      if (next is CurrentLocationLoaded) {
        _currentLocation = next.location;
        ref
            .read(weatherNotifierProvider.notifier)
            .getCurrentWeather(
              query: WeatherByLatLngParam(
                lat: next.location.latitude,
                lon: next.location.longitude,
              ),
            );
      } else if (next is CurrentLocationErorr) {
        DialogUtil.showWarningDialog(
          context,
          warningMessage: next.error.message ?? "",
        );
      }
    });
    return SafeArea(
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, _) {
            final selectedTempUnit = ref.watch(selectedTempUnitProvider);
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: true,
                  backgroundColor: Colors.black,
                  expandedHeight: 100.sp,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sky Cast", style: context.headlineMedium),
                        _PopUpMenuButton(
                          onSelected: (value) => ref
                              .read(selectedTempUnitProvider.notifier)
                              .update((state) => value),
                          selectedTempUnit: selectedTempUnit,
                        ),
                      ],
                    ),
                  ),
                ),

                PinnedHeaderSliver(
                  child: Container(
                    color: ColorUtil.darkGray,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            controller: _searchBarCnt,
                            fillColor: ColorUtil.darkGray,
                            borderColor: Colors.transparent,
                            hintText: "Search for a city",
                          ),
                        ),
                        SizedBox(width: 8.w),
                        IconButton(
                          onPressed: () => goToWeatherDetail(
                            selectedTempUnit: selectedTempUnit,
                            cityName: _searchBarCnt.text,
                          ),
                          icon: Icon(Icons.search, size: 35.sp),
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
                SliverToBoxAdapter(
                  child: Consumer(
                    builder: (context, ref, _) {
                      final weather = ref.watch(weatherNotifierProvider);

                      switch (weather) {
                        case CurrentWeatherLoading():
                          return const WeatherItemShimmer();
                        case CurrentWeatherLoaded(:final weather):
                          return InkWell(
                            onTap: () => goToWeatherDetail(
                              selectedTempUnit: selectedTempUnit,
                              cityName: weather.cityName,
                            ),

                            child: _WeatherItem(
                              cityName: weather.cityName,
                              temp: weather.temperature.display(
                                selectedTempUnit,
                              ),
                              time: DateHelper.formatTimeAmPm(weather.dateTime),
                              weather: weather.condition,
                              weatherIcon: weather.icon,
                            ),
                          );
                        case CurrentWeatherError(:final error):
                          return CustomRetryErrorWidget(
                            errorMessage:
                                error.message ?? "Something went wrong",
                            onRetry: () {
                              if (_currentLocation == null) {
                                return;
                              }
                              ref
                                  .read(weatherNotifierProvider.notifier)
                                  .getCurrentWeather(
                                    query: WeatherByLatLngParam(
                                      lat: _currentLocation!.latitude,
                                      lon: _currentLocation!.longitude,
                                    ),
                                  );
                            },
                          );
                        default:
                          return const SizedBox();
                      }
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
