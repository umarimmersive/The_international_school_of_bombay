import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: 'About'),
        body:
        Obx((){
          if(controller.isLoading.isTrue){
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          }else{
            return SingleChildScrollView(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
    children: [

                 Padding(
    padding: EdgeInsets.only(left: 10,right: 10),
    child: Html(
    data: "${controller.about_us_content.toString()}",
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
    "p": Style(color: Colors.black,fontSize: FontSize.medium),
    }
    ),
    )
    ],
    ),
                 ),
            );
          }
        }

    ));
  }
}
