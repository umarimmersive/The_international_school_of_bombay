import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/modules/UpcomingEventsDetails/controllers/upcoming_events_details_controller.dart';
import 'package:the_international_school_of_bombay/app/modules/UpcomingEventsDetails/views/upcoming_events_details_view.dart';
import '../modules/About/bindings/about_binding.dart';
import '../modules/About/views/about_view.dart';
import '../modules/Academic_content/bindings/academic_content_binding.dart';
import '../modules/Academic_content/views/academic_content_view.dart';
import '../modules/AccedmicContent/bindings/accedmic_content_binding.dart';
import '../modules/AccedmicContent/views/accedmic_content_view.dart';
import '../modules/Album/bindings/album_binding.dart';
import '../modules/Album/views/album_view.dart';
import '../modules/Assignment/bindings/assignment_binding.dart';
import '../modules/Assignment/views/assignment_view.dart';
import '../modules/BusrootDetails/bindings/busroot_details_binding.dart';
import '../modules/BusrootDetails/views/busroot_details_view.dart';
import '../modules/BusrootScreen/bindings/busroot_screen_binding.dart';
import '../modules/BusrootScreen/views/busroot_screen_view.dart';
import '../modules/Campus/bindings/campus_binding.dart';
import '../modules/Campus/views/campus_view.dart';
import '../modules/ContectUs/bindings/contect_us_binding.dart';
import '../modules/ContectUs/views/contect_us_view.dart';
import '../modules/Dashboard/bindings/dashboard_binding.dart';
import '../modules/Dashboard/views/dashboard_view.dart';
import '../modules/Edit_profile/bindings/edit_profile_binding.dart';
import '../modules/Edit_profile/views/edit_profile_view.dart';
import '../modules/Events/bindings/events_binding.dart';
import '../modules/Events/views/events_view.dart';
import '../modules/Home_slider_details/bindings/home_slider_details_binding.dart';
import '../modules/Home_slider_details/views/home_slider_details_view.dart';
import '../modules/Hoppiness/bindings/hoppiness_binding.dart';
import '../modules/Hoppiness/views/hoppiness_view.dart';
import '../modules/InternalReferProgram/bindings/internal_refer_program_binding.dart';
import '../modules/InternalReferProgram/views/internal_refer_program_view.dart';
import '../modules/LeavesScreen/bindings/leaves_screen_binding.dart';
import '../modules/LeavesScreen/views/leaves_screen_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Menu/bindings/menu_binding.dart';
import '../modules/Menu/views/menu_view.dart';
import '../modules/MounthwiseSyllabus/bindings/mounthwise_syllabus_binding.dart';
import '../modules/MounthwiseSyllabus/views/mounthwise_syllabus_view.dart';
import '../modules/NoticeBoard/bindings/notice_board_binding.dart';
import '../modules/NoticeBoard/views/notice_board_view.dart';
import '../modules/NoticeBoardDetails/bindings/notice_board_details_binding.dart';
import '../modules/NoticeBoardDetails/views/notice_board_details_view.dart';
import '../modules/Notification/bindings/notification_binding.dart';
import '../modules/Notification/views/notification_view.dart';
import '../modules/OtherActivities/bindings/other_activities_binding.dart';
import '../modules/OtherActivities/views/other_activities_view.dart';
import '../modules/OurPhilosypher/bindings/our_philosypher_binding.dart';
import '../modules/OurPhilosypher/views/our_philosypher_view.dart';
import '../modules/PdfView/bindings/pdf_view_binding.dart';
import '../modules/PdfView/views/pdf_view_view.dart';
import '../modules/PhotoGallary/bindings/photo_gallary_binding.dart';
import '../modules/PhotoGallary/views/photo_gallary_view.dart';
import '../modules/PhotoView/bindings/photo_view_binding.dart';
import '../modules/PhotoView/views/photo_view_view.dart';
import '../modules/PhotosVideosGallery/bindings/photos_videos_gallery_binding.dart';
import '../modules/PhotosVideosGallery/views/photos_videos_gallery_view.dart';
import '../modules/PrivacyPolicy/bindings/privacy_policy_binding.dart';
import '../modules/PrivacyPolicy/views/privacy_policy_view.dart';
import '../modules/QuiryScreen/bindings/quiry_screen_binding.dart';
import '../modules/QuiryScreen/views/quiry_screen_view.dart';
import '../modules/RateUs/bindings/rate_us_binding.dart';
import '../modules/RateUs/views/rate_us_view.dart';
import '../modules/ScheduleScreen/bindings/schedule_screen_binding.dart';
import '../modules/ScheduleScreen/views/schedule_screen_view.dart';
import '../modules/SchoolRoolsScreen/bindings/school_rools_screen_binding.dart';
import '../modules/SchoolRoolsScreen/views/school_rools_screen_view.dart';
import '../modules/Splash/bindings/splash_binding.dart';
import '../modules/Splash/views/splash_view.dart';
import '../modules/TermandCondition/bindings/termand_condition_binding.dart';
import '../modules/TermandCondition/views/termand_condition_view.dart';
import '../modules/TimeTableScreen/bindings/time_table_screen_binding.dart';
import '../modules/TimeTableScreen/views/time_table_screen_view.dart';
import '../modules/UpcomingEventsDetails/bindings/upcoming_events_details_binding.dart';
import '../modules/Upcoming_Event/bindings/upcoming_event_binding.dart';
import '../modules/Upcoming_Event/views/upcoming_event_view.dart';
import '../modules/VideoGallary/bindings/video_gallary_binding.dart';
import '../modules/VideoGallary/views/video_gallary_view.dart';
import '../modules/VideoPlayer/bindings/video_player_binding.dart';
import '../modules/VideoPlayer/views/video_player_view.dart';
import '../modules/VidioAlbums/bindings/vidio_albums_binding.dart';
import '../modules/VidioAlbums/views/vidio_albums_view.dart';
import '../modules/aboutus/bindings/aboutus_binding.dart';
import '../modules/aboutus/views/aboutus_view.dart';
import '../modules/artical1/bindings/artical1_binding.dart';
import '../modules/artical1/views/artical1_view.dart';
import '../modules/syllabus/bindings/syllabus_binding.dart';
import '../modules/syllabus/views/syllabus_view.dart';
part 'app_routes.dart';



