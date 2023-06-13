import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/leave_status_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ShowToast.dart';
import '../../../utils/constants/api_service.dart';
import '../../../utils/constants/my_local_service.dart';
import '../../../utils/global_widgets/globle_var.dart';

class LeavesScreenController extends GetxController {
  TextEditingController name =TextEditingController();
  TextEditingController fathername =TextEditingController();
  TextEditingController Class =TextEditingController();
  //TODO: Implement LeavesScreenController
  RxBool fordetails = false.obs;
  DateTime? date;
  DateTime? dateend;

  Rx<TextEditingController> reasonforleave=TextEditingController().obs;

  var docFile = File('').obs;

  final gender = "".obs;
  final docfilename = "-".obs;
  File? documentimageFile;

  final count = 0.obs;
  final startDate = "".obs;

  final endDate = "".obs;
  final isotherReason = false.obs;
  final isSelect = ''.obs;

  dateString(context) async {
    final result = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.red, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (result != null) {
      date = result;
      startDate.value = "${date!.day}/${date!.month}/${date!.year}";
    }
  }

  dateStringg(context) async {
    final resultt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.red, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Colors.blueAccent, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (resultt != null) {
      dateend = resultt;
      endDate.value = "${dateend!.day}/${dateend!.month}/${dateend!.year}";
    }
  }


  @override
  void onInit() {
    name.text=userData!.full_name;
    fathername.text=userData!.father_name;
    Class.text=userData!.Class;
    Get_LeaveStatus();
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

  getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles( type: FileType.custom,
      allowedExtensions: ['jpg','pdf','jpeg','png'],
    );

    if (result != null) {
      docFile.value = File(result.files.single.path.toString());
      documentimageFile = File(docFile.value.path);

      docfilename.value=result.files.first.name.toString();
    } else {
      // User canceled the picker
    }
  }



  OnSubmit(){
    if(name.text.isEmpty){
      ToastClass.showToast('Please enter full name.', 'assets/only_logo.png');
    }else if(fathername.text.isEmpty){
      ToastClass.showToast('Please enter father name.', 'assets/only_logo.png');
    }else if(Class.text.isEmpty){
      ToastClass.showToast('Please enter class name.', 'assets/only_logo.png');
    }else if(startDate == "") {
      ToastClass.showToast('Please enter start date.', 'assets/only_logo.png');
    }else if(endDate == "") {
      ToastClass.showToast('Please enter end data.', 'assets/only_logo.png');
    }else if(reasonforleave.value.text.isEmpty) {
      ToastClass.showToast('Please enter any reason for leave.', 'assets/only_logo.png');
    }else{
      leave_Api();
    }
  }

  final isLoading=false.obs;

  leave_Api() async {
    try {
      isLoading(true);

      var response = await ApiService()
          .Leave_apply(
        student_id: userData!.id,
        student_name: name.text,
        father_name: fathername.text,
        Class: userData!.Class,
        start_date: startDate,
        end_date: endDate,
        reason_for_leave: '',
        other_reason: reasonforleave.value.text,
        attachement: docfilename.value


      );

      if (response['status'] == true) {


        ToastClass.showToast('${response['message']}', 'assets/only_logo.png');

        isLoading(false);
        Get.toNamed(Routes.DESHBOARD_SCREEN);

      } else if (response['status'] == false) {
        ToastClass.showToast('${response['message']}', 'assets/only_logo.png');
        isLoading(false);
      }

    } finally {

      isLoading(false);

    }
  }

  final LeaveStatusList = <LeaveStatusModel>[].obs;
  final isLoading_LeaveStatus = false.obs;


  Future Get_LeaveStatus() async {
    // Slider.value.clear();
    try {
      isLoading_LeaveStatus(true);
      final prefs = await SharedPreferences.getInstance();
      var tokendd =  sharedPreference.getString('token');


      var response = await ApiService().Leave_Status(tokendd);

      print({'response==================================$response'});
      if (response['status'] == true) {

        List dataList = response['data'].toList();
        LeaveStatusList.value = dataList.map((json) => LeaveStatusModel.fromJson(json)).toList();

        print('Leave Status-------------${LeaveStatusList.value}');

        update();
        isLoading_LeaveStatus(false);
      } else if (response['status'] == false) {

        isLoading_LeaveStatus(false);
        update();
      }
    } finally {
      isLoading_LeaveStatus(false);
      update();

    }
  }



}
