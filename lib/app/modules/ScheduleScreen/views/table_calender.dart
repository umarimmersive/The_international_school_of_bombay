import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class TableCalederTest extends StatefulWidget {
  const TableCalederTest({Key? key}) : super(key: key);

  @override
  State<TableCalederTest> createState() => _TableCalederTestState();
}

class _TableCalederTestState extends State<TableCalederTest> {

  Map<DateTime, List<dynamic>> _events = {};

  ListView _buildEventsList(DateTime day) {
    return ListView(
      children: _events[day]!
          .map((event) => ListTile(title: Text(event)))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table Calendar with API'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
      )
            // ..._selectedEvents != null
            //     ? [_buildEventsList(_selectedDay)]
            //     : [],
          ],
        ),
      ),
    );
  }

  Future<void> _getEventsData() async {
    // Make API call to retrieve events data
    // and parse it into a List<dynamic> object

    setState(() {
      _events = {
        DateTime(2023, 5, 10): ['Event 1', 'Event 2'],
        DateTime(2023, 5, 11): ['Event 3'],
        DateTime(2023, 5, 12): ['Event 4', 'Event 5'],
      };
    });
  }

  @override
  void initState() {
    super.initState();
    _getEventsData();
  }

}
