import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'notificationModel.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController
  List<dynamic> notifications = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/notifications.json');
    final data = await json.decode(response);


      notifications = data['notifications']
          .map((data) => InstagramNotification.fromJson(data)).toList();

  }
  final count = 0.obs;
  @override
  void onInit() {
    readJson();
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
