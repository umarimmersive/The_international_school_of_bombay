import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_gallary_controller.dart';

class VideoGallaryView extends GetView<VideoGallaryController> {
  const VideoGallaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoGallaryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VideoGallaryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
