import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text.dart';
import '../controllers/photos_vidios_gallery_controller.dart';

class PhotosVidiosGalleryView extends GetView<PhotosVidiosGalleryController> {
  const PhotosVidiosGalleryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Text(
                "Photos",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "Videos",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15),
              )
              // Add Tabs here
            ],
          ),
          title: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
              Text(
                "Gallery",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lato',
                ),
              ),
            ],
          ),
          // title: const Text('Internal Refer Program'),
          backgroundColor: ColorValues.kRedColor,
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),

          //dragStartBehavior: DragStartBehavior.down,

          children: [
            // for images============================================================
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: GridView.builder(
                    itemCount: controller.sport_image_data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3.9 / 3.5,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 00,
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 3),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PHOTO_GALLARY);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)),
                                elevation: 3,
                                margin: EdgeInsets.zero,
                                child: Container(
                                  height: 120,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        "${controller.sport_image_data[index]}",
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Flexible(
                                  child: GlobalLocalText(
                                text: "${controller.albamname[index]}",
                                size: 15,
                                fontWeight: FontWeight.w400,
                              )),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),

            //  for Vidios=============================================================//
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  YoutubePlayer(
                      controller: YoutubePlayerController(
                          initialVideoId: "6jZDSSZZxjQ",
                          flags: YoutubePlayerFlags(
                              disableDragSeek: true,
                              forceHD: false,
                              autoPlay: false,
                              showLiveFullscreenButton: false))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlobalLocalText(
                      text: "Events",
                      fontWeight: FontWeight.bold,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        itemCount: 3,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10)),
                              width: 200,
                              child: Stack(
                                children: [
                                  YoutubePlayer(
                                    controller: YoutubePlayerController(
                                        initialVideoId:
                                            controller.vedeoid[index],
                                        flags: YoutubePlayerFlags(
                                          disableDragSeek: true,
                                          autoPlay: false,
                                          loop: false,
                                          enableCaption: false,
                                          forceHD: false,
                                        )),
                                  ),
                                  Text("jkjkjjkjkj")
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.vedeoid.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              YoutubePlayer(
                                controller: YoutubePlayerController(
                                    initialVideoId: controller.vedeoid[index],
                                    flags: YoutubePlayerFlags(
                                      disableDragSeek: true,
                                      autoPlay: false,
                                      loop: false,
                                      enableCaption: false,
                                      forceHD: false,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GlobalLocalText(
                                  text: "Most Loved",
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
