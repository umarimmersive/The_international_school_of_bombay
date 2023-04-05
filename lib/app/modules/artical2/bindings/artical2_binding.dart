import 'package:get/get.dart';

import '../controllers/artical2_controller.dart';

class Artical2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Artical2Controller>(
      () => Artical2Controller(),
    );
  }
}
