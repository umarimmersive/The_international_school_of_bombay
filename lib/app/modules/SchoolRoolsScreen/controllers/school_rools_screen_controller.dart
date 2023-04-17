import 'package:get/get.dart';

import '../../../utils/constants/api_service.dart';

class SchoolRoolsScreenController extends GetxController {
  //TODO: Implement SchoolRoolsScreenController

  final count = 0.obs;
  final isLoading = false.obs;
  final title = ''.obs;
  final content = ''.obs;

  Future Get_school_rools() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .School_Rules();
      if (response['status'] == true) {

        title.value=response['data']['title'];
        content.value=response['data']['content'];


        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
  }

  @override
  void onInit() {
    Get_school_rools();
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
