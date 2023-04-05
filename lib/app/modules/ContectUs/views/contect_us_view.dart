import 'package:flutter/material.dart';

import 'package:get/get.dart';

 import '../../../utils/global_widgets/Text.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/contect_us_controller.dart';

class ContectUsView extends GetView<ContectUsController> {
  const ContectUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Contact Us'),
        body: SafeArea(
          child: Column(
            children: [

              SizedBox(
                height: 20,
              ),/* Appbaar(
                screen_name: 'Contect Us'.toUpperCase(),
                Search_ontap: (){

                },
                Back_ontap: (){
                  Get.back(

                  );

                },

              ),*/
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalLocalText(text: 'Call us for inquiries',fontWeight: FontWeight.bold,size: 17,),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Flexible(child: GlobalLocalText(text: "Please Contact",fontWeight: FontWeight.w300,)),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "07314959955",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GlobalLocalText(text: 'Email-ID',size: 17,fontWeight: FontWeight.bold,),
                          SizedBox(
                            height: 20,
                          ),
                          GlobalLocalText(text: "For any Query And Feedback",fontWeight: FontWeight.w300,),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "theisb.in@gmail.com",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.red),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
