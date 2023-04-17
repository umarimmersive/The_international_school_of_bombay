import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/schedule_screen_controller.dart';

class ScheduleScreenView extends GetView<ScheduleScreenController> {
  const ScheduleScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Schedule',icon_button: false),
        body: ScrollableCleanCalendar(


          calendarController: controller.calendarController,
          layout: Layout.BEAUTY,

          calendarCrossAxisSpacing: 0,
        ));
  }
}
