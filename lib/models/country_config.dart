import 'package:flutter/material.dart';

class CountryConfig {
  bool noFlag;
  TextStyle textStyle;
  Decoration decoration;
  CountryConfig(
      {this.noFlag = false, Decoration? decoration, TextStyle? textStyle})
      : textStyle = textStyle ??
            const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        decoration = BoxDecoration(
          border: Border.all(width: 2, color: const Color(0xFF3f4046)),
          borderRadius: BorderRadius.circular(8),
        );
}
