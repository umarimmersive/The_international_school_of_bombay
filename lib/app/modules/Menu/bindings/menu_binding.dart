import 'package:get/get.dart';

import '../controllers/menu_controller.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Menu_Controller>(
      () => Menu_Controller(),
    );
  }
}
