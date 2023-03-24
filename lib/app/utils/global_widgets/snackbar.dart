
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

snackbar(msg,context){
  return Flushbar(
    duration:  Duration(seconds: 3),
    message: '$msg',
    //messageSize: 16,
    margin: EdgeInsets.all(10),
    //borderRadius: BorderRadius.circular(8),
  )..show(context);
}