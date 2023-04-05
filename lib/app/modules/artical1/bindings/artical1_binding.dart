import 'package:get/get.dart';

import '../controllers/artical1_controller.dart';

class Artical1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Artical1Controller>(
      () => Artical1Controller(),
    );
  }
}
