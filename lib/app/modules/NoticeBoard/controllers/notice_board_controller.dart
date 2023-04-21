import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/models/Notice_bord_list_model.dart';

import '../../../utils/constants/api_service.dart';

class NoticeBoardController extends GetxController {
  //TODO: Implement NoticeBoardController

  final count = 0.obs;
  final text = ''.obs;

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
    Get_Notice();
    super.onInit();
  }


  final isLoading=false.obs;
  final Noticebord_list = <Notice_bord_list_model>[].obs;

  Future Get_Notice() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .Notice_bord_list();
      if (response['status'] == true) {

        print('responce----------------------${response}');


        List dataList = response['data'].toList();
        Noticebord_list.value = dataList.map((json) => Notice_bord_list_model.fromJson(json)).toList();


        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
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
