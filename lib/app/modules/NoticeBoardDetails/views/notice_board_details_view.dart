import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../../../utils/global_widgets/textEnter.dart';
import '../controllers/notice_board_details_controller.dart';

class NoticeBoardDetailsView extends GetView<NoticeBoardDetailsController> {
  const NoticeBoardDetailsView({Key? key}) : super(key: key);

  static bool isDark(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
  @override
  Widget build(BuildContext context) {
    var color1 = (isDark(context) ? Colors.white : Colors.black).obs;

    return Scaffold(
        appBar: appbar(title: 'Notice Board Details'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                 SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child:
                    Text('${controller.text}',style: TextStyle(color: Colors.red)),

                 ),
                SizedBox(
                  height: 10,
                ),


                Padding(

                  padding: const EdgeInsets.only(left: 10.0,right: 10),
                  child: TextFieldShowCOLOR(
                    textAlign: TextAlign.justify,
                    color: color1.value,
                     maxLines: 100,
                     fontsize: 16.0,
                    text: '${controller.Description}',
                    height: 1.5,
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Roboto',
                  ),
                ),



              ],),
          ),
        )
    );
  }
}
