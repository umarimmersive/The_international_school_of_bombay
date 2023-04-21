import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../models/Photo_Gallery_Model.dart';
import '../../../utils/constants/api_service.dart';

class PhotosVideosGalleryController extends GetxController {
  //TODO: Implement PhotosVidiosGalleryController

  final sport_image_data = [
    'assets/sport/37.jpg',
    'assets/sport/3.jpg',
    'assets/sport/42.jpg',
    'assets/sport/21.jpg',
    "assets/images/17.jpg",
    "assets/images/62.JPG",
    'assets/sport/37.jpg',
    'assets/sport/3.jpg',
    'assets/sport/42.jpg',
    'assets/sport/21.jpg',
    "assets/images/17.jpg",
    "assets/images/62.JPG",
  ];

  List albamname = [
    "Function",
    "Event",
    "Sport Funtion",
    "Art Event",
    "cultural events",
    "Group",
    "Function",
    "Event",
    "Sport Funtion",
    "Art Event",
    "cultural events",
    "Group",
  ];

  List first = [
    'assets/Slider/1.png',
    'assets/Slider/2.png',
    'assets/Slider/3.png',
    'assets/Slider/4.png',
  ];

  List second = [
    "assets/images/60.JPG",
    "assets/images/62.JPG",
    "assets/images/61.JPG",
    "assets/Slider/4.png",
  ];

  List third = [
    "assets/images/54.jpg",
    "assets/images/55.jpg",
    "assets/images/56.jpg",
    "assets/images/50.jpg",
  ];

  List forth = [
    "assets/images/15.jpg",
    "assets/images/19.jpg",
    "assets/images/13.jpg",
    "assets/images/14.jpg",
  ];

  final count = 0.obs;

  //====================================================

  final List<dynamic> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
  ];

  late YoutubePlayerController controller;
  YoutubePlayerController? controllerr;

  List<String> vedeoid = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
  ];

   @override
  void onInit() {
    Get_PhotoVideoGallery();
    super.onInit();
  }

  final PhotoVideoGallery = <PhotoGalleryModel>[].obs;
  final isLoading=false.obs;

  Future Get_PhotoVideoGallery() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .Photo_Gallery();
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();

        PhotoVideoGallery.value = dataList.map((json) => PhotoGalleryModel.fromJson(json)).toList();


        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
  }



  @override
  void dispose() {
    super.dispose();
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
