import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

import '../../../models/calender_events_list_model.dart';
import '../../../utils/constants/api_service.dart';
import '../../../utils/constants/toast.dart';
import '../views/schedule_screen_view.dart';

class ScheduleScreenController extends GetxController {
  //TODO: Implement ScheduleScreenController

  final count = 0.obs;
  final eventName = ''.obs;
  final eventDate = ''.obs;
  // Color eventColor = Color().obs;

  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    //onRangeSelected: (firstDate, secondDate) {},
    //onDayTapped: (date) {},
    // readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},

    weekdayStart: DateTime.monday,
     initialFocusDate: DateTime.now(),
    // initialDateSelected: DateTime(2022, 3, 15),
    // endDateSelected: DateTime(2022, 3, 20),
  );


  // final eventList = <Eventlistmodel>[
  //   Eventlistmodel(event_name: 'event 1',date: DateTime(23,5,8),bg: Colors.red),
  //   Eventlistmodel(event_name: 'event 2',date: DateTime(23,6,12),bg: Colors.red),
  //   Eventlistmodel(event_name: 'event 3',date: DateTime(23,7,18),bg: Colors.red),
  //   Eventlistmodel(event_name: 'event 4',date: DateTime(23,8,23),bg: Colors.red),
  //   Eventlistmodel(event_name: 'event 5',date: DateTime(23,9,28),bg: Colors.red),
  //   Eventlistmodel(event_name: 'event 6',date: DateTime(23,10,11),bg: Colors.red),
  // ].obs;

  // RxList event_list = <CalendarEvent>[].obs;

  @override
  void onInit() {
    super.onInit();
    // onInitfor(int i=0;i<eventList.value.length; i++) {
    //   print("eventList ==  $i");
    //   eventName.value = eventList[i].event_name.toString();
    //   eventDate.value = eventList[i].date.toString();
    //
    //   print("event Name ==  ${eventName.value}");
    //   print("event Date ==  ${eventName.value}");
    // };
    Calender_Event_list();
    // fetchEvents();

  }

  //   RxMap events = {
  //     DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2) : [
  //     CleanCalendarEvent('Event A', startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //         DateTime.now().day, 10, 0),
  //         endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day, 12, 0),
  //         description: 'A special event',
  //         color: Colors.blue.shade700),
  //   ],
  //
  //   DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2): [
  //     CleanCalendarEvent('Event B',
  //         startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 2, 10, 0),
  //         endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 2, 12, 0),
  //         color: Colors.orange),
  //     CleanCalendarEvent('Event C',
  //         startTime: DateTime(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 2, 14, 30),
  //         endTime: DateTime(DateTime.now().year, DateTime.now().month,
  //             DateTime.now().day + 2, 17, 0),
  //         color: Colors.pink),
  //   ],
  // }.obs;


  final Event_list = <CalendarEvent>[].obs;
  final isLoading_Calender_Event=false.obs;

  Future Calender_Event_list() async {

    print("Calender_Event_list api========== = = = = =  = =");
    try {
      isLoading_Calender_Event(true);
      // Adv_list.clear();
      var response = await ApiService().CalenderEventsList();
      if (response['status'] == true) {
        // Toast.show(response['message'].toString());
        print('responce---------responce-----------responce  ${response}');

        List dataList = response['event'].toList();
        Event_list.value = dataList.map((json) => CalendarEvent.fromJson(json)).toList();
        print( "event_list.value === === == jaydeeeeeeeep ${Event_list.value.length}");

        update();
      } else if (response['status'] == false) {
        Toast.show(response['message'].toString());
        isLoading_Calender_Event(false);
      }
    } catch(e) {

      print("Exeption =====$e");
      isLoading_Calender_Event(false);

    }
  }

  // Future<List<dynamic>> fetchEvents() async {
  //   final response = await await ApiService().CalenderEventsList();
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     event_list = jsonData['event'];
  //     return jsonData['event'];
  //   } else {
  //     throw Exception('Failed to fetch events');
  //   }
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}


class Event {
  final String title;
  final String description;

  Event(this.title, this.description);
}