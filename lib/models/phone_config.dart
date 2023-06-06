import 'package:flutter/material.dart';

class PhoneConfig {
  Color focusedColor, enabledColor;
  TextStyle textStyle, hintStyle;
  double radius, borderWidth;
  Decoration? decoration;
  Color? backgroundColor;
  String? hintText;
  bool autoFocus, showCursor;
  FocusNode? focusNode;
  PhoneConfig(
      {this.focusedColor = const Color(0xFF6D59BD),
      this.enabledColor = const Color(0xFF6D59BD),
      this.radius = 8,
      this.hintText = "Phone Number",
      this.borderWidth = 2,
      this.backgroundColor,
      this.decoration,
      this.focusNode,
      this.autoFocus = false,
      this.showCursor = false,
      TextStyle? textStyle,
      TextStyle? hintStyle})
      : textStyle = textStyle ??
            const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
        hintStyle = hintStyle ??
            TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.w400);
}
