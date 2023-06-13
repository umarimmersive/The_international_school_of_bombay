import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:the_international_school_of_bombay/app/models/Event_list_model.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/schedule_screen_controller.dart';

// class SheduleScreenView extends StatefulWidget {
//   const SheduleScreenView({Key? key}) : super(key: key);
//
//   @override
//   State<SheduleScreenView> createState() => _SheduleScreenViewState();
// }
//
// class _SheduleScreenViewState extends State<SheduleScreenView> {

class SheduleScreenView extends StatefulWidget {
  const SheduleScreenView({Key? key}) : super(key: key);

  @override
  State<SheduleScreenView> createState() => _SheduleScreenViewState();
}

class _SheduleScreenViewState extends State<SheduleScreenView> {

  final controller = Get.find<ScheduleScreenController>();


   @override
   Widget build(BuildContext context) {
     // final events = events;
     final cellCalendarPageController = CellCalendarPageController();
     return Scaffold(
       appBar: AppBar(
         backgroundColor: ColorValues.BG_BT2,
          automaticallyImplyLeading: false,
         centerTitle: false,
         title: Text('Calender',style: TextStyle(fontSize: 18),),
       ),
       body: CellCalendar(
         todayMarkColor: ColorValues.BG_BT2,

         cellCalendarPageController: cellCalendarPageController,
         events: [
           for(int i = 0; i<controller.Event_list.value.length; i++)
           CalendarEvent(

             eventBackgroundColor: Colors.redAccent,
               eventName: controller.Event_list.value[i].title.toString(),
               eventDate: DateTime.parse(controller.Event_list.value[i].date.toString()),
               eventTextStyle: TextStyle(
                 color: Colors.white,
                 fontSize:12
               )
           ),
         ],
         daysOfTheWeekBuilder: (dayIndex) {
           final labels = ["S", "M", "T", "W", "T", "F", "S"];
           return Padding(
             padding: const EdgeInsets.only(bottom: 4.0),
             child: Text(
               labels[dayIndex],
               style: const TextStyle(
                 fontWeight: FontWeight.bold,
               ),
               textAlign: TextAlign.center,
             ),
           );
         },
         monthYearLabelBuilder: (datetime) {
           final year = datetime!.year.toString();
           final month = datetime.month.monthName;
           return Padding(
             padding: const EdgeInsets.symmetric(vertical: 4),
             child: Row(
               children: [
                 const SizedBox(width: 16),
                 Text(
                   "$month  $year",
                   style: const TextStyle(
                     fontSize: 24,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 const Spacer(),
                 IconButton(
                   padding: EdgeInsets.zero,
                   icon: const Icon(Icons.calendar_today),
                   onPressed: () {
                     cellCalendarPageController.animateToDate(
                       DateTime.now(),
                       curve: Curves.linear,
                       duration: const Duration(milliseconds: 300),
                     );
                   },
                 )
               ],
             ),
           );
         },
         onCellTapped: (date) {
           final eventsOnTheDate = controller.Event_list.value.where((event) {
             final eventDate = DateTime.parse(event.date.toString());
             return eventDate.year == date.year && eventDate.month == date.month && eventDate.day == date.day;
           }).toList();
           showDialog(
               context: context,
               builder: (_) => AlertDialog(
                 title: Text("${date.month.monthName} ${date.day}"),
                 content: Column(
                   mainAxisSize: MainAxisSize.min,
                   children: eventsOnTheDate.map(
                         (event) => Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(4),
                       margin: const EdgeInsets.only(bottom: 12),
                       color: Colors.redAccent,
                       child: Text(
                         event.title.toString(),
                         style: TextStyle(
                           color: Colors.white
                         ),
                       ),
                     ),
                   )
                       .toList(),
                 ),
               ));
         },
         onPageChanged: (firstDate, lastDate) {
           /// Called when the page was changed
           /// Fetch additional events by using the range between [firstDate] and [lastDate] if you want
         },
       ),
     );
   }
}

// class SheduleScreenView extends GetView<ScheduleScreenController>{
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _selectedDay = DateTime.now();
//   Map<DateTime, List<dynamic>> _events = {};
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetchEvents().then((events) {
//   //     setState(() {
//   //       _events = events;
//   //     });
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Table Calendar with Events'),
//       ),
//       body: Column(
//         children: [
//           TableCalendar(
//             calendarFormat: _calendarFormat,
//             focusedDay: _selectedDay,
//             firstDay: DateTime(DateTime.now().year - 1),
//             lastDay: DateTime(DateTime.now().year + 1),
//             eventLoader: _events.values,
//             onFormatChanged: (format) {
//               setState(() {
//                 _calendarFormat = format;
//               });
//             },
//             onPageChanged: (selectedDay) {
//               setState(() {
//                 _selectedDay = selectedDay;
//               });
//             },
//           ),
//           // Display the events for the selected day
//           ...(_events[_selectedDay] ?? []).map((event) => Text(event.toString())),
//         ],
//       ),
//     );
//   }
//
//
//
// // final controller = Get.find<ScheduleScreenController>();
//
// //umer
// /*
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//       body: SfCalendar(
//         view: CalendarView.month,
//         dataSource: MeetingDataSource(_getDataSource()),
//         // by default the month appointment display mode set as Indicator, we can
//         // change the display mode as appointment using the appointment display
//         // mode property
//         monthViewSettings: const MonthViewSettings(
//             appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
//       ));
// }
// List<Meeting> _getDataSource() {
//   final List<Meeting> meetings = <Meeting>[];
//   final DateTime today = DateTime(2023,05,18);
//   final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
//   final DateTime endTime = startTime.add(const Duration(hours: 2));
//   meetings.add(Meeting(
//       'Conference', startTime, endTime, const Color(0xFF0F8644), false));
//   return meetings;
// }*/
//
// //     /// table calender with static events list ///
// //
// //      // List<CalendarEvent>  eventslist = [
// //      //   CalendarEvent(eventName: 'event 1',eventDate: DateTime.now(), eventTextStyle: TextStyle(color: Colors.red)),
// //      //   CalendarEvent(eventName: 'event 2',eventDate: DateTime(2023,6,5), eventTextStyle: TextStyle(color: Colors.black)),
// //      //   CalendarEvent(eventName: 'event 3',eventDate: DateTime(2023,7,5), eventTextStyle: TextStyle(color: Colors.black)),
// //      //   CalendarEvent(eventName: 'event 4',eventDate: DateTime(2023,8,5), eventTextStyle: TextStyle(color: Colors.black)),
// //      // ];
// //
// //   Map<DateTime, List<CleanCalendarEvent>> events = {
// //   DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2) : [
// //     CleanCalendarEvent('Event A', startTime: DateTime(DateTime.now().year, DateTime.now().month,
// //         DateTime.now().day, 10, 0),
// //         endTime: DateTime(DateTime.now().year, DateTime.now().month,
// //             DateTime.now().day, 12, 0),
// //         description: 'A special event',
// //         color: Colors.blue.shade700),
// //   ],
// //
// //   DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 2): [
// //     CleanCalendarEvent('Event B',
// //         startTime: DateTime(DateTime.now().year, DateTime.now().month,
// //             DateTime.now().day + 2, 10, 0),
// //         endTime: DateTime(DateTime.now().year, DateTime.now().month,
// //             DateTime.now().day + 2, 12, 0),
// //         color: Colors.orange),
// //     CleanCalendarEvent('Event C',
// //         startTime: DateTime(DateTime.now().year, DateTime.now().month,
// //             DateTime.now().day + 2, 14, 30),
// //         endTime: DateTime(DateTime.now().year, DateTime.now().month,
// //             DateTime.now().day + 2, 17, 0),
// //         color: Colors.pink),
// //   ],
// // };
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final cellCalendarPageController = CellCalendarPageController();
// //     return Scaffold(
// //       appBar: appbar(title: 'Schedule',icon_button: false),
// //       body: Column(
// //         mainAxisSize: MainAxisSize.max,
// //         children: <Widget>[
// //           Expanded(
// //             child: Container(
// //               child: Calendar(
// //                 startOnMonday: true,
// //                 weekDays: ['Mon', 'tue', 'wed', 'thu', 'Fri', 'Sat', 'Sun'],
// //                 events: events,
// //                 onRangeSelected: (range) =>
// //                     print('Range is ${range.from}, ${range.to}'),
// //                 onDateSelected: (date) => DateTime.now,
// //                 isExpandable: true,
// //                 eventDoneColor: Colors.green,
// //                 selectedColor: ColorValues.BG_BT2,
// //                 todayColor: Colors.blue,
// //                 eventColor: Colors.grey,
// //                 locale: 'de_DF',
// //                 todayButtonText: 'Heute',
// //                 // expandableDateFormat: 'EEEE, dd. MMMM yyyy',
// //                 dayOfWeekStyle: TextStyle(
// //                     color: Colors.black,
// //                     fontWeight: FontWeight.w800,
// //                     fontSize: 11),
// //               ),
// //             ),
// //           ),
// //           // _buildEventList()
// //         ],
// //       ),
// //
// //     );
// //   }
// //
// //    List _selectedEvents = [];
// //
// //    Widget _buildEventList() {
// //      return Expanded(
// //        child: ListView.builder(
// //          padding: EdgeInsets.all(0.0),
// //          itemBuilder: (BuildContext context, int index) {
// //            final CleanCalendarEvent event = _selectedEvents[index];
// //            final String start = DateFormat('HH:mm').format(event.startTime).toString();
// //            final String end = DateFormat('HH:mm').format(event.endTime).toString();
// //            return ListTile(
// //              contentPadding:
// //              EdgeInsets.only(left: 2.0, right: 8.0, top: 2.0, bottom: 2.0),
// //              leading: Container(
// //                width: 10.0,
// //                color: event.color,
// //              ),
// //              title: Text(event.summary),
// //              subtitle:
// //              event.description.isNotEmpty ? Text(event.description) : null,
// //              trailing: Column(
// //                mainAxisAlignment: MainAxisAlignment.center,
// //                children: [Text(start), Text(end)],
// //              ),
// //              onTap: () {},
// //            );
// //          },
// //          itemCount: _selectedEvents.length,
// //        ),
// //      );
// //    }
//
//   }


// class Eventlistmodel{
//
//   String event_name = '';
//   DateTime date;
//   Color? bg;
//
//   Eventlistmodel({required this.event_name,required this.date,this.bg});
//
// }



/* Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Schedule',icon_button: false),
        body: ScrollableCleanCalendar(


          calendarController: controller.calendarController,
          layout: Layout.BEAUTY,

          calendarCrossAxisSpacing: 0,
        ));
  }*/

//umer
// class MeetingDataSource extends CalendarDataSource {
//   /// Creates a meeting data source, which used to set the appointment
//   /// collection to the calendar
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }
//
//   @override
//   DateTime getStartTime(int index) {
//     print('_getMeetingData(index).from ${_getMeetingData(index).from}');
//     return _getMeetingData(index).from;
//   }
//
//   @override
//   DateTime getEndTime(int index) {
//     return _getMeetingData(index).to;
//   }
//
//   @override
//   String getSubject(int index) {
//     return _getMeetingData(index).eventName;
//   }
//
//   @override
//   Color getColor(int index) {
//     return _getMeetingData(index).background;
//   }
//
//   @override
//   bool isAllDay(int index) {
//     return _getMeetingData(index).isAllDay;
//   }
//
//   Meeting _getMeetingData(int index) {
//     final dynamic meeting = appointments![index];
//     late final Meeting meetingData;
//     if (meeting is Meeting) {
//       meetingData = meeting;
//     }
//
//     return meetingData;
//   }
// }
//
// /// Custom business object class which contains properties to hold the detailed
// /// information about the event data which will be rendered in calendar.
// class Meeting {
//   /// Creates a meeting class with required details.
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
//
//   /// Event name which is equivalent to subject property of [Appointment].
//   String eventName;
//
//   /// From which is equivalent to start time property of [Appointment].
//   DateTime from;
//
//   /// To which is equivalent to end time property of [Appointment].
//   DateTime to;
//
//   /// Background which is equivalent to color property of [Appointment].
//   Color background;
//
//   /// IsAllDay which is equivalent to isAllDay property of [Appointment].
//   bool isAllDay;
// }

//
// class CellCalendar extends StatefulWidget {
//   @override
//   _CellCalendarState createState() => _CellCalendarState();
// }
//
// class _CellCalendarState extends State<CellCalendar> {
//   CalendarController _calendarController;
//
//   @override
//   void initState() {
//     super.initState();
//     _calendarController = CalendarController();
//   }
//
//   @override
//   void dispose() {
//     _calendarController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cell Calendar'),
//       ),
//       body: TableCalendar(
//         calendarController: _calendarController,
//       ),
//     );
//   }
// }
