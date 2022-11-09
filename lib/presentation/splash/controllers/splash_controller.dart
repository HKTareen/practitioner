import 'package:get/get.dart';
import 'package:practitioner/app/routes/app_pages.dart';

class SplashController extends GetxController {


  @override
  void onInit() {
    Future.delayed(Duration(seconds: 3)).then((value) =>Get.offAndToNamed(Routes.LANGUAGE));
    super.onInit();
  }

}
