import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/notice_board_controller.dart';

class NoticeBoardView extends GetView<NoticeBoardController> {
  const NoticeBoardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Noticeboard'),
        body:
        Obx(() {
          if (controller.isLoading.isTrue) {
            return Scaffold(
              body: Center(
                  child: SpinKitThreeBounce(
                    color: Colors.red,
                    size: 40,
                  )),
            );
          } else {
            return
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   /* SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text_widget(
                        fontSize: 12.0,
                        Simpletext: '${controller.text}',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),*/
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListView.builder(
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.Noticebord_list.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: (){
                              var data={
                                'id': controller.Noticebord_list[i].id.toString(),
                                'title': controller.Noticebord_list[i].title.toString()
                              };
                              Get.toNamed(Routes.NOTICE_BOARD_DETAILS,parameters: data);

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
                                                fontSize: 16.0,
                                                Simpletext: '${controller.Noticebord_list[i].title}',                                              height: 1.0,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10.0,top: 8),
                                              child: Text_widget(
                                                fontSize: 12.0,
                                                Simpletext: '${controller.Noticebord_list[i].date!+' at '+controller.Noticebord_list[i].time!}',
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
              );

          }
        })


    );
  }
}
