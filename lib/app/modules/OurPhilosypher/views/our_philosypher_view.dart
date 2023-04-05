import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/our_philosypher_controller.dart';

class OurPhilosypherView extends GetView<OurPhilosypherController> {
  const OurPhilosypherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar('Our Philosypher'),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: controller.heading.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text_widget(
                              color: HexColor(controller.colors[index]),
                              fontSize: 14.0,
                              Simpletext: controller.heading[index].toUpperCase(),
                              height: 1.0,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Roboto',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(controller.content[index],
                              textAlign: TextAlign.justify,

                            ),
                            SizedBox(
                              height:5,
                            ),
                            Center(
                              child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  shadowColor: Colors.black,
                                  elevation: 5,
                                  margin: EdgeInsets.zero,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(controller.images[index]))),
                            ),
                            SizedBox(height: 15,)
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}