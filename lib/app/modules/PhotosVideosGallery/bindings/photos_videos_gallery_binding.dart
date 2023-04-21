import 'package:get/get.dart';

import '../controllers/photos_videos_gallery_controller.dart';

class PhotosVideosGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotosVideosGalleryController>(
      () => PhotosVideosGalleryController(),
    );
  }
}
