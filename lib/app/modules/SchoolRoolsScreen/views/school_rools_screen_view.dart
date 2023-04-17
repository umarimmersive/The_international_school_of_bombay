import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/school_rools_screen_controller.dart';

class SchoolRoolsScreenView extends GetView<SchoolRoolsScreenController> {
  const SchoolRoolsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'School Rules'),
        body:
        Obx((){
          if(controller.isLoading.isTrue){
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          }else{
            return  Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10,bottom: 15),
              child:
              Html(
                  data: "${controller.content.value}",
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
                    "p": Style(color: Colors.black,fontSize: FontSize.large),
                  }
              ),
              /*TextFieldShowCOLOR(
                      textAlign: TextAlign.justify,
                      maxLines: 100,
                      color: color1.value,
                      fontsize: 16.0,
                      text: '${controller.Slider_details[0].content}',
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                    ),*/
            );
          }
        }


    ));
  }
}
