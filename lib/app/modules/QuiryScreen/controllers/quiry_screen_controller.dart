import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/globle_var.dart';

import '../../../utils/constants/ShowToast.dart';
import '../../../utils/constants/api_service.dart';

class QuiryScreenController extends GetxController {
  //TODO: Implement QuiryScreenController

  TextEditingController fullname=TextEditingController();
  TextEditingController Class_c=TextEditingController();
  TextEditingController phone_number=TextEditingController();
  TextEditingController query=TextEditingController();

  final count = 0.obs;

  OnSubmit(){
    if(fullname.text.isEmpty){
      ToastClass.showToast('Please enter full name.', 'assets/only_logo.png');
    }else if(Class_c.text.isEmpty){
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
    super.onInit();
  }

  final isLoading=false.obs;
  Post_query() async {
    try {
      isLoading(true);

      var response = await ApiService()
          .Query_submit(Class: Class_c.text,full_name: fullname.text,phone_number: phone_number.text,student_id: userData!.id,your_query: query.text);

      if (response['status'] == true) {

        ToastClass.showToast('${response['message']}', 'assets/only_logo.png');

        isLoading(false);


      } else if (response['status'] == false) {
        ToastClass.showToast('${response['message']}', 'assets/only_logo.png');
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
