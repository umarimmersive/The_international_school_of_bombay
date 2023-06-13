import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/constants/api_service.dart';
import '../../../utils/global_widgets/globle_var.dart';
import '../../../utils/global_widgets/textEnter.dart';
import '../controllers/events_controller.dart';

class EventsView extends GetView<EventsController> {
  const EventsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var htmlcolore = (isDark(context) ? Colors.white : Colors.black).obs;
    var color1 = (isDark(context) ? Colors.white : Colors.red).obs;
    return Scaffold(
     // appBar: appbar(title: 'Events'),
      body: SafeArea(
        child:  Obx((){
          if(controller.isLoading.isTrue){
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          }else{
            return SafeArea(
              child: Column(

                children: [
                  Container(
                    color: ColorValues.kRedColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5,bottom: 5),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){
                            Get.back();
                          }, icon: Icon(Icons.arrow_back),color: Colors.white,),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10),
                              child: TextFieldShowCOLOR(


                                textAlign: TextAlign.start,
                                color: Colors.white,
                                //color: color1.value,
                                // maxLines: 100,
                                fontsize: 18.0,
                                text: '${controller.EventDetails[0].title}',
                                //height: 1.5,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[




                          SizedBox(
                            height: 10,
                          ),

                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        ApiService.IMAGE_URL+controller.EventDetails[0].image!,
                                        fit: BoxFit.cover,
                                      )))),

                          SizedBox(
                            height: 05,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, right: 10,bottom: 15),
                            child:
                            Html(
                                data: "${controller.EventDetails[0].content}",
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
                                  "p": Style(color: htmlcolore.value,fontSize: FontSize(16)),
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
                          ),
                        ],
                      ),

                    ],),
                  )

                ],
              ),
            );
          }
        }
        )
      ),
    );
  }
}
