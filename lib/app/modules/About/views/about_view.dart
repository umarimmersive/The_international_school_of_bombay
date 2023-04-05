import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('About'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                  child: Text_widget(
                    maxLines: 1000,
                    color: ColorValues.BLACK_TEXT,
                    fontSize: 16.0,
                    Simpletext: '${controller.About_text}',
                    height: 1.2,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 5.0,right: 5),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset('assets/gp.png',fit: BoxFit.contain),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                  child: Text_widget(
                    maxLines: 1000,
                    color: ColorValues.BLACK_TEXT,
                    fontSize: 16.0,
                    Simpletext: '${controller.About_text2}',
                    height: 1.2,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                  child: Text_widget(
                    maxLines: 1000,
                    color: ColorValues.BLACK_TEXT,
                    fontSize: 16.0,
                    Simpletext: '${controller.About_text2}',
                    height: 1.2,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5.0,right: 5),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset('assets/qr_code.png',fit: BoxFit.contain),
                  ),
                ),

              ],),
          ),
        )
    );
  }
}
