import 'package:get/get.dart';

import '../controllers/artical4_controller.dart';

class Artical4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Artical4Controller>(
      () => Artical4Controller(),
    );
  }
}
