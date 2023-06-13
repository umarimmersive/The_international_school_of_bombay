import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/modules/About/controllers/about_controller.dart';
import 'package:the_international_school_of_bombay/app/modules/Hoppiness/controllers/hoppiness_controller.dart';
import 'package:the_international_school_of_bombay/app/modules/PhotoGallary/controllers/photo_gallary_controller.dart';
import 'package:the_international_school_of_bombay/app/modules/PhotoGallary/views/photo_gallary_view.dart';
import 'package:the_international_school_of_bombay/app/modules/PhotosVideosGallery/controllers/photos_videos_gallery_controller.dart';

import '../../../models/Knowledge_base_model.dart';
import '../../../utils/constants/api_service.dart';
import '../../About/views/about_view.dart';
import '../../HomeScreen/controllers/home_screen_controller.dart';
import '../../HomeScreen/views/home_screen_view.dart';
import '../../Hoppiness/views/hoppiness_view.dart';
import '../../Menu/controllers/menu_controller.dart';
import '../../Menu/views/menu_view.dart';
import '../../PhotosVideosGallery/views/photos_videos_gallery_view.dart';
import '../../ScheduleScreen/controllers/schedule_screen_controller.dart';
import '../../ScheduleScreen/views/schedule_screen_view.dart';
import '../../TimeTableScreen/controllers/time_table_screen_controller.dart';
import '../../TimeTableScreen/views/time_table_screen_view.dart';


class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  final HOME = Get.put(HomeScreenController());
  // final HOPPI = Get.put(HoppinessController());
  final GALLERY = Get.put(PhotosVideosGalleryController());
  final Shedul = Get.put(ScheduleScreenController());
  final ABOUT = Get.put(TimeTableScreenController());
  final Menu = Get.put(MenuuController());
  var tabIndex=0.obs;

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreenView(); // First view in viewport
  final currentTab = 0.obs; // to keep track of active tab index

  void changeTabindex(int index){
    tabIndex.value = index;
    update();
  }
  final List<Widget> screens = [
    HomeScreenView(),
    // HoppinessView(),
    PhotosVideosGalleryView(),
    SheduleScreenView(),
    TimeTableScreenView(),
    MenuView(),
  ];
  final count = 0.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    Get_banner_list();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [ SystemUiOverlay.bottom]);
    // HOME.onInit();
    // HOPPI.onInit();
    // Shedul.onInit();
    // ABOUT.onInit();
    // Menu.onInit();
    super.onInit();
  }

  final Adv_list = <Avd_model>[].obs;
  final BottomSheetImage=''.obs;

  Future Get_banner_list() async {
    try {
      isLoading(true);
      Adv_list.clear();
      var response = await ApiService()
          .AlertNotice();
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        Adv_list.value = dataList.map((json) => Avd_model.fromJson(json)).toList();
        BottomSheetImage.value=Adv_list[0].image!;
        print('BottomSheetImage---------------------------------${BottomSheetImage.value}');
        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    HOME.onClose();
    GALLERY.onClose();
    ABOUT.onClose();
    super.onClose();
  }

  void increment() => count.value++;
}
