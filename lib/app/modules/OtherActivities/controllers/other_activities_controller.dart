import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtherActivitiesController extends GetxController {
  //TODO: Implement OtherActivitiesController

  final count = 0.obs;

  List headings = ["BirthDay", "Alerts",];

  List imagesdemo = [
    'assets/images/TISB Birthday post.jpg',
    "assets/images/image_2023_04_04T11_42_22_727Z.png"
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
