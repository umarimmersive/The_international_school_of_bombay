import 'package:get/get.dart';

import '../controllers/shorts_video_controller.dart';


class ShortVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShortVideoController>(
      () => ShortVideoController(),
    );
  }
}
