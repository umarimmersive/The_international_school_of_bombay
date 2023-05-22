import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:shree_sadguru_gajanan_maharaj_sewashram/app/option_screen.dart';
import 'package:video_player/video_player.dart';

import 'like_screen.dart';
import 'option_screen.dart';
// import 'like_screen.dart';

class ContentScreen extends StatefulWidget {
  final String? src;

  const ContentScreen({Key? key, this.src}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;


  ChewieController? _chewieController;
  bool _liked = false;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: Container(
        height: MediaQuery.of(context).size.height,
         child: Stack(
          fit: StackFit.expand,
          children: [
            _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
                ? GestureDetector(
              onDoubleTap: () {
                setState(() {
                  _liked = !_liked;
                });
              },
              child: Chewie(
                controller: _chewieController!,
              ),
            )
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Colors.red,
                ),
                SizedBox(height: 10),
                Text('Loading...')
              ],
            ),
            if (_liked)
              Center(
                child: LikeIcon(),
              ),
            OptionsScreen()
          ],
        ),
      ),
    );
  }
}