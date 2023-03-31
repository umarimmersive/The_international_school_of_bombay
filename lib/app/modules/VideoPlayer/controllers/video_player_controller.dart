import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer_Controller extends GetxController {
  //TODO: Implement VideoPlayerController
  late VideoPlayer_Controller controller;
  final count = 0.obs;
  @override
  void onInit() {

   /* controller = (VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
      }));*/
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
