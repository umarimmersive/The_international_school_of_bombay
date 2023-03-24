import 'package:get/get.dart';

import '../modules/About/bindings/about_binding.dart';
import '../modules/About/views/about_view.dart';
import '../modules/Deshbord/bindings/deshbord_binding.dart';
import '../modules/Deshbord/views/deshbord_view.dart';
import '../modules/Events/bindings/events_binding.dart';
import '../modules/Events/views/events_view.dart';
import '../modules/Home/bindings/home_binding.dart';
import '../modules/Home/views/home_view.dart';
import '../modules/Hoppiness/bindings/hoppiness_binding.dart';
import '../modules/Hoppiness/views/hoppiness_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Menu/bindings/menu_binding.dart';
import '../modules/Menu/views/menu_view.dart';
import '../modules/NoticeBoard/bindings/notice_board_binding.dart';
import '../modules/NoticeBoard/bindings/notice_board_binding.dart';
import '../modules/NoticeBoard/views/notice_board_view.dart';
import '../modules/NoticeBoard/views/notice_board_view.dart';
import '../modules/NoticeBoardDetails/bindings/notice_board_details_binding.dart';
import '../modules/NoticeBoardDetails/bindings/notice_board_details_binding.dart';
import '../modules/NoticeBoardDetails/views/notice_board_details_view.dart';
import '../modules/NoticeBoardDetails/views/notice_board_details_view.dart';
import '../modules/Splash/bindings/splash_binding.dart';
import '../modules/Splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DESHBORD,
      page: () =>   DeshbordView(),
      binding: DeshbordBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.HOPPINESS,
      page: () => const HoppinessView(),
      binding: HoppinessBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => const AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => const MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.NOTICE_BOARD,
      page: () => const NoticeBoardView(),
      binding: NoticeBoardBinding(),
      children: [
        GetPage(
          name: _Paths.NOTICE_BOARD,
          page: () => const NoticeBoardView(),
          binding: NoticeBoardBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.NOTICE_BOARD_DETAILS,
      page: () => const NoticeBoardDetailsView(),
      binding: NoticeBoardDetailsBinding(),
      children: [
        GetPage(
          name: _Paths.NOTICE_BOARD_DETAILS,
          page: () => const NoticeBoardDetailsView(),
          binding: NoticeBoardDetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.EVENTS,
      page: () => const EventsView(),
      binding: EventsBinding(),
    ),
  ];
}
