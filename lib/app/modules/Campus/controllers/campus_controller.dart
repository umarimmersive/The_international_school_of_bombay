import 'package:get/get.dart';

class CampusController extends GetxController {
  //TODO: Implement CampusController

  List logo = [
    "assets/logo/Elite Logo.jpg",
    "assets/logo/Kindergarten Logo.jpg",
    "assets/logo/World School Logo.jpg",
    "assets/logo/High End School Logo.jpg",
  ];


  List heading=[
    "HEAD OFFICE & SCHOOL CAMPUS 1 (State Board)",
    "SCHOOL CAMPUS - 2 PREMIUM CAMPUS (PRE-PRIMARY)",
    "SCHOOL CAMPUS - 2 WORLD SCHOOL (CBSC AFFILIATED)",
    "NEW UPCOMING HIGH-END SCHOOL CAMPUS - 4"
  ];

  List address =[
    '152, BAIKUNTH DHAM, OFF SAKET Square, Old Palasia, Indore',
    "5, Old Palasia, Ranade Compound, Indore",
    "Khasra No. 360/9-10-11, Behind Bhandari Farm & Resorts, Indore",
    "At Malwa County, Bypass, Indore "
  ];

  List colors=[
    "#7d3c98",
    "#f4d03f",
    "#17a589",
    "#e74c3c",
  ];


  final count = 0.obs;
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
