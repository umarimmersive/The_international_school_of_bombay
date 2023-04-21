import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/my_local_service.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/global_widgets/globle_var.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  final Image = "assets/images/logo.png".obs;

  @override
  void onInit() {

    init();

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [ SystemUiOverlay.bottom]);

    super.onInit();
  }
  init() async {
/*
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final allInfo = deviceInfo.data;

    print('---------------------${allInfo}');*/


    Future.delayed(const Duration(seconds: 2)).then((value) async {
      sharedPreference = await SharedPreferences.getInstance();
      if(my_local_service.isLoggedIn()){
          Get.toNamed(Routes.DESHBOARD_SCREEN);
      }else{
          Get.toNamed(Routes.LOGIN);

      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
