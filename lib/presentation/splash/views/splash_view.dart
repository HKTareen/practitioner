import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:practitioner/app/config/app_constants.dart';
import 'package:practitioner/app/shared_widgets/Text.dart';

import '../../../app/shared_widgets/component.dart';
import '../../../app/util/util.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashView'),
        centerTitle: true,
      ),
      body: Center(
        child: AppWidgets.splashLogo(title: AppConst.WELCOME),
      ),
    );
  }
}
