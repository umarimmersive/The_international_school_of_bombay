import 'package:get/get.dart';

import '../../../models/Slider_details_model.dart';
import '../../../utils/constants/api_service.dart';

class HomeSliderDetailsController extends GetxController {
  //TODO: Implement HomeSliderDetailsController

  final count = 0.obs;

  final Description = 'The makers of sports drinks spend tens to hundreds of millions of '
      'dollars advertising their products each year. Among the benefits often featured in'
      ' these ads are the beverages high level of electrolytes, which your body loses '
      'as you sweat. In this science project, you will compare the amount of electrolytes in '
      'a sports drink with those in orange juice to find out which has more electrolytes '
      'to replenish the ones you lose as you work out or play sports. When you are finished, '
      'you might even want to make your own sports drink! "Just do it!" You have probably heard that slogan, and there is no doubt that exercise is a key part of staying healthy. But exercising depletes the bodys stores of fluids and minerals, which must be replaced. Most experts agree that if you are engaged in light to moderate exercise, drinking a glass or two of water should do the trick. But if you are exercising strenuously, you also need to replenish some of the salts that your body loses through sweat. These salts, or electrolytes, are found in most sports drinks, and also in natural juices like orange juice.'.obs;

  final images=''.obs;
  final title =''.obs;
  final maintittle=''.obs;
  final id =''.obs;
  @override
  void onInit() {
    id.value=Get.parameters['id'].toString();

    maintittle.value=Get.parameters['maintitle'].toString();

    images.value=Get.parameters['images'].toString();
    title.value=Get.parameters['title'].toString();
    Get_slider_details();
    super.onInit();
  }

  final isLoading=false.obs;
  final Slider_details = <Slider_details_model>[].obs;

  Future Get_slider_details() async {
    try {
      isLoading(true);
      var response = await ApiService()
          .Slider_Details(id);
      if (response['status'] == true) {

        print('--------------${response}');

        List dataList = response['data'].toList();
        Slider_details.value = dataList.map((json) => Slider_details_model.fromJson(json)).toList();


        update();
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
