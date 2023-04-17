import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/artical2_controller.dart';

class Artical2View extends GetView<Artical2Controller> {
  const Artical2View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Artical'),
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(                  textAlign:TextAlign.justify,

                  "Teacher tips for projects with tattered texts",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,fontFamily: "Roboto"),
                ),
                SizedBox(
                  height: 10,
                ),


                Center(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset("assets/images/Teacher-tips-for-tattered-texts.jpg")),
                ),
                SizedBox(height: 15,),

                Text(
                    textAlign: TextAlign.justify,
                 "As teachers know, there are back rooms in most schools that are replete with old copies of textbooks, battered novels, and random pages. The inspiration for this article comes from hours spent looking through old copies of well-worn titles in my own teacher storage closet, as well as the creative decisions of my wife, who is also a teacher. We have had conversations about invigorating language arts instruction with creativity, while thumbing through well-worn (and hopefully loved) copies of classroom novels."
                ),



                 SizedBox(height:6,),


                Text(
                    textAlign: TextAlign.justify,
                  "While recycling for the benefit of the environment is always a go-to option, here are some creative ideas for what you can do with old book copies and other ephemera that will hopefully appeal to the booklover and artist alike."

                ),


                 SizedBox(height: 6,),

                Text(
                    textAlign: TextAlign.justify,
                  "One of the first ideas that comes to mind when considering the tattered page is the ways in which a reader can transform said page into a new piece of work. Authors provide us with wonderful words and powerful artistic choices. By noting the words that can be reworked, students can take creative poetic steps.Why is this beneficial? Sometimes the terror of the blank page stultifies even the most seasoned author. By having some words to work with from a tattered text copy, students can begin to see the ways that words are arranged by analysing the text for their own creative choices. Md salman Khan razwi, Yesterday at 17:24 ye"


                )





              ],
            ),
          ),
        ));
  }
}
