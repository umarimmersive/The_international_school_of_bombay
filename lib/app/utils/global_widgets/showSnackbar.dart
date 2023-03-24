
import 'package:flutter/material.dart';
import 'globle_var.dart';

showSnackbar(String text,{int? seconds}){
  messangerKey.currentState?.showSnackBar(SnackBar(content: Text(text),
    duration: Duration(seconds:seconds??2),
  ));
}