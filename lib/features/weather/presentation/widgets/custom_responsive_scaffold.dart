import 'package:flutter/material.dart';
import 'package:sky_cast/core/config/device_config.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget Function(BuildContext context, DeviceConfig config) builder;

  const ResponsiveScaffold({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final orientation = MediaQuery.of(context).orientation;
        final config = DeviceConfig.fromConstraints(constraints, orientation);
        return builder(context, config);
      },
    );
  }
}
