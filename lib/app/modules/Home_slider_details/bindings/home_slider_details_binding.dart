import 'package:get/get.dart';

import '../controllers/home_slider_details_controller.dart';

class HomeSliderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSliderDetailsController>(
      () => HomeSliderDetailsController(),
    );
  }
}
