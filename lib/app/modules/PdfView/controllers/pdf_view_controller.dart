import 'package:get/get.dart';

class PdfViewController extends GetxController {
  //TODO: Implement PdfViewController

  final count = 0.obs;
  final title = ''.obs;

  @override
  void onInit() {
    title.value=Get.parameters['title'].toString();
    print('----------------${title.value}');
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
