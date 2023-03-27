import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
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
                  screen_name: 'About'.toUpperCase(),
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
                  maxLines: 1000,
                  color: ColorValues.BLACK_TEXT,
                  fontSize: 16.0,
                  Simpletext: 'A data-enabled and technology-driven Educational Products and Services Company, Careers360 seamlessly integrates millions of student and institutional data points with the user-generated preferences of its more than 15 million+ monthly visitors, to build sophisticated Prediction and Recommendation products for the students to explore and achieve career plans, based on their interests and abilities.',
                  height: 1.2,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Roboto',
                ),
              ),
            ],),
        )
    );
  }
}
