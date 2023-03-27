import 'package:get/get.dart';

class AssignmentController extends GetxController {
  //TODO: Implement AssignmentController

  final count = 0.obs;
  List data=[
    {
      'title':'English',
      'date': '5 August at 08:25',
    },
    {
      'title':'Hindi',
      'date': '1 August at 06:25',
    },
    {
      'title':'Match',
      'date': '1 August at 08:25',
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
