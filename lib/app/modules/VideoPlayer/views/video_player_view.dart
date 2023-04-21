import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_player_controller.dart';

class VideoPlayerView extends GetView<VideoPlayer_Controller> {
  const VideoPlayerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: const Center(
        child: Text(
          'VideoPlayerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
