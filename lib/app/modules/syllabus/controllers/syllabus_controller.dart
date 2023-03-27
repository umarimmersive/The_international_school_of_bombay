import 'package:get/get.dart';

class SyllabusController extends GetxController {
  //TODO: Implement SyllabusController
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
  final count = 0.obs;
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
