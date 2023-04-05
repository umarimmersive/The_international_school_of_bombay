import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/other_activities_controller.dart';

class OtherActivitiesView extends GetView<OtherActivitiesController> {
  const OtherActivitiesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar('Other Activities'),
        body: Column(
          children: [
            SizedBox(height: 142,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.headings.length,
                  itemBuilder: (BuildContext, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: InkWell(
                        onTap: () {
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
                                  child: Image.asset(
                                    controller.imagesdemo[index],
                                    fit: BoxFit.cover,
                                  ),
                                );
                              });
                        },
                        child: Card(
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor: Color(ColorValues.RED),
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
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed("/notification");
                },
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Color(ColorValues.RED),
                                child: Icon(
                                  Icons.border_inner_rounded,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            GlobalLocalText(
                              text: "Notification",
                             // text: controller.headings[index],
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
            ),
          ],
        ));
  }
}
