import 'package:get/get.dart';

import '../controllers/artical5_controller.dart';

class Artical5Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Artical5Controller>(
      () => Artical5Controller(),
    );
  }
}
