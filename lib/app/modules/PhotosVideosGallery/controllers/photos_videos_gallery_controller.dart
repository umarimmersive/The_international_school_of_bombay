import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../models/Photo_Gallery_Model.dart';
import '../../../utils/constants/api_service.dart';

class PhotosVideosGalleryController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement PhotosVidiosGalleryController


  TabController? tabController;

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


  List second=["assets/images/60.JPG",
    "assets/images/62.JPG",
    "assets/images/61.JPG",
    "assets/Slider/4.png",
  ];

  List third=["assets/images/54.jpg",
    "assets/images/55.jpg",
    "assets/images/56.jpg",
    "assets/images/50.jpg",

  ];


  List forth=["assets/images/15.jpg",
    "assets/images/19.jpg",
    "assets/images/13.jpg",
    "assets/images/14.jpg",

  ];

  final count = 0.obs;
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    Get_PhotoGallery();
    Get_Video_Gallery();

    super.onInit();
  }
  _setOrientation(List<DeviceOrientation> orientations) {
    SystemChrome.setPreferredOrientations(orientations);
  }
   YoutubePlayerController? ytbPlayerController;

  Player({url}) async{
    //
    // print('url-------------$url');
    // _setOrientation([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);



    WidgetsBinding.instance!.addPostFrameCallback((_) {
      ytbPlayerController = YoutubePlayerController(
        initialVideoId: url,
        params: YoutubePlayerParams(
          showFullscreenButton: false,
        ),
      );
    });

    ytbPlayerController!.play();
  }
  final PhotoVideoGallery = <PhotoGalleryModel>[].obs;
  final isLoading=false.obs;

  Future Get_PhotoGallery() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .Photo_Gallery('1');
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();

        PhotoVideoGallery.value = dataList.map((json) => PhotoGalleryModel.fromJson(json)).toList();


        print('P-----------------${PhotoVideoGallery}');
        update();
      } else if (response['status'] == false) {

        isLoading(false);
      }
    } finally {
      isLoading(false);

    }
  }

  final VideoGallery = <PhotoGalleryModel>[].obs;
 // final isLoading=false.obs;
  Future Get_Video_Gallery() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .Photo_Gallery('2');
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();

        VideoGallery.value = dataList.map((json) => PhotoGalleryModel.fromJson(json)).toList();

        await Player(url: VideoGallery[0].item_value.toString());
        print('P-----------------${VideoGallery}');
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
   // ytbPlayerController!.dispose();
    // TODO: implement dispose
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
