import 'package:get/get.dart';

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
