import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/routes/app_pages.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/busroot_screen_controller.dart';

class BusrootScreenView extends GetView<BusrootScreenController> {
  const BusrootScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Bus Routes'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                      itemCount: controller.rootname.length,
                      itemBuilder: (BuildContext, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.BUSROOT_DETAILS);
                    },
                    child: Card(
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.rootname[index],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            Card(
                              margin: EdgeInsets.zero,
                              child: Icon(Icons.arrow_right_alt,color: Colors.red,),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }))
            ],
          ),
        ));
  }
}
