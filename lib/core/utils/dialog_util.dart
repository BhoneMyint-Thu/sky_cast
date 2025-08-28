import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sky_cast/core/utils/color_util.dart';
import 'package:sky_cast/core/utils/extensions/text_theme_ext.dart';
import 'package:sky_cast/core/utils/image_asset_manager_util.dart';

class DialogUtil {
  static void showWarningDialog(
    BuildContext context, {
    VoidCallback? onClose,
    String? warningMessage,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shadowColor: ColorUtil.darkGray,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Column(
          children: [
            Image.asset(ImageAssetManager.warning, height: 70),
            const SizedBox(height: 16),
            Text("Warning", style: context.titleMedium),
          ],
        ),
        content: Text(
          warningMessage ?? "Something went wrong",
          textAlign: TextAlign.center,
          style: context.bodyMedium.copyWith(color: Colors.black),
        ),
        actions: [
          MaterialButton(
            height: 45,
            onPressed: onClose ?? () => Navigator.pop(context),
            color: ColorUtil.tealGray,
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(width: 4, color: ColorUtil.amber),
            ),
            child: Text("I understand", style: context.bodyMedium),
          ),
        ],
      ),
    );
  }

  static showLoading({required BuildContext context}) {
    return showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const PopScope(
        canPop: false,
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          title: SizedBox(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(color: Colors.lightBlue),
            ),
          ),
        ),
      ),
    );
  }
}
