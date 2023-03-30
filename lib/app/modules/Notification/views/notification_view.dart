import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Appbaar(
                screen_name: 'NOTIFICATION'.toUpperCase(),
                Back_ontap: (){
                  Get.back();
                },
              ),
              SizedBox(
                height: 20,
              ),

            ],),
        )
    );
  }
}
