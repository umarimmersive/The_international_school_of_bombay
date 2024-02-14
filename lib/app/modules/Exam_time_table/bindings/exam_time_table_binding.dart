import 'package:get/get.dart';

import '../controllers/exam_time_table_controller.dart';

class ExamTimeTableBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamTimeTableController>(
      () => ExamTimeTableController(),
    );
  }
}
