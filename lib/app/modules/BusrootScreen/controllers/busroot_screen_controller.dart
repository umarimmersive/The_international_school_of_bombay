import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/globle_var.dart';

import '../../../models/busrout_model.dart';
import '../../../utils/constants/api_service.dart';

class BusrootScreenController extends GetxController {
  //TODO: Implement BusrootScreenController

  final count = 0.obs;

  List rootname = [
    'Route 1',
    'Route 2',
    'Route 3',
    'Route 4',
    'Route 5',
    'Route 6',
    'Route 7',
    'Route 8',
    'Route 9',
    'Route 10',
    'Route 11',
    "Route 12",
    'Route 13',
    'Route 14',
    'Route 15',
    'Route 16',
    'Route 17',
    'Route 18',
    'Route 19',
    'Route 20'
  ];
  @override
  void onInit() {
    super.onInit();
    busRoute_Data_Api();
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



  final busRoute_Data = <BusRouteModel>[].obs;
  final isLoading_busRoute=false.obs;
  Future busRoute_Data_Api() async {
    try {
      isLoading_busRoute(true);
      // Adv_list.clear();
      var response = await ApiService()
          .Busroute_data(userData!.Class);
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        busRoute_Data.value = dataList.map((json) => BusRouteModel.fromJson(json)).toList();

        update();
      } else if (response['status'] == false) {

        isLoading_busRoute(false);
      }
    } finally {
      isLoading_busRoute(false);

    }
  }




}
