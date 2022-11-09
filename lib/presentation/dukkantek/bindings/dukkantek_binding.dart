import 'package:get/get.dart';

import '../controllers/dukkantek_controller.dart';

class DukkantekBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DukkantekController>(
      () => DukkantekController(),
    );
  }
}
