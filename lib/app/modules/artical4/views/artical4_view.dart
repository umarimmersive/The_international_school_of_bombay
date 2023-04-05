import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/artical4_controller.dart';

class Artical4View extends GetView<Artical4Controller> {
  const Artical4View({Key? key}) : super(key: key);
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
                      "Students’ innovative solutions to global sustainability issues",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 10,
                ),


                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/images/image_2023_03_31T17_48_49_093Z.png")),
                ),
                SizedBox(height: 15,),

                Text(
                  textAlign: TextAlign.justify,
                  "Six high schools from across the world have been named winners of the 2023 Zayed Sustainability Prize for their innovative solutions to sustainability issues and will take home their share of a US 600,000 prize pool to begin or continue their work.",

                 ),



                SizedBox(height:6,),


                Text(
                  textAlign: TextAlign.justify,
                  "The Zayed Sustainability Prize was launched in 2008 by H.H. Sheikh Mohamed bin Zayed Al Nahyan, President of the United Arab Emirates, and is a tribute to the late Sheikh Zayed bin Sultan Al Nahyan’s legacy of humanitarianism and commitment to sustainability.",



                ),


                SizedBox(height: 6,),






              ],
            ),
          ),
        ));
  }
}
