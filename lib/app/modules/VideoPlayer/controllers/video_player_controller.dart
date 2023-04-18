import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flick_video_player/flick_video_player.dart';

class VideoPlayer_Controller extends GetxController {
  //TODO: Implement VideoPlayerController
  late VideoPlayer_Controller controllerr;
  final count = 0.obs;

  late VideoPlayerController videoPlayerController;
  late Future<void> videoPlayerFuture;
  final FlickManager flickManager = FlickManager(videoPlayerController: VideoPlayerController.network("https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));

  @override
  void onInit() {
    // videoPlayerController = VideoPlayerController.network(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    //
    // videoPlayerFuture = videoPlayerController.initialize();
    //
    // videoPlayerController.setLooping(true);
    // videoPlayerController.play();
    // videoPlayerController.pause();


    // controllerr = (VideoPlayerController.network(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //   })) as VideoPlayer_Controller;
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
