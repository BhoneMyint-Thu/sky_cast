import 'package:flutter/material.dart';
import 'package:sky_cast/core/utils/extensions/responsive_size_ext.dart';
import 'package:sky_cast/core/utils/screen_util.dart';
import 'package:sky_cast/features/weather/presentation/widgets/shimmers/shimmer_wrapper.dart';

class WeatherItemShimmer extends StatelessWidget {
  const WeatherItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWrapper(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.red),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          spacing: 10.h,
          children: [
            Container(
              width: ScreenUtil.screenWidth,
              color: Colors.black,
              height: 30.h,
            ),
            Container(
              width: ScreenUtil.screenWidth,
              color: Colors.black,
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
