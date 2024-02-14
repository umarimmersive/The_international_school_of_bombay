import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/modules/Exam_date/controllers/exam_date_controller.dart';
import 'package:the_international_school_of_bombay/app/routes/app_pages.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';

class ExamDateView extends GetView<ExamDateController> {
  ExamDateView({Key? key}) : super(key: key);

  final List<Map<String, String>> dataList = [
    {'title': 'Item 1', 'description': 'Description for Item 1'},
    {'title': 'Item 2', 'description': 'Description for Item 2'},
    {'title': 'Item 3', 'description': 'Description for Item 3'},
    // Add more items as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: 'Exam Date'),
      body: ListView.builder(
        itemCount: dataList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(Routes.EXAM_TIME_TABLE);
            },
            child: Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(dataList[index]['title'] ?? ''),
                subtitle: Text(dataList[index]['description'] ?? ''),
              ),
            ),
          );
        },
      ),
    );
  }
}
