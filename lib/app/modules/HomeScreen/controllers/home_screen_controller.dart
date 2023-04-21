import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:the_international_school_of_bombay/app/models/Announcement_model.dart';
import 'package:the_international_school_of_bombay/app/models/Sibling_model.dart';

import '../../../models/Event_list_model.dart';
import '../../../models/Knowledge_base_model.dart';
import '../../../models/Slider_model.dart';
import '../../../utils/constants/api_service.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController

  final count = 0.obs;
  final groupValue = 1.obs;
  final isChecked = [].obs;


  RefreshController refreshController =
  RefreshController(initialRefresh: false);
  GlobalKey contentKey = GlobalKey();
  GlobalKey refresherKey = GlobalKey();






  final Image = 'assets/background.jpg'.obs;
  final profile_image = 'assets/profileimages.jpeg'.obs;
  List<String> title=["Leave", "Noticeboard","Bus Routes","School Rules","Query"];
  List<IconData> icons = [Icons.api, Icons.event_note_outlined, Icons.time_to_leave_outlined,Icons.note_alt_outlined, Icons.note_alt, Icons.note_alt];



  List latesteventimage=[

    "assets/images/Collaboration-at-the-heart-of-school-reforms (1).jpg",
    "assets/images/Teacher-tips-for-tattered-texts.jpg",
    "assets/images/Implementing-global-citizenship-education.jpg",
    "assets/images/image_2023_03_31T17_48_49_093Z.png",
    "assets/images/WISE-Scaling-up.jpg"
  ];

  List latestevents = [

    "Collaboration at the heart\nof school reform",
    "Teacher tips for projects with\ntattered texts",
    "Implementing a Global\nCitizenship Educationprogram in your school",
    "Students’ innovative solutions to global\nsustainability issues",
    "Tackling education challenges – scaling\nup pioneering projects",


  ];



  List forimageheading = [
    "It’s time to HOWL with the Bhediya stars",
    "Creativity, and enthusiasm combine!",
    "Heartfelt thanks to all the enthusiastic children",
    "A magical way to express and speak volumes.",
    "Positive mentoring",
  ];


  List forheadingsecond = [
    "Today was an exciting day for the entire faculty group and students at The International School of Bombay.",
    "This is what happens when art, creativity, and enthusiasm combine!",
    "A heartfelt thanks to all the enthusiastic children who came forth and brought out the artist within themselves.",
    "Art is a beautiful way for children to express themselves and bring out their creativity.",
    "At ISB, we believe in positive mentoring through these fun activities."


  ];


  final image_data=[
    'assets/images/3.png',
    'assets/images/1.png',
    'assets/images/4.png',
    'assets/images/2.png',
    'assets/images/5 (1).png',

  ];

  final articalDetails =[
    {
      "title":"Collaboration at the heart of school reform",

      "image":"assets/images/Collaboration-at-the-heart-of-school-reforms (1).jpg",

      "artical":"Collaboration at the heart of school reform"
    },

  ];


  final slider_data=[
    {
      "maintitle":"It’s time to HOWL with the Bhediya stars",

      "images":'assets/images/3.png',
      "title":"It’s time to HOWL with the Bhediya stars Not an ordinary day at The International School of Bombay! It’s time to HOWL with the Bhediya stars and create memories we can never forget."
     "Today was an exciting day for the entire faculty group and students at The International School of Bombay. We spent a memorable day with exceptional Kriti Sanon and beloved Varun Dhawan, who graciously gave us the pleasure of welcoming them for the movie promotion of  Bhediya. We danced, we sang, we laughed, and enjoyed ourselves with utter excitement."
      " We can’t even explain the enthusiasm and zeal that surrounded our entire school during the whole encounter with Kriti Sanon and Varun Dhawan.  Both of them were extremely sweet, and humble, and shared some beautiful moments with our students and teachers. It was indeed an honour to meet such graceful and talented people."
     " The movie releases on 25th November, and we must say all our students and faculty members are eagerly waiting to head to the theatre and enjoy this phenomenal movie filled with twists, turns, and laughter."
    },
   {
     "maintitle":"Creativity, and enthusiasm combine!",

     "images":'assets/images/1.png',
   "title": "This is what happens when art, creativity, and enthusiasm combine!"
   "It takes only one step in the direction of art to bring out the hidden artist in you. And this is exactly what we did with this Art Mela."
  " The Art Mela organized at ISB was a phenomenal success. Our hearts were full of joy😃 after looking at the beautiful art pieces created by our students. A huge thanks to every child who came forth and participated in the Art Mela and brought life to their art. Seeing our students paint, sketch, and spark their creative selves with such passion was a remarkable experience."
   "Here’s to each and every one of you! May you always enlighten the creativity within you and ignite the passion that art brings forth."
},
{
  "maintitle":"Heartfelt thanks to all the enthusiastic children",

  "images":'assets/images/4.png',
"title": "A heartfelt thanks to all the enthusiastic children who came forth and brought out the artist within themselves. It was indeed a surreal moment to watch each one of our students passionately paint, draw, and ignite their artistic selves"
"Creativity indeed takes courage, and we are grateful for our students' courage! Three cheers to everyone who participated in the Art Mela! You are all champions."
},
    {"maintitle":"A magical way to express and speak volumes.",
      "images":'assets/images/2.png',
      "title":     "Art is a beautiful way for children to express themselves and bring out their creativity.",

    },

    {
      "maintitle":"Positive mentoring",
      "images":'assets/images/5 (1).png',
      "title": "At ISB, we believe in positive mentoring through these fun activities."

    },



  ];

  final KnowladgeBasedata =[

    {
      "title":"Collaboration at the heart of school reform",
      "dicription":""

    }


  ];



  final sport_image_data=[
    'assets/sport/37.jpg',
    'assets/sport/3.jpg',
    'assets/sport/42.jpg',
    'assets/sport/21.jpg',
  ];

  final Annoucment=[
    "Northern India Regional Council of the Institute of Company Secretaries of India (NIRC-ICSI) organising Online Oral Tuition Classes (OTC) for the students of CSEET Programme for November, 2023 Examination.",
    "The Foundation Programme being the entry level to the Company Secretaryship Course and gateway to the profession of Company Secretaries, the Syllabus Review Committee based on the feedback received from various stakeholders has completed the formulation of detailed contents of the Foundation Programme.",
"The next practical training assessment is being conducted online on March 4-5, 2023. The students who have completed their 1st/ 2nd year of practical training during April 1, 2023 – December 31, 2024 are eligible to appear in this test."

  ];


  List anounsmentshh =["Online CSEET Classes",

    "Introduction of New Syllabus\nFoundation Programme",
    "Registration for Online Home-Based\nPractical Training Assessment"
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
    Get_deshbord_section();
    Get_Slider();
    Get_sibling();
    Get_Annoucement();
    Get_Knowledge();
  //  Get_Adv_list();
    Get_Event_list();
    Get_banner_list();
    super.onInit();
  }

  refrshApi() async{
   await Get_deshbord_section();
   await Get_Slider();
   await Get_sibling();
   await  Get_Annoucement();
   await  Get_Knowledge();
 //  await  Get_Adv_list();
   await  Get_Event_list();
   await  Get_banner_list();
  }


  final isLoading=false.obs;
  final about_us_content=''.obs;
  final heading=''.obs;
  final icon=''.obs;
  final file_valude=''.obs;
  final line_color=''.obs;
  final token=''.obs;


  Future Get_deshbord_section() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .Dashboard_Section();
      if (response['status'] == true) {

        heading.value=response['data']['heading'];
        icon.value=response['data']['icon'];
        file_valude.value=response['data']['file_value'];
        line_color.value=response['data']['line_color'];

        print('0-------------------${heading.value}');
        print('1-------------------${icon.value}');
        print('2-------------------${file_valude.value}');


        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
  }


  final Slider = <Slider_model>[].obs;
  final isLoading_slider = false.obs;



  Future Get_Slider() async {
    Slider.value.clear();
    try {
      isLoading_slider(true);

      var response = await ApiService().Slider();

      print({'response==================================$response'});
      if (response['status'] == true) {

        List dataList = response['data'].toList();
        Slider.value = dataList.map((json) => Slider_model.fromJson(json)).toList();

        print('sliderrrr-------------${Slider.value}');

        update();
        isLoading_slider(false);
      } else if (response['status'] == false) {

        isLoading_slider(false);
        update();
      }
    } finally {
      isLoading_slider(false);
      update();

    }
  }




 // final isLoading=false.obs;
  final Sibling = <Sibling_model>[].obs;

  Future Get_sibling() async {
    try {
      isLoading(true);
      isChecked.clear();
      var response = await ApiService()
          .Siblings_list();
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        Sibling.value = dataList.map((json) => Sibling_model.fromJson(json)).toList();

        for(int i =0;i<Sibling.length;i++)
          isChecked.add(false);





        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
  }


  final Announcement_list = <Announcement_model>[].obs;

  Future Get_Annoucement() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .Annoucement_list();
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        Announcement_list.value = dataList.map((json) => Announcement_model.fromJson(json)).toList();


        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
  }



  final KnowledgeBaseList = <Knowledge_base_model>[].obs;

  Future Get_Knowledge() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .KnowledgeBaseList();
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        KnowledgeBaseList.value = dataList.map((json) => Knowledge_base_model.fromJson(json)).toList();


        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
  }



  final Event_list = <Event_list_model>[].obs;

  Future Get_Event_list() async {
    try {
      isLoading(true);
      // Adv_list.clear();
      var response = await ApiService()
          .EventsList('1');
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        Event_list.value = dataList.map((json) => Event_list_model.fromJson(json)).toList();


        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
  }


  final Adv_list = <Avd_model>[].obs;
  final adv_image=''.obs;

  Future Get_banner_list() async {
    try {
      isLoading(true);
      Adv_list.clear();
      var response = await ApiService()
          .Advertisement();
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        Adv_list.value = dataList.map((json) => Avd_model.fromJson(json)).toList();
        adv_image.value=Adv_list[0].image!;
        print('BottomSheetImage---------------------------------${adv_image.value}');
        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
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
