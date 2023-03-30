import 'package:get/get.dart';

class Menu_Controller extends GetxController {
  //TODO: Implement MenuController
  List data=[
    {
      'title':'A Blood Donation Camp To Be Help',
    },
    {
      'title':'An Exhibition',
    },
    {
      'title':'An lnauguration To Take Place',
    },
    {
      'title':'A Lost and Found Notice',
    },
    {
      'title':'A Blood Donation Camp To Be Help',
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
