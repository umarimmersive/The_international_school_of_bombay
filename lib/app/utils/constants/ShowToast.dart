import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';


class ToastClass{
  static const String colorwhite  = '#ffffff';
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }
 static showToast(String msg,String LOGO_TRANS) {
   Get.snackbar(
     msg,
     "",
     icon: Image.asset(
       LOGO_TRANS,
       width: 30,
       height: 30,
     ),
     snackPosition: SnackPosition.BOTTOM,
     margin: EdgeInsets.all(20),
     isDismissible: true,
     messageText: SizedBox(
       height: 0,
     ),
     padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 15),
     backgroundColor:
     isDark(Get.context!) ? Colors.white54 : Colors.black26,
     colorText: isDark(Get.context!) ? Colors.black : Colors.white,
     forwardAnimationCurve: Curves.easeOut,
     borderRadius: 5.0

   );
 }

}