import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';

// Note : photo video app bar worked diffrently
AppBar appbar({required String title,bool icon_button=true}) => AppBar(
      iconTheme: IconThemeData(
        size: 0,
        color: Colors.black, //change your color here
      ),
      elevation: 0,
      leadingWidth: 10,
      backgroundColor: Color(ColorValues.RED),
      automaticallyImplyLeading: false,
      title: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon_button==true?
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 25,
                color: Colors.white,
              )):
              SizedBox(),
          Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w500,
                fontFamily: 'Lato',
              ),
            ),
          ),
        ],
      ),
    );
