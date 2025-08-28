import 'package:flutter/material.dart';
import 'package:sky_cast/core/utils/extensions/responsive_size_ext.dart';

ThemeData buildTheme() {
  const white = Colors.white;
  const white70 = Colors.white70;
  const white60 = Colors.white60;

  return ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    textTheme: TextTheme(
      // Big numbers (temperature)
      displayLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      displayMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.bold,
        color: white,
      ),
      displaySmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: white,
      ),

      // Section headings
      headlineLarge: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        color: white,
      ),
      headlineMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: white,
      ),
      headlineSmall: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: white,
      ),

      // Titles (city name, country, etc.)
      titleLarge: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: white,
      ),
      titleMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: white70,
      ),
      titleSmall: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: white70,
      ),

      // Main body texts
      bodyLarge: TextStyle(fontSize: 16.sp, color: white),
      bodyMedium: TextStyle(fontSize: 16.sp, color: white70),
      bodySmall: TextStyle(fontSize: 14.sp, color: white60),

      // Labels (captions, forecast dates)
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      labelMedium: TextStyle(fontSize: 14.sp, color: white70),
      labelSmall: TextStyle(fontSize: 12.sp, color: white60),
    ),
  );
}
