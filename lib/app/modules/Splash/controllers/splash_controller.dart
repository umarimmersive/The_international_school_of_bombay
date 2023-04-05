import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  final Image = "assets/images/logo.png".obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      Get.toNamed(Routes.LOGIN);
    });

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [ SystemUiOverlay.bottom]);

    super.onInit();
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
