


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';

import 'Text_widget.dart';

class Appbaar extends StatelessWidget {
  final screen_name;
  final hide_manu;
  final hide_backButton;
  Function()? Notification_ontap;
  Function()? Search_ontap;
  Function()? Back_ontap;

   Appbaar({Key? key,this.screen_name,this.Notification_ontap,this.Search_ontap,this.Back_ontap,this.hide_manu,this.hide_backButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
          children: <Widget>[
            Expanded(
             flex: 1,
             child: GestureDetector(
               onTap: Back_ontap,
               child: Padding(
                 padding: const EdgeInsets.all(1.0),
                 child: Container(
                   height: 30,
                   decoration: BoxDecoration(
                     color: const Color(ColorValues.BLACK_COLOR),
                     borderRadius: BorderRadius.circular(5),
                   ),
                   child: Center(
                     child: Icon(
                       Icons.arrow_back,
                       color: Colors.white,
                       size: 18.0,
                       semanticLabel: 'Text to announce in accessibility modes',
                  ),
                 ),
           ),
               ),
             ),
           ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Container(
                  child: Text_widget(
                    color: ColorValues.BLACK_TEXT,
                    fontSize: 18.0,
                    Simpletext: '${screen_name}',
                    height: 1.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
            ),
            hide_manu==true?
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap:()=> Search_ontap,
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
            ):
            Expanded(
              flex: 1,
                child: Container()),
            hide_manu==true?
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap:()=> Notification_ontap,
                child: Icon(
                   Icons.notifications_none,
                  color: Colors.black,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
              ),
            ):
            Expanded(
                flex: 1,
                child: Container()),
      ]),
    );
  }
}
