import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/Text.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: 'Notification'),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off,
              color: Colors.red,
              size: 50,
            ),
            SizedBox(height: 2,),
            Text("No notification found",style: TextStyle(fontWeight: FontWeight.w300),)
          ],
        ),
      ),
    );
   }
}
