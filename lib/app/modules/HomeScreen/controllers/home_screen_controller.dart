import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController

  final count = 0.obs;

  List<String> title=["TISP Happenings", "Importent Notice","School Notice"];
  List<IconData> icons = [Icons.person, Icons.event_note_outlined, Icons.note_alt];


  final data=[
    {
      "title":"Sport Event",
      "date":"2019"
    },{
      "title":"Masalat Event",
      "date":"2019"
    },{
      "title":"Annual Fuctuion",
      "date":"2019"
    },{
      "title":"Sport Event",
      "date":"2019"
    }
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
