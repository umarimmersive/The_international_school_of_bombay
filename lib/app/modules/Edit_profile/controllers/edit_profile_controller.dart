import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/globle_var.dart';

import '../../../utils/constants/api_service.dart';

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

  var imageFile = File('').obs;
  RxString profile_network = ''.obs;

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

  getFromGallery(context) async {

    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      // maxWidth: 1800,
      // maxHeight: 1800,
    );
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: pickedFile!.path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 100,
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            activeControlsWidgetColor: ColorValues.BG_BT2,
            cropFrameColor: ColorValues.BG_BT2,
            cropGridColor:ColorValues.BG_BT2 ,
            // dimmedLayerColor: HexColor("#0D86BF"),
            statusBarColor: ColorValues.BG_BT2,
            toolbarColor:  ColorValues.BG_BT2,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.dialog,
          boundary: const CroppieBoundary(
            width: 520,
            height: 520,
          ),
          viewPort:
          const CroppieViewPort(width: 480, height: 480, type: 'circle'),
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),

      ],
    );
    if (croppedFile != null) {

      imageFile.value = File(croppedFile.path);
      profile_network.value = '';
      update_profile_pic();
    }
  }

   update_profile_pic() async {

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? user_id=preferences.getString("token");

    var response = await ApiService().Upload_profile_image(
        userData!.id, imageFile.value.path);
    if (response.containsKey('success')) {
      if (response['success'] == true) {
        //   CommonClass.getToast(response['message'],'' );
        // getUserProfile();
      }else if (response['success'] == false) {
        print({'$response'});
      }
    } else {}
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
