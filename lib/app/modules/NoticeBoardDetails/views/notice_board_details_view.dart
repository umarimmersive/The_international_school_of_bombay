import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/textEnter.dart';
import '../controllers/notice_board_details_controller.dart';

class NoticeBoardDetailsView extends GetView<NoticeBoardDetailsController> {
  const NoticeBoardDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Appbaar(
                screen_name: 'AN EXHIBIYION'.toUpperCase(),
                Back_ontap: (){
                  Get.back();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child:
                  Text('${controller.text}',style: TextStyle(color: Colors.red)),

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
                  text: '${controller.Description}',
                  height: 1.5,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'Roboto',
                ),
              ),



            ],),
        )
    );
  }
}
