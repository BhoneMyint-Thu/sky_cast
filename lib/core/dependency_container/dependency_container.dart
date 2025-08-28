import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sky_cast/core/config/app_config.dart';
final dioProvider = Provider<Dio>((ref) {
  final dio =
      Dio(
          BaseOptions(
            baseUrl: "${AppConfig.apiBaseUrl}/",
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10),
          ),
        )
        ..interceptors.add(
          LogInterceptor(
            requestBody: kDebugMode ? true : false,
            responseBody: kDebugMode ? true : false,
            requestHeader: kDebugMode ? true : false,
          ),
        );

  return dio;
});
