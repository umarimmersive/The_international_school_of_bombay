import 'package:get/get.dart';

import '../controllers/internal_refer_program_controller.dart';

class InternalReferProgramBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InternalReferProgramController>(
      () => InternalReferProgramController(),
    );
  }
}
