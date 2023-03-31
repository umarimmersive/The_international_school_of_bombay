import 'package:get/get.dart';

class HoppinessController extends GetxController {
  //TODO: Implement HoppinessController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  final sport_image_data=[
    'assets/sport/37.jpg',
    'assets/sport/3.jpg',
    'assets/sport/42.jpg',
    'assets/sport/21.jpg',
  ];


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
