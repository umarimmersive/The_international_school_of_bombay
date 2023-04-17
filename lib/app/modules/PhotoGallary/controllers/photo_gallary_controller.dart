import 'package:get/get.dart';

import '../views/photo_gallary_view.dart';

class PhotoGallaryController extends GetxController {
  //TODO: Implement PhotoGallaryController

  List images =[
    "assets/images/1.png",
    "assets/images/47.jpg",
    "assets/images/48.jpg",
    "assets/images/35.jpg",
    "assets/images/37.jpg",
    "assets/images/38.jpg",
    "assets/images/39.jpg",
    "assets/images/40.jpg",
    "assets/images/42.jpg",
    "assets/images/43.jpg",
    "assets/images/44.jpg",
    "assets/images/45.jpg",
  ];
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
