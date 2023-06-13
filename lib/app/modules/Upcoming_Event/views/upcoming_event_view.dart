import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/api_service.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/upcoming_event_controller.dart';

class UpcomingEventView extends GetView<UpcomingEventController> {
  const UpcomingEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Upcoming Event'),
        body:
        Obx((){
          if(controller.isLoading.isTrue){
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          }else{
            return  SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),

                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.upcoming_event.length,
                        itemBuilder: (BuildContext, index) {
                          return InkWell(
                            onTap: () {
                              var data = {
                                'id': controller.upcoming_event[index].id.toString(),
                              };
                              Get.toNamed(Routes.EVENTS, parameters: data);
                              print('jaydeeep=============');
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              child: Card(
                                elevation: 3,
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Center(child: Image.network(ApiService.IMAGE_URL+controller.upcoming_event[index].image!,height: 300,)),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5.0,left: 10,right: 10),
                                        child: Divider(height: 0,thickness: 2,color: ColorValues.DIVIDER_COLOR_ONE,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                                        child: Text_widget(Simpletext: controller.upcoming_event[index].title!,fontWeight: FontWeight.bold,fontSize:19.0,),),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 10,top: 0),
                                        child: Text_widget(
                                          maxLines: 2,
                                          Simpletext:controller.upcoming_event[index].eventDate!, fontSize: 16.0,),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ],),
            );
          }
        }
        )


    );
  }
}
