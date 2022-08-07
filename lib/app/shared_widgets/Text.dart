import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../config/app_colors.dart';

class Heading extends StatelessWidget {
  final String text;
  final Color? color;
  final double? height;
  final TextOverflow? overflow;

  final int? maxLines;
  final TextAlign? textAlign;
  final double? fontSize;
  final FontWeight fontWeight;

  const Heading(
    this.text, {
    Key? key,
    this.color = AppColors.textBlack,
    this.height,
    this.maxLines = 1,
    this.overflow,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
    this.fontSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        height: height,
        color: color,
        fontFamily: 'Epilogue-bold',
        fontSize: fontSize!,
        fontWeight: fontWeight,
      ),
    );
  }
}

class SubHeading extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color color;
  final double? height;
  final TextAlign? textAlign;
  final double fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight fontWeight;
  final double opacity;
  final TextDecoration? decoration;

  const SubHeading(
    this.text, {
    Key? key,
    this.color = AppColors.kWhite,
    this.height,
    this.fontFamily = "Roboto-bold",
    this.textAlign,
    this.fontSize = 8.0,
    this.opacity = 1.0,
    this.maxLines = 1,
    this.overflow,
    this.fontWeight = FontWeight.w700,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: height,
        color: color.withOpacity(opacity),
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
      ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class RegularText extends StatelessWidget {
  final String text;
  final String? fontFamily;
  final Color color;
  final double? height;
  final TextAlign? textAlign;
  final double fontSize;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight fontWeight;
  final double opacity;
  final TextDecoration? decoration;

  const RegularText(
      this.text, {
        Key? key,
        this.color = AppColors.kSecondary,
        this.height,
        this.fontFamily = "Roboto-bold",
        this.textAlign,
        this.fontSize = 12.0,
        this.opacity = 1.0,
        this.maxLines = 1,
        this.overflow,
        this.fontWeight = FontWeight.w400,
        this.decoration,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: height,
        color: color.withOpacity(opacity),
        fontSize: fontSize,
        fontWeight: fontWeight,
        decoration: decoration,
        fontFamily: fontFamily,
      ),
      overflow: overflow,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}
