import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtherActivitiesController extends GetxController {
  //TODO: Implement OtherActivitiesController

  final count = 0.obs;

  //final controller = ConfettiController();
  late ConfettiController controllerCenter;
  late ConfettiController controllerCenterRight;
  late ConfettiController controllerCenterLeft;
  late ConfettiController controllerTopCenter;
  late ConfettiController controllerBottomCenter;

  List headings = [
    "Birthday",
    "Alert",
    "Notification"
  ];

  List imagesdemo = [
    'assets/images/TISB Birthday post.jpg',
    "assets/images/image_2023_04_04T11_42_22_727Z.png"
  ];

  @override
  void onInit() {
    super.onInit();

    controllerCenter = ConfettiController(duration: const Duration(seconds: 5));
    controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 5));
    controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 5));
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 5));
    controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 5));
  }

  @override
  void dispose() {
    controllerCenter.dispose();
    controllerCenterRight.dispose();
    controllerCenterLeft.dispose();
    controllerTopCenter.dispose();
    controllerBottomCenter.dispose();

    super.dispose();
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
