import 'package:get/get.dart';

import '../controllers/deshbord_controller.dart';

class DeshbordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeshbordController>(
      () => DeshbordController(),
    );
  }
}
