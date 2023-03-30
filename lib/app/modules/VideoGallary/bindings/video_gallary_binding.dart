import 'package:get/get.dart';

import '../controllers/video_gallary_controller.dart';

class VideoGallaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoGallaryController>(
      () => VideoGallaryController(),
    );
  }
}
