import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/globle_var.dart';

import '../../../models/leave_status_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ShowToast.dart';
import '../../../utils/constants/api_service.dart';

class QuiryScreenController extends GetxController {
  //TODO: Implement QuiryScreenController

  TextEditingController fullname=TextEditingController();
  TextEditingController Class_c=TextEditingController();
  TextEditingController phone_number=TextEditingController();
  TextEditingController query=TextEditingController();

  final count = 0.obs;


  String? dropdownvalueClass;



  OnSubmit(){
    if(fullname.text.isEmpty){
      ToastClass.showToast('Please enter full name.', 'assets/only_logo.png');
    }else if(dropdownvalueClass!.isEmpty){
      ToastClass.showToast('Please enter class.', 'assets/only_logo.png');
    }else if(phone_number.text.isEmpty){
      ToastClass.showToast('Please enter phoone number.', 'assets/only_logo.png');
    }else if(query.text.isEmpty){
      ToastClass.showToast('Please enter query.', 'assets/only_logo.png');
    }else{
      Post_query();
    }
  }

  @override
  void onInit() {
    fullname.text = userData!.full_name;
    dropdownvalueClass=userData!.Class;
    phone_number.text = userData!.father_mobile;
    ClassList_Api();
    super.onInit();
  }

  final isLoading=false.obs;
  Post_query() async {
    try {
      isLoading(true);

      var response = await ApiService()
          .Query_submit(Class: dropdownvalueClass,full_name: fullname.text,phone_number: phone_number.text,student_id: userData!.id,your_query: query.text);

      if (response['status'] == true) {

        ToastClass.showToast('${response['message']}', 'assets/only_logo.png');

        isLoading(false);

        Get.toNamed(Routes.DESHBOARD_SCREEN);
      } else if (response['status'] == false) {
        ToastClass.showToast('${response['message']}', 'assets/only_logo.png');
        isLoading(false);
      }

    } finally {

      isLoading(false);

    }
  }

  final ClassList = <ClassListModel>[].obs;
  Future ClassList_Api() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .ClassList_list();
      if (response['status'] == true) {

        print('responce----------------------${response}');

        List dataList = response['data'].toList();
        ClassList.value = dataList.map((json) => ClassListModel.fromJson(json)).toList();

        // for(int i =0;i<Sibling.length;i++)
        //   isChecked.add(false);
        // update();
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
