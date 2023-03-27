import 'package:get/get.dart';

import '../controllers/academic_content_controller.dart';

class AcademicContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcademicContentController>(
      () => AcademicContentController(),
    );
  }
}
