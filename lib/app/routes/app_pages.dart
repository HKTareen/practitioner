import 'package:get/get.dart';

import '../../presentation/dukkantek/bindings/dukkantek_binding.dart';
import '../../presentation/dukkantek/views/dukkantek_view.dart';
import '../../presentation/event_detail/bindings/event_detail_binding.dart';
import '../../presentation/event_detail/views/event_detail_view.dart';
import '../../presentation/home/bindings/home_binding.dart';
import '../../presentation/home/views/home_view.dart';
import '../../presentation/introduction/bindings/introduction_binding.dart';
import '../../presentation/introduction/views/introduction_view.dart';
import '../../presentation/language/bindings/language_binding.dart';
import '../../presentation/language/views/language_view.dart';
import '../../presentation/splash/bindings/splash_binding.dart';
import '../../presentation/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DUKKANTEK;

  static final routes = [
    GetPage(
      name: _Paths.DUKKANTEK,
      page: () => DukkantekView(),
      binding: DukkantekBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGE,
      page: () => LanguageView(),
      binding: LanguageBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCTION,
      page: () => IntroductionView(),
      binding: IntroductionBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_DETAIL,
      page: () => EventDetailView(),
      binding: EventDetailBinding(),
    ),
  ];
}
