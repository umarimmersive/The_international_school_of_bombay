import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/campus_controller.dart';

class CampusView extends GetView<CampusController> {
  const CampusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Campuses'),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.logo.length,
                  itemBuilder: (BuildContext, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Card(
                        elevation: 3,
                        margin: EdgeInsets.zero,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Center(child: Image.asset(controller.logo[index],height: 200,)),
                              Divider(height: 0,thickness: 2,color: ColorValues.DIVIDER_COLOR_ONE,),
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10,top: 20),
                                child: Text(controller.heading[index].toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,fontSize:19,),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
                                child: Text(controller.address[index].toUpperCase()),
                              ),
                              Divider(thickness: 1,),
                              InkWell(
                                highlightColor: ColorValues.BG_BT2,

                                onTap: (){
                                   launchUrl(Uri.parse(controller.url[index]));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Explore More",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                                      Icon(Icons.arrow_right_alt_outlined)
                                    ],),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
