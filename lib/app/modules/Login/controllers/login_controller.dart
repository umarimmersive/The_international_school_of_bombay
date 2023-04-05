import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final Image="assets/images/logo.png".obs;
  var isLoading = false.obs;
  final obscureNewPass = true.obs;
  final count = 0.obs;
  @override
  void onInit() {
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
