import 'package:flutter/material.dart';
import 'package:sky_cast/core/utils/extensions/responsive_size_ext.dart';
import 'package:sky_cast/core/utils/extensions/text_theme_ext.dart';

class CustomRetryErrorWidget extends StatelessWidget {
  const CustomRetryErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });
  final String errorMessage;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 48.h),
          SizedBox(height: 12.h),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: context.titleMedium.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          ElevatedButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: Text("Retry", style: context.bodyLarge),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
