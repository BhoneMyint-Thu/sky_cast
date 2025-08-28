import 'package:flutter/material.dart';

enum DeviceType { small, medium, large }
enum DeviceOrientation { portrait, landscape }

class DeviceConfig {
  final DeviceType type;
  final DeviceOrientation orientation;

  const DeviceConfig({required this.type, required this.orientation});

  static DeviceConfig fromConstraints(BoxConstraints constraints, Orientation orientation) {
    final width = constraints.maxWidth;

    DeviceType type;
    if (width < 600) {
      type = DeviceType.small;
    } else if (width < 900) {
      type = DeviceType.medium;
    } else {
      type = DeviceType.large;
    }

    return DeviceConfig(
      type: type,
      orientation: orientation == Orientation.portrait
          ? DeviceOrientation.portrait
          : DeviceOrientation.landscape,
    );
  }

  bool get isSmall => type == DeviceType.small;
  bool get isMedium => type == DeviceType.medium;
  bool get isLarge => type == DeviceType.large;
  bool get isPortrait => orientation == DeviceOrientation.portrait;
  bool get isLandscape => orientation == DeviceOrientation.landscape;
}
