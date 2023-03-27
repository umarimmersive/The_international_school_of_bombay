import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/Text_widget.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../controllers/hoppiness_controller.dart';

class HoppinessView extends GetView<HoppinessController> {
  const HoppinessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Appbaar(
                  screen_name: 'Hoppiness'.toUpperCase(),
                  Back_ontap: (){
                    Get.back();
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text_widget(
                  color: ColorValues.BLACK_TEXT,
                  fontSize: 12.0,
                  Simpletext: '',
                  height: 1.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
            ],),
        )
    );
  }
}
