import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height; // line height
  final TextDecoration? decoration;
  final Color? decorationColor;
  final FontStyle? fontStyle;
  final TextStyle? style; // custom style (override সব কিছু)

  const CustomText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationColor,
    this.fontStyle,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style ?? TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        height: height,
        decoration: decoration,
        decorationColor: decorationColor,
        fontStyle: fontStyle,
      ),
    );
  }
}