
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';

snackbar(msg,context){
  return Flushbar(
    borderRadius: BorderRadius.circular(5),

   duration:  Duration(seconds: 3),
   message: '$msg',
   //messageSize: 16,
   margin: EdgeInsets.only(bottom: 15,left: 20,right:20),
   backgroundColor: ColorValues.kRedColor,
   //borderRadius: BorderRadius.circular(8),
    )..show(context);
}