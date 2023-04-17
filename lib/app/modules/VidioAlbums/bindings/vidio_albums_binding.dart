import 'package:get/get.dart';

import '../controllers/vidio_albums_controller.dart';

class VidioAlbumsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VidioAlbumsController>(
      () => VidioAlbumsController(),
    );
  }
}
