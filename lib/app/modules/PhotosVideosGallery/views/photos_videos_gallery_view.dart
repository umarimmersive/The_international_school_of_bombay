import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/api_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text.dart';
import '../../PhotoGallary/views/photo_gallary_view.dart';
import '../controllers/photos_videos_gallery_controller.dart';

class PhotosVideosGalleryView extends GetView<PhotosVideosGalleryController> {
  const PhotosVideosGalleryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: YoutubePlayerBuilder(builder: (context,player) {
        return Scaffold(
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
            body: Obx(() {
              if (controller.isLoading.isTrue) {
                return Center(
                    child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
              } else {
                return TabBarView(
                  physics: BouncingScrollPhysics(),

                  //dragStartBehavior: DragStartBehavior.down,

                  children: [
                    // for images============================================================
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 0),
                        child: GridView.builder(
                            itemCount: controller.PhotoVideoGallery.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 3.9 / 3.5,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 00,
                                    crossAxisCount: 2),
                            itemBuilder: (BuildContext, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(top: 0, bottom: 3),
                                child: InkWell(
                                  onTap: () {
                                    /* var data={
                                      'id':controller.PhotoVideoGallery[index].id.toString(),
                                      'title':controller.PhotoVideoGallery[index].title.toString(),
                                    };
                                    Get.toNamed(Routes.PHOTO_GALLARY,parameters: data);*/
                                    Get.to(PhotoGallaryView(
                                      gallery_id: controller
                                          .PhotoVideoGallery[index].id
                                          .toString(),
                                      title: controller
                                          .PhotoVideoGallery[index].title
                                          .toString(),
                                    ));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        elevation: 3,
                                        margin: EdgeInsets.zero,
                                        child: Container(
                                          height: 120,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                    "${ApiService.IMAGE_URL + controller.PhotoVideoGallery[index].item_value!}",
                                                fit: BoxFit.fill,
                                              )),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Flexible(
                                          child: Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: GlobalLocalText(
                                          text:
                                              "${controller.PhotoVideoGallery[index].title}",
                                          size: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),

                    //  for Vidios=============================================================//
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        player,
                        Expanded(
                          child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10),
                              itemCount: 7,
                              itemBuilder: (BuildContext, index) {
                                return Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Card(
                                      child: Container(
                                        child: Flexible(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 100,
                                                width: 90,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            "assets/images/s1.jpg"),
                                                        fit: BoxFit.cover)),
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Flexible(
                                                child: Column(
                                                  children: [
                                                    GlobalLocalText(
                                                      maxLines: 3,
                                                      text:
                                                      "9 साल के Aaryav का सपना है KBC Host करना | Kaun Banega Crorepati Season",
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                        )
                      ],
                    )
                  ],
                );
              }
            }));
      },
          player: YoutubePlayer(
          controller: YoutubePlayerController(
          initialVideoId: "nPt8bK2gbaU",
          flags: YoutubePlayerFlags(

              disableDragSeek: true,
              forceHD: false,
              autoPlay: false,
              showLiveFullscreenButton: true))),



    ),
    );
  }
}
