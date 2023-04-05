import 'package:get/get.dart';

import '../controllers/other_activities_controller.dart';

class OtherActivitiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherActivitiesController>(
      () => OtherActivitiesController(),
    );
  }
}
