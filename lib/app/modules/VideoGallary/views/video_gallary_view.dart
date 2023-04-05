import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/video_gallary_controller.dart';

class VideoGallaryView extends GetView<VideoGallaryController> {
  const VideoGallaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar('Video Gallary'),
        body: SingleChildScrollView(
          child: InkWell(
            onTap: () {
              Get.toNamed("/video-play-screen");
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 25, bottom: 13),
                  child: Text(
                    "Latest",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      itemCount: controller.first.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15, right: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        controller.first[index],
                                        width: 140,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                      Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Adivo Alladivo",
                                  maxLines: 2,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 25, bottom: 13),
                  child: Text(
                    "Most Watched",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15, right: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        controller.second[index],
                                        width: 140,
                                        height: 120,
                                        fit: BoxFit.fill,
                                      ),
                                      Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Sundarakanda",
                                  maxLines: 2,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 25, bottom: 13),
                  child: Text(
                    "Events",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15, right: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        controller.third[index],
                                        width: 140,
                                        height: 120,
                                        fit: BoxFit.fill,
                                      ),
                                      Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                  "Sundarakanda",
                                  maxLines: 2,
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w300),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 25, bottom: 13),
                  child: Text(
                    "Watch before you go",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 15, right: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Image.asset(
                                        controller.forth[index],
                                        width: 140,
                                        height: 120,
                                        fit: BoxFit.fill,
                                      ),
                                      Icon(
                                        Icons.play_circle_outline,
                                        color: Colors.white,
                                      )
                                    ],
                                  )),
                              Text(
                                "Adivo Alladivo",
                                maxLines: 2,
                                style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
