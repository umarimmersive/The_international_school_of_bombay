import 'package:get/get.dart';

import '../../../models/Knowledge_base_model.dart';
import '../../../utils/constants/api_service.dart';

class Artical1Controller extends GetxController {
  //TODO: Implement Artical1Controller

  final count = 0.obs;
  final id = ''.obs;
  @override
  void onInit() {

    print('-----------------knowladge');

    id.value=Get.parameters['id'].toString();
    Get_Knowledge_details();
    super.onInit();
  }


  final KnowledgeBaseDetailsList = <Knowledge_base_details_model>[].obs;
  final isLoading=false.obs;

  Future Get_Knowledge_details() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .KnowledgeBaseDetailsList(id);
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        KnowledgeBaseDetailsList.value = dataList.map((json) => Knowledge_base_details_model.fromJson(json)).toList();


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
