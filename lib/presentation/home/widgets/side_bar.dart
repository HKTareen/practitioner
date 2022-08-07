import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practitioner/app/config/app_colors.dart';
import 'package:practitioner/app/config/app_constants.dart';
import 'package:practitioner/app/shared_widgets/Text.dart';
import 'package:practitioner/app/util/util.dart';
class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: 56,
      decoration: BoxDecoration(color: AppColors.kSecondary),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 32,),
              Image.asset(Utils.getIconPath("logo"),height: 32,width: 32,),
              SizedBox(height: 32,),
              Image.asset(Utils.getIconPath("dashboard"),height: 32,width: 32,),
              SizedBox(height: 6,),
              SubHeading(AppConst.DASHBOARD),
              SizedBox(height: 32,),
              Image.asset(Utils.getIconPath("calender"),height: 24,width: 24,),
              SizedBox(height: 6,),
              SubHeading(AppConst.CALENDAR),
              SizedBox(height: 32,),
              Image.asset(Utils.getIconPath("clinical"),height: 24,width: 24,),
              SizedBox(height: 6,),
              SubHeading(AppConst.CLINICAL),
              SizedBox(height: 32,),
              Image.asset(Utils.getIconPath("patients"),height: 24,width: 24,),
              SizedBox(height: 6,),
              SubHeading(AppConst.PATIENTS),
              SizedBox(height: 32,),
              Image.asset(Utils.getIconPath("billing"),height: 24,width: 24,),
              SizedBox(height: 6,),
              SubHeading(AppConst.BILLING),
            ],),
          Column(mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Utils.getIconPath("notification"),height: 24,width: 24,),
              SizedBox(height: 6,),
              SubHeading(AppConst.NOTIFICATIONS),
              SizedBox(height: 32,),
              Image.asset(Utils.getIconPath("about"),height: 20,width: 20,),
              SizedBox(height: 6,),
              SubHeading(AppConst.HELP),
              SizedBox(height: 32,),
              Image.asset(Utils.getIconPath("Receptionist"),height: 40,width: 40,),
              SizedBox(height: 32,),
            ],),
        ],
      ),
    );
  }
}
