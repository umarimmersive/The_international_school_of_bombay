import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  final Image="assets/images/Splash Screen-1.png".obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 4)).then((value) {
      //Get.toNamed('/login');
    });
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
