import 'package:get/get.dart';

import '../../../models/syllabus_model.dart';
import '../../../utils/constants/api_service.dart';
import '../../../utils/global_widgets/globle_var.dart';

class AccedmicContentController extends GetxController {
  //TODO: Implement AccedmicContentController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    academic_conten_Api();
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

final academic_content_Data = <Academic_Content_Model>[].obs;
final isLoading_academic_content=false.obs;
Future academic_conten_Api() async {
  try {
    isLoading_academic_content(true);
    // Adv_list.clear();
    var response = await ApiService()
        .Academic_Content_data(userData!.Class);
    if (response['status'] == true) {

      print('responce----------------------${response}');

      List dataList = response['data'].toList();
      academic_content_Data.value = dataList.map((json) => Academic_Content_Model.fromJson(json)).toList();

      update();
    } else if (response['status'] == false) {

      isLoading_academic_content(false);
    }
  } finally {
    isLoading_academic_content(false);

  }
}

}
