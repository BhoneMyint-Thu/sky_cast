import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/core/enums/temp_units.dart';
import 'package:sky_cast/core/params/weather_param.dart';
import 'package:sky_cast/core/utils/date_helper.dart';
import 'package:sky_cast/core/utils/extensions/responsive_size_ext.dart';
import 'package:sky_cast/core/utils/extensions/text_theme_ext.dart';
import 'package:sky_cast/core/utils/screen_util.dart';
import 'package:sky_cast/core/utils/url_util.dart';
import 'package:sky_cast/features/weather/presentation/notifiers/weather_detail/weather_detail_provider.dart';
import 'package:sky_cast/features/weather/presentation/widgets/custom_cached_network_image.dart';
import 'package:sky_cast/features/weather/presentation/widgets/custom_retry_error_widget.dart';

class WeatherDetailPage extends ConsumerStatefulWidget {
  const WeatherDetailPage({
    super.key,
    required this.cityName,
    required this.tempUnit,
  });
  final String cityName;
  final TempUnits tempUnit;

  @override
  ConsumerState<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends ConsumerState<WeatherDetailPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(currentWeatherProvider.notifier)
          .getCurrentWeather(query: WeatherByCityParam(widget.cityName));
      ref
          .read(forecastWeatherProvider.notifier)
          .getForecastWeather(query: WeatherByCityParam(widget.cityName));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer(
        builder: (context, ref, _) {
          final backgroundGradient = ref.watch(weatherBackgroundProvider(200));
          return Container(
            decoration: BoxDecoration(gradient: backgroundGradient),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 70.h)),
                  SliverToBoxAdapter(
                    child: Align(
                      alignment: const Alignment(-1, 0),
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Consumer(
                      builder: (context, ref, _) {
                        final weather = ref.watch(currentWeatherProvider);
                        switch (weather) {
                          case CurrentWeatherLoading():
                            return Column(
                              spacing: 10.h,
                              children: [
                                Text("---", style: context.titleLarge),
                                Text("---", style: context.displayLarge),
                                Text("---", style: context.bodyLarge),
                              ],
                            );
                          case CurrentWeatherLoaded(:final weather):
                            WidgetsBinding.instance.addPostFrameCallback((
                              timeStamp,
                            ) {
                              ref.read(
                                weatherBackgroundProvider(weather.weatherID),
                              );
                            });
                            return Column(
                              spacing: 10.h,
                              children: [
                                Text(
                                  weather.cityName,
                                  style: context.titleLarge,
                                ),
                                Text(
                                  weather.temperature.display(widget.tempUnit),
                                  style: context.displayLarge,
                                ),
                                Text(
                                  weather.condition,
                                  style: context.bodyLarge,
                                ),
                              ],
                            );
                          case CurrentWeatherError(:final error):
                            return CustomRetryErrorWidget(
                              errorMessage: error.message ?? "",
                              onRetry: () => ref
                                  .read(currentWeatherProvider.notifier)
                                  .getCurrentWeather(
                                    query: WeatherByCityParam(widget.cityName),
                                  ),
                            );
                          default:
                            return const SizedBox();
                        }
                      },
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: kToolbarHeight.h)),

                  SliverToBoxAdapter(
                    child: Consumer(
                      builder: (context, ref, _) {
                        final forecastState = ref.watch(
                          forecastWeatherProvider,
                        );

                        switch (forecastState) {
                          case ForecastWeatherLoading():
                            return Column(
                              spacing: 15.sp,
                              children: [
                                DarkGlassCard(
                                  child: SizedBox(
                                    height: ScreenUtil.screenHeight * 0.1,
                                    width: ScreenUtil.screenWidth,
                                  ),
                                ),
                                DarkGlassCard(
                                  child: SizedBox(
                                    height: ScreenUtil.screenHeight * 0.4,
                                    width: ScreenUtil.screenWidth,
                                  ),
                                ),
                              ],
                            );
                          case ForecastWeatherError(:final error):
                            return CustomRetryErrorWidget(
                              errorMessage: error.message ?? "",
                              onRetry: () => ref
                                  .read(forecastWeatherProvider.notifier)
                                  .getForecastWeather(
                                    query: WeatherByCityParam(widget.cityName),
                                  ),
                            );
                          case ForecastWeatherLoaded(:final forecasts):
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Hourly forecast
                                DarkGlassCard(
                                  child: SizedBox(
                                    height: 120.sp,
                                    child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: forecasts.hourly.length,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(width: 10.w),
                                      itemBuilder: (context, index) {
                                        final forecastHourly =
                                            forecasts.hourly[index];
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              DateHelper.formatHourOnlyAmPm(
                                                forecastHourly.dateTime,
                                              ),
                                              style: context.bodyMedium
                                                  .copyWith(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                            const SizedBox(height: 8),
                                            CustomCachedNetworkImage(
                                              imageUrl:
                                                  UrlUtil.getWeatherIconUrl(
                                                    forecastHourly.icon,
                                                  ),
                                              height: 35.h,
                                              width: 35.w,
                                            ),
                                            SizedBox(height: 8.sp),
                                            Text(
                                              forecastHourly.temperature
                                                  .display(widget.tempUnit),
                                              style: context.bodyMedium
                                                  .copyWith(
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),

                                SizedBox(height: 16.sp),
                                DarkGlassCard(
                                  child: Column(
                                    spacing: 10.sp,
                                    children: List.generate(forecasts.daily.length, (
                                      index,
                                    ) {
                                      final daily = forecasts.daily[index];
                                      return Row(
                                        spacing: 20.w,
                                        children: [
                                          Text(
                                            DateHelper.formatToDay(
                                              daily.dateTime,
                                            ),
                                            style: context.bodyLarge.copyWith(
                                              fontFeatures: [
                                                const FontFeature.tabularFigures(),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              daily.description.toUpperCase(),
                                              style: context.labelSmall.copyWith(
                                                fontFeatures: [
                                                  const FontFeature.tabularFigures(),
                                                ],
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          CustomCachedNetworkImage(
                                            imageUrl: UrlUtil.getWeatherIconUrl(
                                              daily.icon,
                                            ),
                                          ),
                                          Text(
                                            daily.temperature.display(
                                              widget.tempUnit,
                                            ),
                                            style: context.bodyLarge,
                                          ),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            );

                          default:
                            return const SizedBox.shrink();
                        }
                      },
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: 20.sp)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class DarkGlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsets padding;

  const DarkGlassCard({
    super.key,
    required this.child,
    this.borderRadius = 20,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white.withAlpha(70),
            border: Border.all(color: Colors.white.withAlpha(100), width: 1.0),
          ),
          child: child,
        ),
      ),
    );
  }
}
