import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    var htmlcolore = (isDark(context) ? Colors.white : Colors.black).obs;
    return Scaffold(
        appBar: appbar(title: 'Notice Board Details'),
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
                        Text('${controller.Noticebord_list[0].title}',style: TextStyle(color: Colors.red,fontSize: 18)),

                      ),
                      SizedBox(
                        height: 10,
                      ),


                     /* Padding(

                        padding: const EdgeInsets.only(left: 10.0,right: 10),
                        child: TextFieldShowCOLOR(
                          textAlign: TextAlign.justify,
                          color: color1.value,
                          maxLines: 100,
                          fontsize: 16.0,
                          text: '${controller.Noticebord_list[0].content}',
                          height: 1.5,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Roboto',
                        ),
                      ),*/

                      Padding(
                        padding: EdgeInsets.only(left: 0,right: 0),
                        child: Html(
                          data: "${controller.Noticebord_list[0].content}",

                          style: {
                            "img": Style(
                                width: Width.auto(),
                                height: Height.auto()
                            ),
                            // tables will have the below background color
                            "table": Style(
                              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                            ),
                            // some other granular customizations are also possible
                            "tr": Style(
                              border: Border(bottom: BorderSide(color: Colors.grey)),
                            ),
                            "th": Style(
                              padding: EdgeInsets.all(6),
                              backgroundColor: Colors.grey,
                            ),
                            "td": Style(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.topLeft,
                            ),
                            // text that renders h1 elements will be red
                            "p": Style(color:htmlcolore.value,fontSize: FontSize.xLarge,alignment: Alignment.center),
                          },
                        ),
                      )

                    ],),
                ),
              );

          }
        })


    );
  }
}
