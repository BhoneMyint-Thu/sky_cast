part of '../home_page.dart';

class _WeatherItem extends StatelessWidget {
  const _WeatherItem({
    required this.cityName,
    required this.temp,
    required this.time,
    required this.weather,
    required this.weatherIcon,
  });
  final String cityName;
  final String temp;
  final String time;
  final String weather;
  final String weatherIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorUtil.darkGray,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 10.sp,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCachedNetworkImage(
            imageUrl: UrlUtil.getWeatherIconUrl(weatherIcon,size: 1),
            width: 40.sp,
            height:40.sp ,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  cityName,
                  style: context.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Text(
                  temp,
                  style: context.headlineLarge.copyWith(fontFeatures: [const FontFeature.tabularFigures()]),
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  weather,
                  style: context.bodyMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Text(
                  time,
                  style: context.bodyMedium,
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
