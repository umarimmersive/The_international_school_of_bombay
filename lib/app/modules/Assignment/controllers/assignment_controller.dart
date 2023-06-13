import 'package:get/get.dart';

import '../../../models/assignment_model.dart';
import '../../../utils/constants/api_service.dart';
import '../../../utils/global_widgets/globle_var.dart';

class AssignmentController extends GetxController {
  //TODO: Implement AssignmentController

  final count = 0.obs;
  // List data=[
  //
  //   {
  //     'title':'Mathematics',
  //     'date': '1 April at 08:25',
  //   },
  //
  // ];
  @override
  void onInit() {
    super.onInit();
    Assignment_Data_Api();
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

  final assignment_List = <AssignmentModel>[].obs;
  final isLoading_assignment=false.obs;
  Future Assignment_Data_Api() async {
    try {
      isLoading_assignment(true);
      // Adv_list.clear();
      var response = await ApiService()
          .Assignment_data(userData!.Class);
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        assignment_List.value = dataList.map((json) => AssignmentModel.fromJson(json)).toList();

        update();
      } else if (response['status'] == false) {

        isLoading_assignment(false);
      }
    } finally {
      isLoading_assignment(false);

    }
  }



}
