import 'package:get/get.dart';

class NoticeBoardController extends GetxController {
  //TODO: Implement NoticeBoardController

  final count = 0.obs;
  final text = 'Notice Board 035'.obs;

  List data=[
    {
    'title':'A Blood Donation Camp To Be Help',
    'date': '5 August at 08:25',
    },
    {
    'title':'An Exhibition',
    'date': '1 August at 06:25',
    },
    {
      'title':'An lnauguration To Take Place',
      'date': '1 August at 08:25',
    },
    {
      'title':'A Lost and Found Notice',
      'date': '1 August at 08:25',
    },
    {
      'title':'A Blood Donation Camp To Be Help',
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