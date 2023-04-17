import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/api_service.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../../../utils/global_widgets/textEnter.dart';
import '../controllers/home_slider_details_controller.dart';

class HomeSliderDetailsView extends GetView<HomeSliderDetailsController> {
  const HomeSliderDetailsView({Key? key}) : super(key: key);
  static bool isDark(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
  @override
  Widget build(BuildContext context) {
    var color = (isDark(context) ? Color(0xFF414040) : Colors.white).obs;
    var color1 = (isDark(context) ? Colors.white : Colors.black).obs;
    return  Scaffold(
          appBar: appbar(title: 'Details'),
          body:
          Obx((){
            if(controller.isLoading.isTrue){
              return Center(
                  child: SpinKitThreeBounce(
                    color: Colors.red,
                    size: 40,
                  ));
            }else{
              return SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10),
                        child: TextFieldShowCOLOR(
                          textAlign: TextAlign.justify,
                          color: color1.value,
                          // maxLines: 100,
                          fontsize: 18.0,
                          text: '${controller.Slider_details[0].title}',
                          //height: 1.5,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    ApiService.IMAGE_URL+controller.Slider_details[0].image!,
                                    fit: BoxFit.cover,
                                  )))),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10,bottom: 15),
                        child:
                        Html(
                            data: "${controller.Slider_details[0].content}",
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
                      ),
                    ],
                  ),
                ),
              );
            }
          }
    ));
  }
}
