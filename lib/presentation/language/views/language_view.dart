import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:practitioner/app/routes/app_pages.dart';
import 'package:practitioner/app/shared_widgets/Text.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/app_constants.dart';
import '../../../app/shared_widgets/component.dart';
import '../controllers/language_controller.dart';

class LanguageView extends GetView<LanguageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LanguageView'),
        centerTitle: true,
      ),
      body: Column(children: [
        AppWidgets.splashLogo(title: AppConst.SELECT_LANGUAGE),
        AppWidgets.languageButton(title: AppConst.ENGLISH,onTap: (){
          Get.offAndToNamed(Routes.INTRODUCTION);
        }),
        SizedBox(height: 30,),
        AppWidgets.languageButton(title: AppConst.ARABIC,onTap: (){
          Get.offAndToNamed(Routes.INTRODUCTION);
        }),
        SizedBox(height: 91,),

      ],mainAxisAlignment: MainAxisAlignment.end,),
    );
  }
}
