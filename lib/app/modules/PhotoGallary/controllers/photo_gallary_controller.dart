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
  final numberOfPostsPerRequest = 21.obs;
  final posts= [].obs;
  final nextPageTrigger = 5.obs;
  final count = 0.obs;
  final id = ''.obs;
  final title = ''.obs;

  @override
  void onInit() {
    id.value=Get.parameters['id'].toString();
    title.value=Get.parameters['title'].toString();
    print('id controller----------------------$id');
    pageNumber.value = 1;
    // posts.value = [];
    isLastPage.value = false;
    loading.value = true;
    error.value = false;



    Get_PhotoVideoGallery();
    // TODO: implement onInit
    super.onInit();
  }


  final PhotoGalleryDetails = <PhotoGalleryDetailsModel>[].obs;
  final isLoading=false.obs;


  Future Get_PhotoVideoGallery() async {
    try {
      print('--------------------------------${pageNumber.value}');
      print('--------------------------------${id}');
      //isLoading(true);
      PhotoGalleryDetails.clear();
      var response = await ApiService()
          .Photo_Gallery_details(gallery_id: id,page: pageNumber.value);
      if (response['status'] == true) {

        print('reponce---------vjvjgv-----------${response}');

        List dataList = response['data'].toList();
        PhotoGalleryDetails.value = dataList.map((json) => PhotoGalleryDetailsModel.fromJson(json)).toList();
        posts.addAll(PhotoGalleryDetails);

        isLastPage.value = PhotoGalleryDetails.length < numberOfPostsPerRequest.value;
        isLoading(false);

        pageNumber.value = pageNumber.value + 1;

       update();
      } else if (response['status'] == false) {

        // isLoading(false);

      }
    } finally {
      // isLoading(false);

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
