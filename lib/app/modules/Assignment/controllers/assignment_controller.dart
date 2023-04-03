import 'package:get/get.dart';

class AssignmentController extends GetxController {
  //TODO: Implement AssignmentController

  final count = 0.obs;
  List data=[

    {
      'title':'Mathematics',
      'date': '1 April at 08:25',
    },


  ];
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
