import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/global_widgets/globle_var.dart';

class LeavesScreenController extends GetxController {
  TextEditingController name =TextEditingController();
  TextEditingController fathername =TextEditingController();
  TextEditingController Class =TextEditingController();
  //TODO: Implement LeavesScreenController
  RxBool fordetails = false.obs;
  DateTime? date;
  DateTime? dateend;

 // String? gender;



  final gender = "".obs;


  final count = 0.obs;
  final startDate = "".obs;

  final endDate = "".obs;


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
