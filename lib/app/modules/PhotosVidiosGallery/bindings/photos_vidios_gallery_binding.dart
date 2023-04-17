import 'package:get/get.dart';

import '../controllers/photos_vidios_gallery_controller.dart';

class PhotosVidiosGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotosVidiosGalleryController>(
      () => PhotosVidiosGalleryController(),
    );
  }
}
