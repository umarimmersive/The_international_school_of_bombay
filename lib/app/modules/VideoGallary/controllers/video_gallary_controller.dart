import 'package:get/get.dart';

class VideoGallaryController extends GetxController {
  //TODO: Implement VideoGallaryController
  List first = [
    'assets/Slider/1.png',
    'assets/Slider/2.png',
    'assets/Slider/3.png',
    'assets/Slider/4.png',
  ];


  List second=["assets/images/60.JPG",
    "assets/images/62.JPG",
    "assets/images/61.JPG",
    "assets/Slider/4.png",
  ];

  List third=["assets/images/54.JPG",
    "assets/images/55.JPG",
    "assets/images/56.JPG",
    "assets/images/50.JPG",

  ];


  List forth=["assets/images/15.JPG",
    "assets/images/19.JPG",
    "assets/images/13.JPG",
    "assets/images/14.JPG",

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
