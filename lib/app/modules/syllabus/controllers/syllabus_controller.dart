import 'package:get/get.dart';

import '../../../models/syllabus_model.dart';
import '../../../utils/constants/api_service.dart';
import '../../../utils/global_widgets/globle_var.dart';

class SyllabusController extends GetxController {
  // TODO: Implement SyllabusController

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
    Syllabus_Data_Api();
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



  final syllabus_Data = <Syllabus_Model>[].obs;
  final isLoading_Syllabus=false.obs;
  Future Syllabus_Data_Api() async {
    try {
      isLoading_Syllabus(true);
      // Adv_list.clear();
      var response = await ApiService()
          .Syllabus_data(userData!.Class);
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        syllabus_Data.value = dataList.map((json) => Syllabus_Model.fromJson(json)).toList();

        update();
      } else if (response['status'] == false) {

        isLoading_Syllabus(false);
      }
    } finally {
      isLoading_Syllabus(false);

    }
  }



}
