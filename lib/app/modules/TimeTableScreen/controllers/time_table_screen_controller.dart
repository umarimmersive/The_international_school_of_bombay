import 'package:get/get.dart';

import '../../../models/syllabus_model.dart';
import '../../../utils/constants/api_service.dart';
import '../../../utils/global_widgets/globle_var.dart';

class TimeTableScreenController extends GetxController {
  //TODO: Implement TimeTableScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    time_table_Api();
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

  final time_table_Data = <Time_Table_Model>[].obs;
  final isLoading_time_table=false.obs;
  Future time_table_Api() async {
    try {
      isLoading_time_table(true);
      // Adv_list.clear();
      var response = await ApiService()
          .Time_table_data(userData!.Class);
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        time_table_Data.value = dataList.map((json) => Time_Table_Model.fromJson(json)).toList();

        update();
      } else if (response['status'] == false) {

        isLoading_time_table(false);
      }
    } finally {
      isLoading_time_table(false);

    }
  }


}
