import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/modules/About/controllers/about_controller.dart';
import 'package:the_international_school_of_bombay/app/modules/Home/controllers/home_controller.dart';
import 'package:the_international_school_of_bombay/app/modules/Hoppiness/controllers/hoppiness_controller.dart';

import '../../HomeScreen/controllers/home_screen_controller.dart';
import '../../Menu/controllers/menu_controller.dart';


class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  final HOME = Get.put(HomeScreenController());
  final HOPPI = Get.put(HoppinessController());
  final ABOUT = Get.put(AboutController());
  final Menu = Get.put(Menu_Controller());
  var tabIndex=0.obs;



  void changeTabindex(int index){
    tabIndex.value = index;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    HOME.onInit();
    HOPPI.onInit();
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
