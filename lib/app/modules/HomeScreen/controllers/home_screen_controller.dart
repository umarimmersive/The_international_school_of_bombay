import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController

  final count = 0.obs;
  final groupValue = 1.obs;
  final isChecked = [false,false,false].obs;

  final Image = 'assets/background.jpg'.obs;
  final profile_image = 'assets/profileimages.jpeg'.obs;
  List<String> title=["TISB Happenings", "Importent Notice","School Notice","TISB Happenings", "Importent Notice","School Notice",];
  List<IconData> icons = [Icons.person, Icons.event_note_outlined, Icons.note_alt,Icons.person, Icons.event_note_outlined, Icons.note_alt];


  final image_data=[
    'assets/images/S2.jpg',
    'assets/images/S3.jpg',
    'assets/images/S4.jpg',
    'assets/images/S5.jpg'
  ];

  final Annoucment=[
    'The Art Mela organized at ISB was a huge success. A heartfelt thanks to all the enthusiastic children who came forth and brought out the artist within themselves.',
    'Creativity indeed takes courage, and we are grateful for our students courage! Three cheers to everyone who participated in the Art Mela! You are all champions.',
    'Art: A magical way to express and speak volumes'
    'It s time to celebrate the power of art with an insightful and captivating Art Mela.'
  ];



  final data=[
    {
      "title":"Sport Event",
      "date":"2019"
    },{
      "title":"Masalat Event",
      "date":"2019"
    },{
      "title":"Annual Fuctuion",
      "date":"2019"
    },{
      "title":"Sport Event",
      "date":"2019"
    }
  ];
  final Studentdata=[
    {
      "titleText": 'Aanand Shrma',
      "subTitleText": 'Class 8 Shift Morning',
    },{
      "titleText": 'Umar Mansuri',
      "subTitleText": 'Class 12 Shift Morning',
    },{
      "titleText": 'Salman Mansuri',
      "subTitleText": 'Class 12 Shift Morning',
    },
  ];
  @override
  void onInit() {
    super.onInit();
  }

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
