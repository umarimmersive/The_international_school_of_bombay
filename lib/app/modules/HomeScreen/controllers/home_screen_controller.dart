import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:the_international_school_of_bombay/app/models/Announcement_model.dart';
import 'package:the_international_school_of_bombay/app/models/Sections/section_details_model.dart';
import 'package:the_international_school_of_bombay/app/models/Sibling_model.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/toast.dart';

import '../../../models/Event_list_model.dart';
import '../../../models/Knowledge_base_model.dart';
import '../../../models/Slider_model.dart';
import '../../../models/Sections/selection_list_model.dart';
import '../../../utils/constants/api_service.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController

  final count = 0.obs;
  final groupValue = 1.obs;
  final isChecked = [].obs;


  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  // GlobalKey contentKey = GlobalKey();
  // GlobalKey refresherKey = GlobalKey();


  final Image = 'assets/background.jpg'.obs;
  final profile_image = 'assets/profileimages.jpeg'.obs;
  List<String> title=["Leave", "Noticeboard","Bus Routes","School Rules","Query"];
  List<IconData> icons = [
    Icons.api,
    Icons.event_note_outlined,
    Icons.time_to_leave_outlined,
    Icons.note_alt_outlined,
    Icons.note_alt,
  ];

  int current = 0;
  final CarouselController slidercontroller = CarouselController();

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final List<String> imgListSlider = [
  'https://cdn.pixabay.com/photo/2015/12/15/06/42/kids-1093758_1280.jpg' ,
  'https://cdn.pixabay.com/photo/2015/07/19/10/00/school-work-851328_1280.jpg' ,
  'https://cdn.pixabay.com/photo/2014/03/12/18/45/boys-286245_1280.jpg' ,
  'https://cdn.pixabay.com/photo/2022/07/23/07/21/children-7339441_1280.jpg' ,
  'https://cdn.pixabay.com/photo/2014/07/17/15/17/students-395568_1280.jpg'
  ].obs;

  final slider_image = [
   'assets/images/2.png',
   'assets/images/3.png',
   'assets/images/Skype_Picture_2023_04_27T13_03_47_529Z.jpeg'
  ];
  @override
  void onInit() {
    Get_deshbord_section();
    Get_Slider();
    Get_sibling();
    Get_Annoucement();
    // Get_Knowledge();
  //  Get_Adv_list();
    Get_Event_list();
    Get_banner_list();
    Get_selectionList();
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
   await   Get_selectionList();
  }


  final isLoading=false.obs;
  final about_us_content=''.obs;
  final heading=''.obs;
  final icon=''.obs;
  final file_valude=''.obs;
  final line_color=''.obs;
  final token=''.obs;
  final imageSliderindex = 0.obs;

  Color hexToColor(String hexString, {String alphaChannel = 'FF'}) {
    return Color(int.parse(hexString.replaceFirst('#', '0x$alphaChannel')));
  }


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

        print('sliderrrrrrrrrrrrr-------------${Slider.value}');

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


  final selectionList = <Section_List_model>[].obs;
  final isLoading_selectionList = false.obs;
  Future Get_selectionList() async {
    try {
      isLoading_selectionList(true);
      var response = await ApiService()
          .Selection_list();
      if (response['status'] == true) {

        // Toast.show(response['message'].toString());


        print(' Get_selectionList === responce----------------------${response}');

        List dataList = response['data'].toList();
        selectionList.value = dataList.map((json) => Section_List_model.fromJson(json)).toList();

        isLoading_selectionList(false);

        update();
      } else if (response['status'] == false) {

        // Toast.show(response['message'].toString());

        isLoading_selectionList(false);
      }
    } finally {
      isLoading_selectionList(false);

    }
  }

  final sectionDetailsList = <Section_details_model>[].obs;
  final isLoadin_sectionDetails = false.obs;
  Future Get_selectionListData(int selectionID) async {
    try {
      isLoadin_sectionDetails(true);
      var response = await ApiService()
          .Selection_data(selectionID);
      if (response['status'] == true) {

        Toast.show(response['message'].toString());

        print(' Get_selectionList === responce----------------------${response}');

        List dataList = response['data'].toList();
        sectionDetailsList.value = dataList.map((json) => Section_details_model.fromJson(json)).toList();

        isLoadin_sectionDetails(false);

        update();
      } else if (response['status'] == false) {

        Toast.show(response['message'].toString());

        isLoadin_sectionDetails(false);
      }
    } finally {
      isLoadin_sectionDetails(false);

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
