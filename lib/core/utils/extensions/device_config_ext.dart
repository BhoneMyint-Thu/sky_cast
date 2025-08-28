import 'package:flutter/material.dart';
import 'package:sky_cast/core/config/device_config.dart';

extension DeviceConfigExt on BuildContext {
  DeviceConfig get deviceConfig {
    final constraints = BoxConstraints(
      maxWidth: MediaQuery.of(this).size.width,
    );
    final orientation = MediaQuery.of(this).orientation;
    return DeviceConfig.fromConstraints(constraints, orientation);
  }
}
