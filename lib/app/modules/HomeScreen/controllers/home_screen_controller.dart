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
    'assets/Slider/1.png',
    'assets/Slider/2.png',
    'assets/Slider/3.png',
    'assets/Slider/4.png',
  ];

  final slider_data=[
    {
      "images":'assets/Slider/1.png',
      "title":"It’s time to HOWL with the Bhediya stars Not an ordinary day at The International School of Bombay! It’s time to HOWL with the Bhediya stars and create memories we can never forget."
     "Today was an exciting day for the entire faculty group and students at The International School of Bombay. We spent a memorable day with exceptional Kriti Sanon and beloved Varun Dhawan, who graciously gave us the pleasure of welcoming them for the movie promotion of  Bhediya. We danced, we sang, we laughed, and enjoyed ourselves with utter excitement."
      " We can’t even explain the enthusiasm and zeal that surrounded our entire school during the whole encounter with Kriti Sanon and Varun Dhawan.  Both of them were extremely sweet, and humble, and shared some beautiful moments with our students and teachers. It was indeed an honour to meet such graceful and talented people."
     " The movie releases on 25th November, and we must say all our students and faculty members are eagerly waiting to head to the theatre and enjoy this phenomenal movie filled with twists, turns, and laughter."
    },
   {
   "images":'assets/Slider/555.png',
   "title": "This is what happens when art, creativity, and enthusiasm combine!"
   "It takes only one step in the direction of art to bring out the hidden artist in you. And this is exactly what we did with this Art Mela."
  " The Art Mela organized at ISB was a phenomenal success. Our hearts were full of joy😃 after looking at the beautiful art pieces created by our students. A huge thanks to every child who came forth and participated in the Art Mela and brought life to their art. Seeing our students paint, sketch, and spark their creative selves with such passion was a remarkable experience."
   "Here’s to each and every one of you! May you always enlighten the creativity within you and ignite the passion that art brings forth."
},
{
"images":'assets/Slider/3.png',
"title": "A heartfelt thanks to all the enthusiastic children who came forth and brought out the artist within themselves. It was indeed a surreal moment to watch each one of our students passionately paint, draw, and ignite their artistic selves"
"Creativity indeed takes courage, and we are grateful for our students' courage! Three cheers to everyone who participated in the Art Mela! You are all champions."
},

  ];

  final sport_image_data=[
    'assets/sport/37.jpg',
    'assets/sport/3.jpg',
    'assets/sport/42.jpg',
    'assets/sport/21.jpg',
  ];

  final Annoucment=[
    'The Art Mela organized at ISB was a huge success. A heartfelt thanks to all the enthusiastic children who came forth and brought out the artist within themselves.',
    'Creativity indeed takes courage, and we are grateful for our students courage! Three cheers to everyone who participated in the Art Mela! You are all champions.',
    'Art: A magical way to express and speak volumes'
    'It s time to celebrate the power of art with an insightful and captivating Art Mela.'
  ];



  final data=[
    {
      "title":"Function",
      "date":"2019"
    },
    {
      "title":"Event",
      "date":"2019"
    },
    {
      "title":"Sport Fuctuion",
      "date":"2019"
    },
    {
      "title":"Martial Arts Event",
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
