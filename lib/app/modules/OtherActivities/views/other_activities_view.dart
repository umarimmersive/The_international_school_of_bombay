import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/other_activities_controller.dart';

class OtherActivitiesView extends GetView<OtherActivitiesController> {
  const OtherActivitiesView({Key? key}) : super(key: key);
  @override

  /// A custom Path to paint stars.
  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi /180.0);

    const numberOfPoints = 30;
    final halfWidth = size.width /2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth /0.5;
    final degreesPerStep = degToRad(800 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 0.5;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: 'Other Activities'),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                 child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.headings.length,
                    itemBuilder: (BuildContext, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: InkWell(
                          onTap: () {
                            if (index == 0) {
                              controller.controllerTopCenter.play();
                            }

                            if (index == 0) {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Image.asset(
                                            controller.imagesdemo[index],
                                            fit: BoxFit.cover,
                                          ),
                                          ConfettiWidget(
                                             numberOfParticles: 20,
                                            confettiController:
                                                controller.controllerTopCenter,
                                            blastDirectionality: BlastDirectionality
                                                .explosive, // don't specify a direction, blast randomly
                                            shouldLoop: false, //
                                            // start again as soon as the animation is finished
                                            colors: const [
                                              Colors.green,
                                              Colors.blue,
                                              Colors.pink,
                                              Colors.orange,
                                              Colors.purple,
                                              Colors.amber
                                            ], // manually specify the colors to be used
                                            createParticlePath:
                                                drawStar, // define a custom shape/path.
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            } else if (index == 1) {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  backgroundColor: Colors.white,
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Image.asset(
                                            controller.imagesdemo[index],
                                            fit: BoxFit.cover,
                                          ),
                                          ConfettiWidget(
                                            confettiController:
                                                controller.controllerTopCenter,
                                            blastDirectionality: BlastDirectionality
                                                .explosive, // don't specify a direction, blast randomly
                                            shouldLoop: false, //
                                            // start again as soon as the animation is finished
                                            colors: const [
                                              Colors.green,
                                              Colors.blue,
                                              Colors.pink,
                                              Colors.orange,
                                              Colors.purple,
                                              Colors.amber,
                                              Colors.red
                                            ], // manually specify the colors to be used
                                            createParticlePath:
                                                drawStar, // define a custom shape/path.
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            } else if(index==2){
                              Get.toNamed("/notification");


                            }
                          },
                          child: Card(
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                          backgroundColor:
                                              Color(ColorValues.RED),
                                          child: Icon(
                                            Icons.border_inner_rounded,
                                            color: Colors.white,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      GlobalLocalText(
                                        text: controller.headings[index],
                                        size: 17.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      )
                                    ],
                                  ),
                                  Card(
                                      color: Colors.white60,
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                          size: 18,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
             ],
          ),
        ],
      ),
    );
  }
}
