import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../controllers/video_player_controller.dart';

class VideoPlayerView extends GetView<VideoPlayer_Controller> {
  const VideoPlayerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(VideoPlayer_Controller());
    return Scaffold(
      backgroundColor: Colors.black,
        body: Center(
          child: AspectRatio(aspectRatio: 16/9,child: FlickVideoPlayer(flickManager: controller.flickManager,),)
        ),

    );
  }
}
