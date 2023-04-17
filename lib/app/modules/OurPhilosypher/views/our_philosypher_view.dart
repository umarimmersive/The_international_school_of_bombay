import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/our_philosypher_controller.dart';

class OurPhilosypherView extends GetView<OurPhilosypherController> {
  const OurPhilosypherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Our Philosopher'),

        body: Obx((){
          if(controller.isLoading.isTrue){
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          }else{
            return  SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [

                    Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Html(
                          data: "${controller.OurPhilosypher_content.toString()}",

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
                          },
                      ),
                    )
                  ],
                ),
              ),
            );

            /* Expanded(
                    child: ListView.builder(
                        itemCount: controller.heading.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text_widget(
                                  color: HexColor(controller.colors[index]),
                                  fontSize: 14.0,
                                  Simpletext: controller.heading[index].toUpperCase(),
                                  height: 1.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Roboto',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(controller.content[index],
                                  textAlign: TextAlign.justify,

                                ),
                                SizedBox(
                                  height:5,
                                ),
                                Center(
                                  child: Card(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                      shadowColor: Colors.black,
                                      elevation: 5,
                                      margin: EdgeInsets.zero,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.asset(controller.images[index]))),
                                ),
                                SizedBox(height: 15,)
                              ],
                            ),
                          );
                        }),
                  )*/
          }
        }

        ));
  }
}