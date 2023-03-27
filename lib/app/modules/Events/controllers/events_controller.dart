import 'package:get/get.dart';

class EventsController extends GetxController {
  //TODO: Implement EventsController

  final count = 0.obs;
  final screen_name = 'Event & extra'.obs;
  final is_bool= <bool>[true,false,false,false].obs;

  final data=[
    {
      "title":"Sport Event",
      "date":"2019"
    },{
      "title":"Masalat Event",
      "date":"2019"
    },{
      "title":"Annual Fuctuion",
      "date":"2019"
    },{
      "title":"Sport Event",
      "date":"2019"
    }
  ].obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
