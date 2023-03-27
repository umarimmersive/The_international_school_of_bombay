import 'package:get/get.dart';

import '../modules/About/bindings/about_binding.dart';
import '../modules/About/views/about_view.dart';
import '../modules/Academic_content/bindings/academic_content_binding.dart';
import '../modules/Academic_content/views/academic_content_view.dart';
import '../modules/Assignment/bindings/assignment_binding.dart';
import '../modules/Assignment/views/assignment_view.dart';
import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/dashboard_view.dart';
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
import '../modules/MounthwiseSyllabus/bindings/mounthwise_syllabus_binding.dart';
import '../modules/MounthwiseSyllabus/views/mounthwise_syllabus_view.dart';
import '../modules/NoticeBoard/bindings/notice_board_binding.dart';
import '../modules/NoticeBoard/views/notice_board_view.dart';
import '../modules/NoticeBoard/views/notice_board_view.dart';
import '../modules/NoticeBoardDetails/bindings/notice_board_details_binding.dart';
import '../modules/NoticeBoardDetails/bindings/notice_board_details_binding.dart';
import '../modules/NoticeBoardDetails/views/notice_board_details_view.dart';
import '../modules/NoticeBoardDetails/views/notice_board_details_view.dart';
import '../modules/PdfView/bindings/pdf_view_binding.dart';
import '../modules/PdfView/views/pdf_view_view.dart';
import '../modules/Splash/bindings/splash_binding.dart';
import '../modules/Splash/views/splash_view.dart';
import '../modules/Upcoming_Event/bindings/upcoming_event_binding.dart';
import '../modules/Upcoming_Event/views/upcoming_event_view.dart';
import '../modules/syllabus/bindings/syllabus_binding.dart';
import '../modules/syllabus/views/syllabus_view.dart';

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
      page: () => MenuView(),
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
    GetPage(
      name: _Paths.DESHBOARD_SCREEN,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT,
      page: () => const AssignmentView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: _Paths.SYLLABUS,
      page: () => const SyllabusView(),
      binding: SyllabusBinding(),
    ),
    GetPage(
      name: _Paths.PDF_VIEW,
      page: () => const PdfViewView(),
      binding: PdfViewBinding(),
    ),
    GetPage(
      name: _Paths.ACADEMIC_CONTENT,
      page: () => const AcademicContentView(),
      binding: AcademicContentBinding(),
    ),
    GetPage(
      name: _Paths.UPCOMING_EVENT,
      page: () => const UpcomingEventView(),
      binding: UpcomingEventBinding(),
    ),
    GetPage(
      name: _Paths.MOUNTHWISE_SYLLABUS,
      page: () => const MounthwiseSyllabusView(),
      binding: MounthwiseSyllabusBinding(),
    ),
  ];
}
