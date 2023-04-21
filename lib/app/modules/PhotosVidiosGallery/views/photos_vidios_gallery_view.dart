import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                "Vidios",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
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
            ),

            //  for Vidios=============================================================//
            SingleChildScrollView(
              child: InkWell(
                onTap: () {
                  Get.toNamed("/video-play-screen");
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, top: 25, bottom: 13),
                      child: Text(
                        "Latest",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
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
                              padding:
                                  const EdgeInsets.only(left: 15, right: 2),
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
                      padding:
                          const EdgeInsets.only(left: 15, top: 25, bottom: 13),
                      child: Text(
                        "Most Watched",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
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
                              padding:
                                  const EdgeInsets.only(left: 15, right: 2),
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
                      padding:
                          const EdgeInsets.only(left: 15, top: 25, bottom: 13),
                      child: Text(
                        "Events",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
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
                              padding:
                                  const EdgeInsets.only(left: 15, right: 2),
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
                      padding:
                          const EdgeInsets.only(left: 15, top: 25, bottom: 13),
                      child: Text(
                        "Watch before you go",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
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
                              padding:
                                  const EdgeInsets.only(left: 15, right: 2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(5.0),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(Routes.VIDEO_PLAYER);
                                            },
                                            child: Image.asset(
                                              controller.forth[index],
                                              width: 140,
                                              height: 120,
                                              fit: BoxFit.fill,
                                            ),
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
            )
          ],
        ),
      ),
    );
  }
}
