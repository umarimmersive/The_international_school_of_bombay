import 'package:get/get.dart';

import '../../../models/Knowledge_base_model.dart';
import '../../../models/Upcoming_event_model.dart';
import '../../../utils/constants/api_service.dart';

class UpcomingEventController extends GetxController {
  //TODO: Implement UpcomingEventController
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
  final count = 0.obs;
  @override
  void onInit() {
    print('--------------------------');
    Get_upcoming_Event();
    super.onInit();
  }

  final upcoming_event = <Upcoming_event_model>[].obs;


  final isLoading=false.obs;
  Future Get_upcoming_Event() async {
    try {
      isLoading(true);
      var response = await ApiService().EventsList('2');

      print('------------------------${response}');
      if (response['status'] == true) {

        List dataList = response['data'].toList();
        upcoming_event.value = dataList.map((json) => Upcoming_event_model.fromJson(json)).toList();

        print('------------------------${upcoming_event}');


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
