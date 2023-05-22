import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../models/Photo_Gallery_Model.dart';
import '../../../utils/constants/api_service.dart';

class ShortVideoController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement PhotosVidiosGalleryController


  final List<String> videoUrls = [
    // 'https://www.youtube.com/shorts/g0LaEJIpI-0',
    // 'https://www.dropbox.com/s/df2d2gf1dvnr5uj/Sample_1280x720_mp4.mp4',
    // 'https://www.youtube.com/watch?v=UrrqjI1RJ2A',
    'https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/1080/Big_Buck_Bunny_1080_10s_1MB.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
    'https://youtu.be/OJG3TyC9TLA.mp4',
    // Add more video URLs here
  ];
  final count = 0.obs;


  final ScrollController scrollController = ScrollController();

  double offset = 0;
  @override
  void onInit() {
    scrollController.addListener(function);
  }

  function() {

    offset = scrollController.offset;

  }

  @override
  void dispose() {
    // ytbPlayerController!.dispose();
    // TODO: implement dispose
    super.dispose();
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


class ShortVideoItem extends StatefulWidget {
  final String videoUrl;

  ShortVideoItem({required this.videoUrl});

  @override
  _ShortVideoItemState createState() => _ShortVideoItemState();
}

class _ShortVideoItemState extends State<ShortVideoItem> {
   VideoPlayerController? _videoPlayerController;
   ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      looping: true,
      showControls: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController!.dispose();
    _chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Chewie(
        controller: _chewieController!,
      ),
    );
  }
}