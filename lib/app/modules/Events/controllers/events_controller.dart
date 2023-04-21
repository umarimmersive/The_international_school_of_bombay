import 'package:get/get.dart';

import '../../../models/Knowledge_base_model.dart';
import '../../../utils/constants/api_service.dart';

class EventsController extends GetxController {
  //TODO: Implement EventsController

  final count = 0.obs;
  final isLoading = false.obs;
  final screen_name = 'Event & extra'.obs;
  final is_bool= <bool>[true,false,false,false].obs;



  final id=''.obs;
  @override
  void onInit() {
    id.value=Get.parameters['id'].toString();
    Get_Event_details();

    super.onInit();
  }


//chnage model class
  final EventDetails = <Knowledge_base_details_model>[].obs;


  Future Get_Event_details() async {

    try {
      print('responce--------------------');
      isLoading(true);
      var response = await ApiService()
          .Event_Details(id);
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        EventDetails.value = dataList.map((json) => Knowledge_base_details_model.fromJson(json)).toList();


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
