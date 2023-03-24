import 'package:get/get.dart';

import '../controllers/notice_board_details_controller.dart';

class NoticeBoardDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeBoardDetailsController>(
      () => NoticeBoardDetailsController(),
    );
  }
}
