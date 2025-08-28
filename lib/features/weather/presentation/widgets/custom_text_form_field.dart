import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sky_cast/core/utils/extensions/text_theme_ext.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged,
    this.suffixIcon,
    this.contentPadding = 12,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.fillColor = Colors.white,
    this.borderWidth = 1,
    this.borderColor = Colors.black,
    this.borderRadius = 10.0,
    this.validator,
    this.onTap,
    this.maxLines = 1,
    this.labelText,
    this.prefixIcon,
    this.prefix,
    this.floatingLabelBehavior,
    this.style,
    this.cursorColor,
    this.focusNode,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.hintStyle,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.errorBorder,
    this.prefixIconConstraints,
    this.inputFormatters,
    this.enabled = true,
  });
  final String? hintText;
  final TextEditingController? controller;
  final bool? enabled;
  final Function(String text)? onChanged;
  final Widget? suffixIcon;
  final double contentPadding;
  final TextInputType keyboardType;
  final bool readOnly;
  final Color fillColor;
  final double borderWidth;
  final Color borderColor;
  final double borderRadius;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final int? maxLines;
  final String? labelText;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? prefix;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final Color? cursorColor;
  final FocusNode? focusNode;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? errorBorder;
  final List<TextInputFormatter>? inputFormatters;

  final TextAlign textAlign;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      maxLines: maxLines,
      onTap: onTap,
      validator: validator,
      readOnly: readOnly,
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      keyboardAppearance: Brightness.dark,
      obscureText: obscureText,
      textAlign: textAlign,
      style: style ??context.bodySmall,
      cursorColor: cursorColor,
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehavior,
        prefix: prefix,
        prefixIconConstraints: prefixIconConstraints,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        labelText: labelText,
        errorStyle:context.bodyMedium.copyWith(color: Colors.red),
        labelStyle: context.bodyMedium,
        hintStyle:
            hintStyle ?? context.bodySmall,
        fillColor: fillColor,
        contentPadding: EdgeInsets.all(contentPadding),
        border:
            border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: borderWidth),
            ),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: borderWidth),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: borderWidth),
            ),
        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: borderWidth),
            ),
        focusedErrorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: borderColor, width: borderWidth),
            ),
        alignLabelWithHint: false,
        filled: true,
      ),
      onChanged: onChanged,
      enabled: enabled,
    );
  }
}
