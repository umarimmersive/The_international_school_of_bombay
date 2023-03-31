import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/routes/app_pages.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/textEnter.dart';
import '../controllers/assignment_controller.dart';

class AssignmentView extends GetView<AssignmentController> {
  const AssignmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Assigment'),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             /* Appbaar(
                screen_name: 'Assignment'.toUpperCase(),
                Back_ontap: (){
                  Get.back();
                },
              ),
              SizedBox(
                height: 20,
              ),*/
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: (){
                        var data={
                          "title":controller.data[i]['title'].toString()
                        };
                        Get.toNamed(Routes.PDF_VIEW,parameters: data);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 00.0,vertical: 05),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: Text_widget(
                                          color: ColorValues.BLACK_TEXT,
                                          fontSize: 16.0,
                                          Simpletext: '${controller.data[i]['title']}',                                              height: 1.0,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0,top: 8),
                                        child: Text_widget(
                                          color: ColorValues.BLACK_TEXT,
                                          fontSize: 12.0,
                                          Simpletext: '${controller.data[i]['date']}',
                                          height: 1.0,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),

                                    ],
                                  ),
                                ),

                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: (){
                                     // Get.toNamed(Routes.NOTICE_BOARD_DETAILS);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: const Color(ColorValues.RED),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                            size: 18.0,
                                            semanticLabel: 'Text to announce in accessibility modes',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Divider(
                                height: 2,
                                color: ColorValues.DIVIDER_COLOR_ONE,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )

            ],),
        )
    );
  }
}
