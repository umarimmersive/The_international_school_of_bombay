import 'package:get/get.dart';

import '../controllers/exam_date_controller.dart';

class ExamDateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamDateController>(
      () => ExamDateController(),
    );
  }
}
