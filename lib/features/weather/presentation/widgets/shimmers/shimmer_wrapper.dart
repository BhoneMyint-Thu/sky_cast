import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sky_cast/core/utils/color_util.dart';

class ShimmerWrapper extends StatelessWidget {
  const ShimmerWrapper({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorUtil.darkGray,
      highlightColor: Colors.red.shade600,
      child: child,
    );
  }
}
