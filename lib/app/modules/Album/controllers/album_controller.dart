import 'package:get/get.dart';

class AlbumController extends GetxController {
  //TODO: Implement AlbumController
  final sport_image_data = [
    'assets/sport/37.jpg',
    'assets/sport/3.jpg',
    'assets/sport/42.jpg',
    'assets/sport/21.jpg',
    "assets/images/17.jpg",
    "assets/images/62.JPG",
    'assets/sport/37.jpg',
    'assets/sport/3.jpg',
    'assets/sport/42.jpg',
    'assets/sport/21.jpg',
    "assets/images/17.jpg",
    "assets/images/62.JPG",
  ];

  List albamname = [
    "Function",
    "Event",
    "Sport Funtion",
    "Art Event",
    "cultural events",
    "Group",
    "Function",
    "Event",
    "Sport Funtion",
    "Art Event",
    "cultural events",
    "Group",
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