class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOPPINESS,
      page: () => HoppinessView(),
      binding: HoppinessBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT,
      page: () => AboutView(),
      binding: AboutBinding(),
    ),
    GetPage(
      name: _Paths.MENU,
      page: () => MenuView(),
      binding: MenuBinding(),
    ),
    GetPage(
      name: _Paths.NOTICE_BOARD,
      page: () => NoticeBoardView(),
      binding: NoticeBoardBinding(),
    ),
    GetPage(
      name: _Paths.NOTICE_BOARD_DETAILS,
      page: () => NoticeBoardDetailsView(),
      binding: NoticeBoardDetailsBinding(),
    ),
    GetPage(
      name: _Paths.EVENTS,
      page: () => EventsView(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: _Paths.EVENTS,
      page: () => UpcomingEventDetailsView(),
      binding: UpcomingEventsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.DESHBOARD_SCREEN,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT,
      page: () => AssignmentView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: _Paths.SYLLABUS,
      page: () => SyllabusView(),
      binding: SyllabusBinding(),
    ),
    GetPage(
      name: _Paths.PDF_VIEW,
      page: () => PdfViewView(),
      binding: PdfViewBinding(),
    ),
    GetPage(
      name: _Paths.ACADEMIC_CONTENT,
      page: () => AcademicContentView(),
      binding: AcademicContentBinding(),
    ),
    GetPage(
      name: _Paths.UPCOMING_EVENT,
      page: () => UpcomingEventView(),
      binding: UpcomingEventBinding(),
    ),
    GetPage(
      name: _Paths.MOUNTHWISE_SYLLABUS,
      page: () => MounthwiseSyllabusView(),
      binding: MounthwiseSyllabusBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_GALLARY,
      page: () => VideoGallaryView(),
      binding: VideoGallaryBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO_GALLARY,
      page: () => PhotoGallaryView(),
      binding: PhotoGallaryBinding(),
    ),
    GetPage(
      name: _Paths.OUR_PHILOSYPHER,
      page: () => OurPhilosypherView(),
      binding: OurPhilosypherBinding(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => AboutusView(),
      binding: AboutusBinding(),
    ),
    GetPage(
      name: _Paths.RATE_US,
      page: () => RateUsView(),
      binding: RateUsBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERMAND_CONDITION,
      page: () => TermandConditionView(),
      binding: TermandConditionBinding(),
    ),
    GetPage(
      name: _Paths.PHOTO_VIEW,
      page: () => PhotoViewView(),
      binding: PhotoViewBinding(),
    ),
    GetPage(
      name: _Paths.CONTECT_US,
      page: () => ContectUsView(),
      binding: ContectUsBinding(),
    ),
    GetPage(
      name: _Paths.CAMPUS,
      page: () => CampusView(),
      binding: CampusBinding(),
    ),
    GetPage(
      name: _Paths.ALBUM,
      page: () => AlbumView(),
      binding: AlbumBinding(),
    ),
    GetPage(
      name: _Paths.HOME_SLIDER_DETAILS,
      page: () => HomeSliderDetailsView(),
      binding: HomeSliderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.INTERNAL_REFER_PROGRAM,
      page: () => InternalReferProgramView(),
      binding: InternalReferProgramBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_PLAYER,
      page: () => const VideoPlayerView(),
      binding: VideoPlayerBinding(),
    ),
    GetPage(
      name: _Paths.ARTICAL1,
      page: () => Artical1View(),
      binding: Artical1Binding(),
    ),
    GetPage(
      name: _Paths.ACCEDMIC_CONTENT,
      page: () => const AccedmicContentView(),
      binding: AccedmicContentBinding(),
    ),
    GetPage(
      name: _Paths.TIME_TABLE_SCREEN,
      page: () => const TimeTableScreenView(),
      binding: TimeTableScreenBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_SCREEN,
      page: () => const ScheduleScreenView(),
      binding: ScheduleScreenBinding(),
    ),
    GetPage(
      name: _Paths.OTHER_ACTIVITIES,
      page: () => const OtherActivitiesView(),
      binding: OtherActivitiesBinding(),
    ),
    GetPage(
      name: _Paths.LEAVES_SCREEN,
      page: () => LeavesScreenView(),
      binding: LeavesScreenBinding(),
    ),
    GetPage(
      name: _Paths.BUSROOT_SCREEN,
      page: () => const BusrootScreenView(),
      binding: BusrootScreenBinding(),
    ),
    GetPage(
      name: _Paths.SCHOOL_ROOLS_SCREEN,
      page: () => const SchoolRoolsScreenView(),
      binding: SchoolRoolsScreenBinding(),
    ),
    GetPage(
      name: _Paths.QUIRY_SCREEN,
      page: () => const QuiryScreenView(),
      binding: QuiryScreenBinding(),
    ),
    GetPage(
      name: _Paths.BUSROOT_DETAILS,
      page: () => const BusrootDetailsView(),
      binding: BusrootDetailsBinding(),
    ),
    GetPage(
      name: _Paths.VIDIO_ALBUMS,
      page: () => const VidioAlbumsView(),
      binding: VidioAlbumsBinding(),
    ),
    GetPage(
      name: _Paths.PHOTOS_VIDIOS_GALLERY,
      page: () => PhotosVideosGalleryView(),
      binding: PhotosVideosGalleryBinding(),
    ),
  ];
}
