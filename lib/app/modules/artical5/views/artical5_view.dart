import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/artical5_controller.dart';

class Artical5View extends GetView<Artical5Controller> {
  const Artical5View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar('Artical'),
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                      "Tackling education challenges – scaling up pioneering projects",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),


                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/images/WISE-Scaling-up.jpg")),
                ),
                SizedBox(height: 15,),

                Text(
                  textAlign: TextAlign.justify,
                  "What would you say is the most pressing challenge in your own school? The answer, of course, will vary depending on school context, location, and student, staff and community needs. Around the world, stakeholders are coming together to find solutions to key education challenges and scale them up across regions, countries and continents."

                ),



                SizedBox(height:6,),


                Text(
                  textAlign: TextAlign.justify,
                  "Each year the World Innovation Summit for Education (WISE) Awards recognise pioneering projects that are having an impact on the ground. The recipients for 2022 were announced last month and include several projects that are making a difference to students, teachers, leaders and communities in India. Here, we look at"



                ),


                SizedBox(height: 6,),






              ],
            ),
          ),
        ));
  }
}
