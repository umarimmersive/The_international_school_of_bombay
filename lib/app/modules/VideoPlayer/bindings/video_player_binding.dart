import 'package:get/get.dart';

import '../controllers/video_player_controller.dart';

class VideoPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VideoPlayer_Controller>(
      () => VideoPlayer_Controller(),
    );
  }
}
