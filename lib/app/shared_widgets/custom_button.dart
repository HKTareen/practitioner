import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../config/app_colors.dart';
class CustomButton2 extends StatefulWidget {
  final height;
  final width;
  final horizontalPadding;
  final verticalPadding;
  final Function()? onpress;
  final String? title;
  final Widget? titleWidget;
  final Color? color;
  final Color? fontColor;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? borderRadius;
  final BoxBorder? border;
  bool isEnabled;
  CustomButton2(
      {Key? key,
      this.height,
      this.width,
      @required this.onpress,
      this.horizontalPadding = 0.0,
      this.verticalPadding = 0.0,
      this.title,
      this.color,
      this.fontColor,
      this.fontFamily,
      this.fontWeight,this.border,
      this.isEnabled = true,
      this.fontSize = 11,this.borderRadius=8.0,
      this.titleWidget})
      : super(key: key);

  @override
  _CustomButton2State createState() => _CustomButton2State();
}

class _CustomButton2State extends State<CustomButton2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpress,
      child: Container(
        child: Center(
          child: widget.titleWidget ??
              Text(
                '${widget.title}',
                style: TextStyle(
                  fontSize: widget.fontSize!,
                  color: widget.fontColor ?? AppColors.kWhite,
                  fontWeight: widget.fontWeight??FontWeight.w500,
                  fontFamily: widget.fontFamily??'Roboto-medium',
                ),
              ),
        ),
        padding: widget.horizontalPadding != null
            ? EdgeInsets.symmetric(horizontal: widget.horizontalPadding,vertical: widget.verticalPadding,)
            : EdgeInsets.zero,
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          border: widget.border,
            borderRadius: BorderRadius.circular(widget.borderRadius!),
            color: widget.color ?? AppColors.kWhite),
      ),
    );
  }
}
