import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/globle_var.dart';

class ChangePassController extends GetxController {
  //TODO: Implement EditProfileController

  TextEditingController oldPassController=TextEditingController();
  TextEditingController NewPassController=TextEditingController();
  TextEditingController ConfirmPassController=TextEditingController();

  final obscureOldPass = true.obs;
  final obscureNewPass = true.obs;
  final obscureConfirmPass = true.obs;
  final count = 0.obs;

  @override


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
