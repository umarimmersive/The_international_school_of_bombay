import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
 static late final BuildContext context;


  static final String BASE_URL = "";
  static final String IMAGE_URL = "";

  //use
 static final String SPLASH = "splashScreen";



 /* Future Login(email,password,id) async {
    final response = await http.post(
          Uri.parse(BASE_URL + LOGIN),
          headers: {HttpHeaders.acceptHeader: "application/json"},
          body: ({
            'device_id': id,
            'login_type':'app',
            'email':email,
            'password': password,
          })
      );
      var ConvertDataToJson = jsonDecode(response.body);
      return ConvertDataToJson;
  }*/







}
