import 'package:get/get.dart';

import '../controllers/upcoming_events_details_controller.dart';

class UpcomingEventsDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpcomingEventsDetailsController>(
      () => UpcomingEventsDetailsController(),
    );
  }
}
