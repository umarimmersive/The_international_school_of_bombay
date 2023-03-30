import 'package:get/get.dart';

class PhotoViewController extends GetxController {
  //TODO: Implement PhotoViewController

  final count = 0.obs;
  final photo = ''.obs;
  final index = ''.obs;
  @override
  void onInit() {
    photo.value=Get.parameters['photo'].toString();
    index.value=Get.parameters['index'].toString();

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
