import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isTextFormField;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? fillColor;
  final Color? borderColor;
  final double borderRadius;
  final double? width;
  final double? height;
  final double borderWidth;
  final TextStyle? textStyle;
  final int? maxLines;
  final bool enabled;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets? padding;

  const TextFieldWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.isTextFormField = false,
    this.keyboardType,
    this.obscureText = false,
    this.fillColor,
    this.borderColor,
    this.borderRadius = 8.0,
    this.width,
    this.height,
    this.borderWidth = 1.0,
    this.textStyle,
    this.maxLines = 1,
    this.enabled = true,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: fillColor ?? Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: borderColor ?? Colors.grey,
          width: borderWidth,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: borderColor ?? Colors.grey,
          width: borderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(
          color: borderColor ?? Theme.of(context).primaryColor,
          width: borderWidth,
        ),
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: padding ?? const EdgeInsets.all(16),
    );

    return SizedBox(
      width: width,
      height: height,
      child: isTextFormField
          ? TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        enabled: enabled,
        validator: validator,
        decoration: inputDecoration,
        style: textStyle,
      )
          : TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        maxLines: maxLines,
        enabled: enabled,
        decoration: inputDecoration,
        style: textStyle,
      ),
    );
  }
}
