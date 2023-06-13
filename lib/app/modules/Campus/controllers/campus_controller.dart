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
    "At Malwa County, Bypass Road, Indore "
  ];

  List colors=[
    "#7d3c98",
    "#f4d03f",
    "#17a589",
    "#e74c3c",
  ];

  List url=[
    "https://www.google.com/maps/place/The+International+School+of+Bombay/@22.726479,75.895573,16z/data=!4m6!3m5!1s0x3962fd35ec56f54f:0xca30807c28757d49!8m2!3d22.726479!4d75.8955732!16s%2Fg%2F11csqp47_c?hl=en&entry=ttu",
   "https://www.google.com/maps/place/The+International+School+of+Bombay+-+Premium+Campus+-+2/@22.7261461,75.8836774,17z/data=!4m6!3m5!1s0x3962fd485b4ffd85:0x8d95823a12f5bc87!8m2!3d22.7285986!4d75.8901115!16s%2Fg%2F11ggzct5vv?hl=en&entry=ttu",
   "https://www.google.com/maps/place/The+International+School+of+Bombay+-+World+School/@22.7362104,75.9313185,17z/data=!3m1!4b1!4m6!3m5!1s0x3962e347aa4a98a7:0x262aa5c1e4776b99!8m2!3d22.7362104!4d75.9313185!16s%2Fg%2F11h3nnjsq6?hl=en&entry=ttu",
   "https://www.google.com/maps/place/The+International+School+of+Bombay/@22.726479,75.895573,16z/data=!4m6!3m5!1s0x3962fd35ec56f54f:0xca30807c28757d49!8m2!3d22.726479!4d75.8955732!16s%2Fg%2F11csqp47_c?hl=en&entry=ttu",
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
