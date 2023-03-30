import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text.dart';
import '../controllers/contect_us_controller.dart';

class ContectUsView extends GetView<ContectUsController> {
  const ContectUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Appbaar(
                screen_name: 'Contect Us'.toUpperCase(),
                Search_ontap: (){

                },
                Back_ontap: (){
                  Get.back(

                  );

                },

              ),
              SizedBox(
                height: 20,
              ),
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
                          GlobalLocalText(text: 'Call Us On Toll Free Number',fontWeight: FontWeight.bold,size: 17,),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Flexible(child: GlobalLocalText(text: "Please Contect",fontWeight: FontWeight.w300,)),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                "857845",
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
                          GlobalLocalText(text: "Foren Quiry And Feedback",fontWeight: FontWeight.w300,),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "helpdesk.ttd@tirumala.org",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.red),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GlobalLocalText(text: "Foren Quiry And Feedback",fontWeight: FontWeight.w300,),

                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "refundservices.ttd@tirumala.org",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: Colors.red),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GlobalLocalText(text: "Foren Quiry And Feedback",fontWeight: FontWeight.w300,),

                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "refundservices.ttd@tirumala.org",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 13),
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
