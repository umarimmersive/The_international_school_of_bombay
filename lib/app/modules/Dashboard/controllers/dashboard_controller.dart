import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/modules/About/controllers/about_controller.dart';
import 'package:the_international_school_of_bombay/app/modules/Home/controllers/home_controller.dart';
import 'package:the_international_school_of_bombay/app/modules/Hoppiness/controllers/hoppiness_controller.dart';

import '../../About/views/about_view.dart';
import '../../HomeScreen/controllers/home_screen_controller.dart';
import '../../HomeScreen/views/home_screen_view.dart';
import '../../Hoppiness/views/hoppiness_view.dart';
import '../../Menu/controllers/menu_controller.dart';
import '../../Menu/views/menu_view.dart';
import '../../ScheduleScreen/controllers/schedule_screen_controller.dart';
import '../../ScheduleScreen/views/schedule_screen_view.dart';


class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  final HOME = Get.put(HomeScreenController());
  final HOPPI = Get.put(HoppinessController());
  final Shedul = Get.put(ScheduleScreenController());
  final ABOUT = Get.put(AboutController());
  final Menu = Get.put(Menu_Controller());
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
    HoppinessView(),
    ScheduleScreenView(),
    AboutView(),
    MenuView(),
  ];
  final count = 0.obs;
  @override
  void onInit() {
    HOME.onInit();
    HOPPI.onInit();
    Shedul.onInit();
    ABOUT.onInit();
    Menu.onInit();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    HOME.onClose();
    HOPPI.onClose();
    ABOUT.onClose();
    super.onClose();
  }

  void increment() => count.value++;
}
