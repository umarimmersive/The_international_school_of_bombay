import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../../../utils/global_widgets/textEnter.dart';
import '../controllers/home_slider_details_controller.dart';

class HomeSliderDetailsView extends GetView<HomeSliderDetailsController> {
  const HomeSliderDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
         appBar: appbar('Details'),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 200,
                        width: double.infinity,
                        child: Image.asset('${controller.images.value}',fit: BoxFit.contain,))


                    /*  Text_widget(
                      color: ColorValues.BLACK_TEXT,
                      fontSize: 12.0,
                      Simpletext: '${controller.text}',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),*/
                  ),
                  SizedBox(
                    height: 10,
                  ),


                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFieldShowCOLOR(
                      maxLines: 100,
                      color: ColorValues.BLACK,
                      fontsize: 16.0,
                      text: '${controller.title.value}',
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                    ),
                  ),



                ],),
            ),
          )
      ),
    );
  }
}
