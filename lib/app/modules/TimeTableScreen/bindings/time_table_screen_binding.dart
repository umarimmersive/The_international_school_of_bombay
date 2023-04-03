import 'package:get/get.dart';

import '../controllers/time_table_screen_controller.dart';

class TimeTableScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TimeTableScreenController>(
      () => TimeTableScreenController(),
    );
  }
}
