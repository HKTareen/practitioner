import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../config/app_colors.dart';
import '../core/BoxDecoration.dart';
import '../util/util.dart';
import 'Text.dart';
import 'Textfeld.dart';

class AppWidgets {

  static Widget searchPageSearchField(
      {onTap, onChange, backgroundColor, hint, controller, borderColor, hintColor, fillColor, height}) {
    return Container(
      height: height ?? 5.4.h, padding: EdgeInsets.only(right: 8),
      decoration: MyBoxDecoration.roundCircularRadiusWithOutBoxShadowDecoration(
          color: backgroundColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 3.w,
          ),
          Image.asset(
            Utils.getIconPath("search-icon"),
            width: 4.w,
            color: AppColors.black,
          ),
          SizedBox(
            width: 2.5.w,
          ),
          Flexible(
              fit: FlexFit.loose,
              child: SearchTextField(
                false,
                hint: hint,
                borderColor: borderColor,
                ontap: onTap,
                fontSizeText: 10,
                fillColor: fillColor,
                hintfontSize: 13,
                controller: controller,
                onChange: onChange,
                hintColor: hintColor,
              )),
        ],
      ),
    );
  }

  static Widget profileNameWithImage(
      {title, subTitle, imageUrl, imageSize, titleColor, subTitleColor, isChatPage = false, isPlaylist = false}) {
    return Row(mainAxisSize: MainAxisSize.min, children: [
      Container(
        height: imageSize ?? 12.8.w,
        width: imageSize ?? 12.8.w,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(
                  imageUrl ?? Utils.getImagePath("dummy-profile"),
                ),
                fit: BoxFit.fill)),
      ),
      SizedBox(width: 3.w,),
      SizedBox(width: isChatPage ? null : 58.w,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SubHeading(
              title ?? "Kathy Devons",
              fontFamily: "Roboto-Medium",
              color: titleColor ?? AppColors.black, fontSize: 12,
            ),
            SizedBox(height: isPlaylist ? 0.5.w : 2.w,),
            RegularText(
              subTitle ??
                  "There are many variations in the above line so just ignore my msg just bye bye",
              fontFamily: "Roboto-regular",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              color: subTitleColor ?? AppColors.textBlack,
              fontSize: 8,
            )
          ],
        ),
      ),
    ],);
  }

  static Widget profilePicWidget({VoidCallback? onTap, String? imageUrl}) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 12.3.h,
        width: 13.3.h,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, image: DecorationImage(
                    image: imageUrl != null ? FileImage(File(imageUrl)):AssetImage(Utils.getImagePath("no-profile")) as ImageProvider,
                    fit: BoxFit.cover,)),
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: onTap,
                  child: Container(
                    height: 4.3.h,
                    width: 4.3.h,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.kWhite, shape: BoxShape.circle),
                    child: Image.asset(
                      Utils.getIconPath("edit-pic"),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  static Widget collectionDivider({horizontalPadding}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 3.w),
      child: Divider(color: AppColors.dividerColor, height: 1, thickness: 1,),
    );
  }


}