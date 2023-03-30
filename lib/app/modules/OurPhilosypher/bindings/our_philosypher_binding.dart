import 'package:get/get.dart';

import '../controllers/our_philosypher_controller.dart';

class OurPhilosypherBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OurPhilosypherController>(
      () => OurPhilosypherController(),
    );
  }
}
