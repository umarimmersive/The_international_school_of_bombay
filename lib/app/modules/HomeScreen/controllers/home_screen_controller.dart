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
  RefreshController(initialRefresh: true);
  GlobalKey contentKey = GlobalKey();
  GlobalKey refresherKey = GlobalKey();






  final Image = 'assets/background.jpg'.obs;
  final profile_image = 'assets/profileimages.jpeg'.obs;
  List<String> title=["Leave", "Noticeboard","Bus Routes","School Rules","Query"];
  List<IconData> icons = [Icons.api, Icons.event_note_outlined, Icons.time_to_leave_outlined,Icons.note_alt_outlined, Icons.note_alt, Icons.note_alt];




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
  final isLoading_Announcement=false.obs;

  Future Get_Annoucement() async {
    try {
      isLoading_Announcement(true);
      var response = await ApiService()
          .Annoucement_list();
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        Announcement_list.value = dataList.map((json) => Announcement_model.fromJson(json)).toList();


        update();
      } else if (response['status'] == false) {

        isLoading_Announcement(false);
      }
    } finally {
      isLoading_Announcement(false);

    }
  }



  final KnowledgeBaseList = <Knowledge_base_model>[].obs;


  final isLoading_Knowledge=false.obs;

  Future Get_Knowledge() async {
    try {
      isLoading_Knowledge(true);
      var response = await ApiService()
          .KnowledgeBaseList();
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        KnowledgeBaseList.value = dataList.map((json) => Knowledge_base_model.fromJson(json)).toList();

        isLoading_Knowledge(false);

        update();
      } else if (response['status'] == false) {

        isLoading_Knowledge(false);
      }
    } finally {
      isLoading_Knowledge(false);

    }
  }



  final Event_list = <Event_list_model>[].obs;

  final isLoading_Event=false.obs;

  Future Get_Event_list() async {
    try {
      isLoading_Event(true);
      // Adv_list.clear();
      var response = await ApiService()
          .EventsList('1');
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        Event_list.value = dataList.map((json) => Event_list_model.fromJson(json)).toList();


        update();
      } else if (response['status'] == false) {

        isLoading_Event(false);
      }
    } finally {
      isLoading_Event(false);

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
