import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/artical3_controller.dart';

class Artical3View extends GetView<Artical3Controller> {
  const Artical3View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Artical'),
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign:TextAlign.justify,
                  "Implementing a Global Citizenship Education program in your school",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 15,
                ),


                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/images/Implementing-global-citizenship-education.jpg")),
                ),
                SizedBox(height: 15,),

                Text(
                    textAlign: TextAlign.justify,
                  "Global Citizenship Education (GCED) is one of the targets of the United Nations Sustainable Development Goal 4. In India, the National Education Policy 2020 recognises the need to integrate GCED into school curricula and pedagogies.",
                 ),



                SizedBox(height:6,),


                Text(
                    textAlign: TextAlign.justify,
                  "Ashok Pandey, former Director, Ahlcon Group of Schools has been directly working with private schools in India to explore practical ways of implementing GCED. He believes that working on the SDGs is valuable for preparing students for future careers as sustainable development is deeply intertwined with business objectives of the 21st century.",


                ),


                SizedBox(height: 6,),

                Text(
                    textAlign: TextAlign.justify,
                  "At Ahlcon, Pandey organised the first SDG festival on 25 September 2017, and since then the school celebrates the anniversary of the adoption of SDGs every year. Last year, more than 70 schools participated in the event to discover ways of promoting SDGs in schools, including GCED."


                )





              ],
            ),
          ),
        ));
  }
}
