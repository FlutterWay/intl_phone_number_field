import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RixaTextField extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final TextEditingController controller;
  final TextStyle? textStyle, labelStyle;
  final TextStyle? hintStyle;
  final double radius;
  final double? borderWidth;
  final int maxLines;
  final int? minLines;
  final Color? color;
  final Color? enabledColor;
  final bool showCursor;
  final double? width;
  final Color? focusedColor, backgroundColor;
  final dynamic Function(String)? onChanged;
  final bool isUnderline, expands, noInputBorder;
  final TextInputType textInputType;
  final Widget? prefixIcon, suffixIcon;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? innerPadding;
  final InputBorder? enabledBorder, focusedBorder;
  final bool autoFocus;
  final List<TextInputFormatter> inputFormatters;
  final FocusNode? focusNode;
  RixaTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maxLines = 1,
    this.minLines,
    this.textStyle,
    this.hintStyle,
    this.color,
    this.borderWidth,
    this.radius = 10.0,
    this.onChanged,
    this.focusNode,
    this.enabledColor,
    this.focusedColor,
    this.showCursor = true,
    this.labelText,
    this.inputFormatters = const [],
    this.autoFocus = false,
    this.width,
    this.labelStyle,
    this.isUnderline = true,
    this.expands = false,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
    EdgeInsetsGeometry? innerPadding,
    this.noInputBorder = false,
  })  : innerPadding =
            innerPadding ?? const EdgeInsets.symmetric(horizontal: 10),
        enabledBorder = !noInputBorder && isUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                    color: enabledColor ?? Colors.black,
                    width: borderWidth ?? 1),
              )
            : !noInputBorder && !isUnderline
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: enabledColor ?? Colors.black,
                        width: borderWidth ?? 1),
                    borderRadius: BorderRadius.circular(radius))
                : null,
        focusedBorder = !noInputBorder && isUnderline
            ? UnderlineInputBorder(
                borderSide: BorderSide(
                    color: focusedColor ?? Colors.cyan,
                    width: borderWidth ?? 1),
              )
            : !noInputBorder && !isUnderline
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: focusedColor ?? Colors.cyan,
                        width: borderWidth ?? 1),
                    borderRadius: BorderRadius.circular(radius))
                : null;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(radius)),
      padding: padding,
      child: TextField(
        controller: controller,
        maxLines: !expands ? maxLines : null,
        minLines: minLines,
        expands: expands,
        autofocus: autoFocus,
        showCursor: showCursor,
        textInputAction: TextInputAction.done,
        focusNode: focusNode,
        style: textStyle?.copyWith(decoration: TextDecoration.none),
        scrollPadding: EdgeInsets.zero,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: textInputType,
        autocorrect: false,
        enableSuggestions: false,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: innerPadding,
          hintStyle: hintStyle,
          enabledBorder: enabledBorder,
          focusedBorder: focusedBorder,
          suffixIcon: suffixIcon,
          border: noInputBorder ? InputBorder.none : null,
          prefixIcon: prefixIcon,
        ),
        onChanged: (text) {
          if (onChanged != null) onChanged!(text);
        },
      ),
    );
  }
}

class RixaTextFieldFull extends StatelessWidget {
  final String hintText;
  final String? labelText;
  final int flex;
  final TextEditingController controller;
  final TextStyle? textStyle, labelStyle;
  final double? width;
  final TextStyle? titleStyle, hintStyle, errorStyle;
  final double radius;
  final double? borderWidth;
  final Color? color;
  final Color? enabledColor;
  final Color? focusedColor, backgroundColor;
  final dynamic onChanged;
  final bool autoFocus;
  final int maxLines;
  final int? minLines;
  final bool isUnderline, noInputBorder, expands;
  final TextInputType textInputType;
  final Widget? prefixIcon;
  final bool showCursor;
  final EdgeInsetsGeometry? padding, innerPadding;
  final String? errorText;
  final double paddingLeft;
  final bool error;
  const RixaTextFieldFull({
    super.key,
    required this.controller,
    this.hintText = "",
    this.labelText,
    this.flex = 1,
    this.textStyle,
    this.labelStyle,
    this.expands = false,
    this.maxLines = 1,
    this.titleStyle,
    this.hintStyle,
    this.radius = 10,
    this.width,
    this.showCursor = false,
    this.borderWidth,
    this.color,
    this.innerPadding,
    this.enabledColor,
    this.focusedColor,
    TextStyle? errorStyle,
    this.autoFocus = false,
    this.backgroundColor,
    this.error = false,
    this.onChanged,
    this.minLines,
    this.isUnderline = true,
    this.noInputBorder = false,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.padding,
    this.errorText,
    this.paddingLeft = 0,
  }) : errorStyle = errorStyle ?? const TextStyle(color: Colors.red);
  @override
  Widget build(BuildContext context) {
    return expands
        ? Expanded(
            flex: flex,
            child: view(),
          )
        : view();
  }

  Widget view() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RixaTextField(
          hintText: hintText,
          labelText: labelText,
          controller: controller,
          maxLines: maxLines,
          textStyle: textStyle,
          labelStyle: labelStyle,
          hintStyle: hintStyle,
          radius: radius,
          borderWidth: borderWidth,
          showCursor: showCursor,
          autoFocus: autoFocus,
          minLines: minLines,
          color: color,
          enabledColor: enabledColor,
          innerPadding: innerPadding,
          width: width,
          focusedColor: focusedColor,
          backgroundColor: backgroundColor,
          onChanged: onChanged,
          isUnderline: isUnderline,
          noInputBorder: noInputBorder,
          textInputType: textInputType,
          prefixIcon: prefixIcon,
          padding: padding,
          expands: expands,
        ),
        if (errorText != null && error)
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Text(errorText!, style: errorStyle),
          )
      ],
    );
  }
}
