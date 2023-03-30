
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



final Theme_mode=false.obs;
final isSwitched=false.obs;


final Today_date=''.obs;
final Select_language=''.obs;
 final messangerKey = GlobalKey<ScaffoldMessengerState>();
late SharedPreferences sharedPreference;
//UserModal? userData;

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
