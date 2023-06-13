import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

 import '../../../utils/global_widgets/Text.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/contect_us_controller.dart';

class ContectUsView extends GetView<ContectUsController> {
   ContectUsView({Key? key}) : super(key: key);

  final Uri params = Uri(
    scheme: 'mailto',
    path: 'theisb.in@gmail.com',
    query: 'subject=App Feedback&body=App', //add subject and body here
  );

   void _sendEmail(){
     final Uri emailLaunchUri = Uri(
       scheme: 'mailto',
       path: 'theisb.in@gmail.com',
       // queryParameters: {
       //   'subject': 'CallOut user Profile',
       //   'body': "jay" ?? ''
       // },
     );
     launchUrl(emailLaunchUri);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: 'Contact Us'),
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
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [

                              InkWell(
                                onTap: (){
                                  launch("tel://07314959955");
                                },
                                child: Text(
                                  "0731-4959955",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                              Text(
                                ", ",
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              InkWell(
                                onTap: (){
                                  launch("tel://9329919483");
                                },
                                child: Text(
                                  "9329919483",
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
                          InkWell(
                            onTap: ()  {
                              _sendEmail();
                            },
                            child: Text(
                              "theisb.in@gmail.com",
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.red),
                            ),
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
