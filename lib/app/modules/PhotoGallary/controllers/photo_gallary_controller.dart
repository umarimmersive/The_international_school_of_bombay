import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../models/Photo_Gallery_Model.dart';
import '../../../utils/constants/api_service.dart';
import '../views/photo_gallary_view.dart';

class PhotoGallaryController extends GetxController {



  final  isLastPage=false.obs;
  final pageNumber=1.obs;
  final error= false.obs;
  final loading=false.obs;
  final numberOfPostsPerRequest = 20.obs;
  final posts= [].obs;
  final nextPageTrigger = 3.obs;








  final items_number = 10.obs;
  List images = [
    "assets/images/1.png",
    "assets/images/47.jpg",
    "assets/images/48.jpg",
    "assets/images/35.jpg",
    "assets/images/37.jpg",
    "assets/images/38.jpg",
    "assets/images/39.jpg",
    "assets/images/40.jpg",
    "assets/images/42.jpg",
    "assets/images/43.jpg",
    "assets/images/44.jpg",
    "assets/images/45.jpg",
  ];


  final count = 0.obs;
  final gallery_id = ''.obs;
  final title = ''.obs;

  @override
  void onInit() {
    pageNumber.value = 1;
   // posts.value = [];
    isLastPage.value = false;
    loading.value = true;
    error.value = false;


    gallery_id.value=Get.parameters['id'].toString();
    title.value=Get.parameters['title'].toString();
    print('gallery_id.value---------${gallery_id.value}');
    Get_PhotoVideoGallery();

    super.onInit();
  }

  final PhotoGalleryDetails = <PhotoGalleryDetailsModel>[].obs;
  final isLoading=false.obs;

  Update()async{
   await Get_PhotoVideoGallery();
    update();
  }

  Future Get_PhotoVideoGallery() async {
    try {
      isLoading(true);
      PhotoGalleryDetails.clear();
    var response = await ApiService()
          .Photo_Gallery_details(gallery_id: gallery_id,page: pageNumber.value);
      if (response['status'] == true) {

        print('reponce---------vjvjgv-----------${response}');

        List dataList = response['data'].toList();
          PhotoGalleryDetails.value = dataList.map((json) => PhotoGalleryDetailsModel.fromJson(json)).toList();
          posts.addAll(PhotoGalleryDetails);

          isLastPage.value = PhotoGalleryDetails.length < numberOfPostsPerRequest.value;
          loading.value = false;
          pageNumber.value = pageNumber.value + 1;

        update();
      } else if (response['status'] == false) {

        isLoading(false);
        update();
      }
    } finally {
      isLoading(false);
      update();
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
