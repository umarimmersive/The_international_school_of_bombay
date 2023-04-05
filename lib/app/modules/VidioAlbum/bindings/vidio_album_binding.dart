import 'package:get/get.dart';

import '../controllers/vidio_album_controller.dart';

class VidioAlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VidioAlbumController>(
      () => VidioAlbumController(),
    );
  }
}
