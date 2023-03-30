import 'package:get/get.dart';

import '../controllers/termand_condition_controller.dart';

class TermandConditionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermandConditionController>(
      () => TermandConditionController(),
    );
  }
}
