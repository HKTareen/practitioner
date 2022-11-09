import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:practitioner/app/util/util.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IntroductionView'),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(Utils.getImagePath("intro-bg1")),
        
      ),
    );
  }
}
