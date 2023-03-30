import 'package:get/get.dart';

import '../controllers/photo_gallary_controller.dart';

class PhotoGallaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoGallaryController>(
      () => PhotoGallaryController(),
    );
  }
}
