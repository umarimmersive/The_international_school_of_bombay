import 'package:get/get.dart';

import '../controllers/artical3_controller.dart';

class Artical3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Artical3Controller>(
      () => Artical3Controller(),
    );
  }
}
