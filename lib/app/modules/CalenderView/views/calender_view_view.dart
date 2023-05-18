//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import '../controllers/calender_view_controller.dart';
//
// class CalendarScreen extends StatelessWidget {
//   final CalendarController controller;
//
//   const CalendarScreen({Key? key, required this.controller}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Calendar'),
//       ),
//       body: SafeArea(
//         child: Obx(
//               () {
//             if (controller.events.isEmpty) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else {
//               return SfCalendar(
//                 view: CalendarView.month,
//                 dataSource: _getCalendarDataSource(controller.events),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//   CalendarDataSource _getCalendarDataSource(List<Event> events) {
//     final List<Meeting> appointments = events
//         .map((event) => Meeting(
//       eventName: event.title,
//       description: event.description,
//     ))
//         .toList();
//     return CalendarDataSource(appointments);
//   }
// }
//
// class Meeting {
//   final String eventName;
//   final String description;
//
//   Meeting({required this.eventName, required this.description});
// }
//
// class CalendarDataSource extends CalendarDataSource {
//   CalendarDataSource(List<Appointment> source)
