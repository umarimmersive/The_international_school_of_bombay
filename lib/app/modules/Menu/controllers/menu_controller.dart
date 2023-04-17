import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_international_school_of_bombay/app/utils/shared_prefrence/shared_prefrences_constant.dart';

class MenuuController extends GetxController {
  //TODO: Implement MenuController

  final isSwitched = false.obs;
  late SharedPreferences preferences;

  final isDarkMode = "true".obs;

  List data = [
    {
      'title': 'A Blood Donation Camp To Be Help',
    },
    {
      'title': 'An Exhibition',
    },
    {
      'title': 'An lnauguration To Take Place',
    },
    {
      'title': 'A Lost and Found Notice',
    },
    {
      'title': 'A Blood Donation Camp To Be Help',
    },
  ];
  final count = 0.obs;
  @override
  Future<void> onInit1() async {
    print("async async");
    super.onInit();
    preferences = await SharedPreferences.getInstance();

    isDarkMode.value = preferences.getString(SDConstant.isDark)!;
    isDarkMode.value == "true" ? isSwitched.value = true : false;
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
