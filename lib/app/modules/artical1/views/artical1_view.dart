import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/artical1_controller.dart';

class Artical1View extends GetView<Artical1Controller> {
  const Artical1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar('Artical'),
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Text(
                  "Collaboration at the heart of school reform",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
                SizedBox(
                  height: 10,
                ),


                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/images/Collaboration-at-the-heart-of-school-reforms (1).jpg")),
                ),
                SizedBox(height: 15,),
                
                Text(
                    textAlign: TextAlign.justify,

                    "Collaboration has always been a key aspect of school education reform – from collaboration among students in the classroom to peer collaboration among teachers, and parent-school collaboration to collaboration for policy reforms.The challenge is, how to make these collaborations effective. How to set the right expectations for the participants. How to ensure there are benefits for all those involved. Francis Joseph is Executive Director (India) of GEMS Education and has been named one of the top 25 change-makers in India.shares with Teacher leanings from his experience of establishing more than 100 schools of multiple curricula in India and the Middle East, and working with the Government in large-scale educational reforms."),
                SizedBox(height: 15,),


                Text("Trust is essential for true collaboration",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 8,),


                Text(
                    textAlign: TextAlign.justify,

                    "‘Ensuring collaboration in its true sense is one of the most challenging tasks in today’s time and mutual trust is essential for its success,’ Joseph say‘In my perspective, true collaboration happens when stakeholders are at par with each other and trusted by each other. It can’t happen with one having an edge over others. It’s about appreciating each other’s perspectives and opinions.’"),
                SizedBox(height: 15,),

                Text("Success stories",style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 8,),
                
                Text(
                    textAlign: TextAlign.justify,

                    "Joseph shares 2 successful collaborative projects he’s participated in, highlighting that it becomes a powerful tool, especially in emergencies Cancellation of Board exams Board examinations were cancelled in 2021 due to the rise in COVID-19 infections. Joseph, one of the experts working on behalf of the Government of Maharashtra, was collaborating with the International Baccalaureate Board, Cambridge Board and the Council for the Indian School Certificate Examinations to work on measures for the cancellation of exams. He says every Board had its own challenges which each stakeholder had to understand and support. Working on the protocols for the cancellation of exams was only the first step for intra-Board\ncollaborations, followed by opportunities in areas of planning examinations, reopening schools, safety protocols, online teaching, curriculum reduction, and so on. Marathi made mandatory The Government of Maharashtra intended to pass the Maharashtra Compulsory Teaching and Learning of Marathi Language in Schools Act, 2020 for making teaching and learning of Marathi language compulsory in all schools in the State of Maharashtra.Joseph was part of a series of consultations that enabled the schools to implement the Act. School leaders, teachers, parents, and students were consulted so that they understand and accept the implications of the policy. These efforts developed trust among stakeholders, which led to the implementation of the Act and opened doors to many other policies being successfully implemented through collaboration and consultation among all stakeholders.")




              ],
            ),
          ),
        ));
  }
}
