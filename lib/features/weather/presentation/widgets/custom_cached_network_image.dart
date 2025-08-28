import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sky_cast/core/utils/color_util.dart';
import 'package:sky_cast/core/utils/extensions/responsive_size_ext.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
  });
  final String imageUrl;
  final BoxFit? fit;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    final isValidImageUrl =
        imageUrl.isNotEmpty &&
        imageUrl.contains("https") &&
        !imageUrl.trim().endsWith('/') &&
        !imageUrl.contains("null");

    if (!isValidImageUrl) {
      return Icon(Icons.error_outline, color: Colors.red, size: 48.h);
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      height: height,
      width: width,
      placeholder: (context, url) => const CircularProgressIndicator(color: ColorUtil.darkGray),
      errorWidget: (context, url, error) =>
          Icon(Icons.error_outline, color: Colors.red, size: 48.h),
    );
  }
}
