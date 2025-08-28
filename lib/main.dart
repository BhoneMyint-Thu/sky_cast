import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/core/config/theme.dart';
import 'package:sky_cast/core/utils/screen_util.dart';
import 'package:sky_cast/features/weather/presentation/pages/home/home_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Sky Cast",
          theme: buildTheme(),
          home: const HomePage(),
        );
      },
    );
  }
}
