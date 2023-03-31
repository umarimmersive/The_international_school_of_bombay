import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';

// Note : photo video app bar worked diffrently
AppBar appbar(String title) => AppBar(
      iconTheme: IconThemeData(
        size: 0,
        color: Colors.black, //change your color here
      ),
      elevation: 0,
      leadingWidth: 30,
      backgroundColor: Color(ColorValues.RED),
      automaticallyImplyLeading: false,
      title: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Center(
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
            ),
          ),
        ],
      ),
    );
