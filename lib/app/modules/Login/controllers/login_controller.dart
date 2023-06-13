import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/my_local_service.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ShowToast.dart';
import '../../../utils/constants/api_service.dart';
import '../../../utils/global_widgets/snackbar.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final Image="assets/images/logo.png".obs;
  var isLoading = false.obs;
  final obscureNewPass = true.obs;
  final count = 0.obs;
  final Future<SharedPreferences> prefs =    SharedPreferences.getInstance();

  TextEditingController emailController= TextEditingController();
  TextEditingController passwordcontroller= TextEditingController();

  onSubmit(BuildContext context) async {
    if(emailController.text.isEmpty){
      ToastClass.showToast('Please enter student id.', 'assets/only_logo.png');
      //snackbar('Please Enter Student Id.',context);
    }else if (passwordcontroller.text.isEmpty){
      ToastClass.showToast('Please enter password.', 'assets/only_logo.png');
      //snackbar('Please Enter Password.',context);
    }else{
      await getLogin(context);
    }
  }

  clear(){
    emailController.clear();
    passwordcontroller.clear();
  }


  final Token=''.obs;


  getLogin(context) async {
    try {
      isLoading(true);

      var response = await ApiService().Login(emailController.text, passwordcontroller.text,);

      if (response['status'] == true) {
        print('token-----------------${response['token']}');
      //  snackbar(response['message'],context);

        ToastClass.showToast('${response['message']}', 'assets/only_logo.png');


        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', response['token'].toString());

        //Token.value=response['token'].toString();

         await my_local_service.updateSharedPreferencesFromServer(response['token'].toString());
        Get.toNamed(Routes.DESHBOARD_SCREEN);


        isLoading(false);

        emailController.clear();
        passwordcontroller.clear();

      } else if (response['status'] == false) {
        ToastClass.showToast('${response['message']}', 'assets/only_logo.png');
        isLoading(false);
      }

    } finally {

      isLoading(false);


    }
  }


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
