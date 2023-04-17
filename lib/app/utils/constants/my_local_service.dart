
import 'dart:convert' as convert;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_modal.dart';
import '../../routes/app_pages.dart';
import '../global_widgets/globle_var.dart';
import 'api_service.dart';

class my_local_service{

  static UserModal updateSharedPreferences(Map userMap){
    print('0-----------------------');
    String userDataString  = convert.jsonEncode(userMap);
    print('updating sharedpreference : $userDataString');
    sharedPreference.setString('userData', userDataString);
    userData = UserModal.fromJson(userMap);
    print('the userdata is ${userData}');
    return userData!;
  }


  static Future<UserModal> updateSharedPreferencesFromServer(String token) async{
    sharedPreference = await SharedPreferences.getInstance();

    Map userMap = await ApiService().userProfile(token : token);

    print('------------------------usar map ----------------$userMap');

    return updateSharedPreferences(userMap['data'][0]);
    // retur
  }


  static bool isLoggedIn(){
    if(sharedPreference.getString('userData')==null){
      print('the user login status is false');
      return false;
    }else{
      Map userMap = convert.jsonDecode(sharedPreference.getString('userData')!);
      updateSharedPreferences(userMap);
      print('the user login status is true');
      return true;
    }
  }

  static void logout(){
    sharedPreference!.clear();
    Get.toNamed(Routes.LOGIN);

    // Get.offAll(PreLoginScreen());
    userData = null;
  }



}