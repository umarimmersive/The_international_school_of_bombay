
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomshowDialog extends StatelessWidget {
  final title;
  final examId;
  final id;
  final total_Number_of_qustion;
  final Total_time_available;
  final Marks_for_wrong;
  final Marks_for_correct;
  final language;
  final question_type;

  const CustomshowDialog({Key? key, required this.title,
    required this.total_Number_of_qustion,
    required this.language,
    required this.question_type,
    required this.examId,
    this.Total_time_available,required this.Marks_for_wrong,required this.Marks_for_correct,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      clipBehavior: Clip.hardEdge,
      content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          mainAxisAlignment:
          MainAxisAlignment.start,
          children: [
            Text(
              "${title}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),

            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),


            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text("Language:"),
                Text(language.toString()??"0"),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text("Question_type:"),
                Text(question_type.toString()??"0"),
              ],
            ),
            SizedBox(
              height: 8,
            ),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text("Total number of questions:"),
                Text(total_Number_of_qustion.toString()??""),
              ],
            ),

            SizedBox(
              height: 8,
            ),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text("Total time available:"),
                Text(Total_time_available.toString()+" "+"Min"),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text("Marks for correct:"),
                Text(Marks_for_correct.toString()??"0"),
              ],
            ),

            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              children: [
                Text("Marks for wrong:"),
                Text(Marks_for_wrong.toString()??"0"),
              ],
            ),
            Divider(
              thickness: 0.5,
              color: Colors.black,
            ),

            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(
                              16)),
                      backgroundColor:
                      HexColor("#ec6c1c")),
                  onPressed: () {

                    var data={
                      'id': id.toString(),
                      'examId': examId.toString(),
                      'title': title.toString(),
                      'Total_time_available': Total_time_available.toString(),
                      'language': language.toString(),
                      'question_type': question_type.toString(),
                    };

                   // Get.offAndToNamed(Routes.ANIMATED_TIMER,parameters: data);
                  },
                  child: Text(
                    "Start Test",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            )
          ],
        ),
    );
  }
}
