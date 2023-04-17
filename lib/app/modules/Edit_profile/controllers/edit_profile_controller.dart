import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/globle_var.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController
  TextEditingController firstName=TextEditingController();
  TextEditingController lastName=TextEditingController();
  TextEditingController classController=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController dob=TextEditingController();
  TextEditingController fatherName=TextEditingController();
  TextEditingController motherName=TextEditingController();

  final count = 0.obs;
  final selected = "some book type".obs;

  List dropdownText = ['abc', 'def', 'ghi'];
  @override

  void setSelected(String value){
    selected.value = value;
  }

   @override
  void onInit() {
    firstName.text=userData!.full_name;
    lastName.text=userData!.lastname;
    fatherName.text=userData!.father_name;
    motherName.text=userData!.mother_name;
    classController.text=userData!.Class;
    phone.text=userData!.father_mobile;
    dob.text='Na';
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
