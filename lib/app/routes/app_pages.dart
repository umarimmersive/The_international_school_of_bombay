import 'package:get/get.dart';

import '../modules/About/bindings/about_binding.dart';
import '../modules/About/views/about_view.dart';
import '../modules/Academic_content/bindings/academic_content_binding.dart';
import '../modules/Academic_content/views/academic_content_view.dart';
import '../modules/Assignment/bindings/assignment_binding.dart';
import '../modules/Assignment/views/assignment_view.dart';
import '../modules/ContectUs/bindings/contect_us_binding.dart';
import '../modules/ContectUs/views/contect_us_view.dart';
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
import '../modules/Notification/bindings/notification_binding.dart';
import '../modules/Notification/views/notification_view.dart';
import '../modules/OurCampus/bindings/our_campus_binding.dart';
import '../modules/OurCampus/views/our_campus_view.dart';
import '../modules/OurPhilosypher/bindings/our_philosypher_binding.dart';
import '../modules/OurPhilosypher/views/our_philosypher_view.dart';
import '../modules/PdfView/bindings/pdf_view_binding.dart';
import '../modules/PdfView/views/pdf_view_view.dart';
import '../modules/PhotoGallary/bindings/photo_gallary_binding.dart';
import '../modules/PhotoGallary/views/photo_gallary_view.dart';
import '../modules/PhotoView/bindings/photo_view_binding.dart';
import '../modules/PhotoView/views/photo_view_view.dart';
import '../modules/PrivacyPolicy/bindings/privacy_policy_binding.dart';
import '../modules/PrivacyPolicy/views/privacy_policy_view.dart';
import '../modules/RateUs/bindings/rate_us_binding.dart';
import '../modules/RateUs/views/rate_us_view.dart';
import '../modules/Splash/bindings/splash_binding.dart';
import '../modules/Splash/views/splash_view.dart';
import '../modules/TermandCondition/bindings/termand_condition_binding.dart';
import '../modules/TermandCondition/views/termand_condition_view.dart';
import '../modules/Upcoming_Event/bindings/upcoming_event_binding.dart';
import '../modules/Upcoming_Event/views/upcoming_event_view.dart';
import '../modules/VideoGallary/bindings/video_gallary_binding.dart';
import '../modules/VideoGallary/views/video_gallary_view.dart';
import '../modules/aboutus/bindings/aboutus_binding.dart';
import '../modules/aboutus/views/aboutus_view.dart';
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
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_GALLARY,
      page: () => const VideoGallaryView(),
      binding: VideoGallaryBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO_GALLARY,
      page: () => const PhotoGallaryView(),
      binding: PhotoGallaryBinding(),
    ),
    GetPage(
      name: _Paths.OUR_CAMPUS,
      page: () => const OurCampusView(),
      binding: OurCampusBinding(),
    ),
    GetPage(
      name: _Paths.OUR_PHILOSYPHER,
      page: () => const OurPhilosypherView(),
      binding: OurPhilosypherBinding(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => const AboutusView(),
      binding: AboutusBinding(),
    ),
    GetPage(
      name: _Paths.RATE_US,
      page: () => const RateUsView(),
      binding: RateUsBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERMAND_CONDITION,
      page: () => const TermandConditionView(),
      binding: TermandConditionBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO_VIEW,
      page: () => const PhotoViewView(),
      binding: PhotoViewBinding(),
    ),
    GetPage(
      name: _Paths.CONTECT_US,
      page: () => const ContectUsView(),
      binding: ContectUsBinding(),
    ),
  ];
}
