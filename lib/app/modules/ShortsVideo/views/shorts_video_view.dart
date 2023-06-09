/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/api_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text.dart';
import '../../PhotoGallary/views/photo_gallary_view.dart';
import '../controllers/photos_videos_gallery_controller.dart';

class PhotosVideosGalleryView extends GetView<PhotosVideosGalleryController> {
  const PhotosVideosGalleryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
          body: Obx(()=>
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // give the tab bar a height [can change hheight to preferred height]
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(
                        25.0,
                      ),
                    ),
                    child: TabBar(
                      controller: controller.tabController,
                      // give the indicator a decoration (color and border radius)
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          25.0,
                        ),
                        color: ColorValues.kRedColor,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        // first tab [you can add an icon using the icon property]
                        Tab(
                          text: 'Images',
                        ),

                        // second tab [you can add an icon using the icon property]
                        Tab(
                          text: 'Videos',
                        ),
                      ],
                    ),
                  ),
                  // tab bar view here
                  Expanded(
                    child: TabBarView(
                      physics: BouncingScrollPhysics(),
                      controller: controller.tabController,
                      children: [
                        // first tab bar view widget
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            child: GridView.builder(
                                itemCount: controller.PhotoVideoGallery.length,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio:  3.6 / 3.5,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 00,
                                    crossAxisCount: 2),
                                itemBuilder: (BuildContext, index) {
                                  return Padding(
                                    padding:
                                    const EdgeInsets.only(top: 0, bottom: 0),
                                    child: InkWell(
                                      onTap: () {
                                        var data={
                                          'id':controller.PhotoVideoGallery[index].id.toString(),
                                          'title':controller.PhotoVideoGallery[index].title.toString(),
                                        };

                                        print('dataaaaa-------------$data');
                                        Get.toNamed(Routes.PHOTO_GALLARY,parameters: data);
                                       */
/* Get.to(PhotoGallaryView(
                                          id: controller
                                              .PhotoVideoGallery[index].id
                                              .toString(),
                                          title: controller
                                              .PhotoVideoGallery[index].title
                                              .toString(),
                                        ));*//*

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
                                                padding: const EdgeInsets.only(bottom: 0.0),
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

                        // second tab bar view widget
                        Obx(()=>
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 10,
                              ),

                              MediaQuery.of(context).size.height<360?
                              _buildYtbView():
                                  Expanded(
                                     flex: 3,
                                      child: _buildYtbView()),
                              _buildMoreVideoTitle(),
                             // player,
                              Expanded(
                                flex: 7,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.only(top: 10),
                                    itemCount: controller.VideoGallery.length,
                                    itemBuilder: (BuildContext, index) {
                                      return InkWell(
                                        focusColor: ColorValues.kRedColor,
                                        highlightColor:  ColorValues.kRedColor,
                                        onTap: (){
                                          final _newCode = controller.VideoGallery[index].item_value;
                                          controller.ytbPlayerController!.load(_newCode!);
                                          //controller.Player(url: controller.VideoGallery[index].item_value);
                                        },
                                        child: Padding(
                                            padding: const EdgeInsets.only(top: 0),
                                            child: Card(
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 100,
                                                      width: 90,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/youtube.png"),
                                                              fit: BoxFit.cover)
                                                      ),
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
                                                            "${controller.VideoGallery[index].title!}",
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )),
                                      );
                                    }),
                              )
                            ],
                          ),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

     */
/* DefaultTabController(
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
            body:

            Obx(() {
              if (controller.isLoading.isTrue) {
                return Center(
                    child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
              } else {
                return TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [

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
                                    const EdgeInsets.only(top: 0, bottom: 0),
                                child: InkWell(
                                  onTap: () {
                                     var data={
                                      'id':controller.PhotoVideoGallery[index].id.toString(),
                                      'title':controller.PhotoVideoGallery[index].title.toString(),
                                    };
                                    Get.toNamed(Routes.PHOTO_GALLARY,parameters: data);
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
                                        padding: const EdgeInsets.only(bottom: 0.0),
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


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        player,
                        ListView.builder(
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
                            })
                      ],
                    )
                  ],
                );
              }
            })

        );
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
    );*//*

  }

  _buildYtbView() {
    return Padding(
      padding: EdgeInsets.only(left: 5.0,right: 5,top: 5),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: controller.ytbPlayerController != null
            ? YoutubePlayerIFrame(controller: controller.ytbPlayerController)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }

  _buildMoreVideoTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 182, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "More videos",
            style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
*/




import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../../../utils/global_widgets/containt_screen.dart';
import '../../../utils/global_widgets/short_video_widget.dart';
import '../controllers/shorts_video_controller.dart';

class ShortVideoView extends GetView<ShortVideoController> {
   ShortVideoView({Key? key}) : super(key: key);

   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: Colors.black,
       body: SafeArea(
         child: Container(
           child: Stack(
             children: [
               //We need swiper for every content

               Swiper(
                 itemBuilder: (BuildContext context, int index) {
                   return ContentScreen(
                     src: controller.videoUrls[index],
                   );
                 },

                 itemCount: controller.videoUrls.length,
                 scrollDirection: Axis.vertical,
               ),
             ],
           ),
         ),
       ),
     );
   }

 /*  @override
   Widget build(BuildContext context) {
     print("Screen height:${MediaQuery.of(context).size.height} ");

     return Scaffold(
         appBar: AppBar(),
         extendBodyBehindAppBar: true,
         body: ListView.builder(
             itemCount: controller.videoUrls.length,
             addAutomaticKeepAlives: false,
             controller: controller.scrollController,
             itemBuilder: (ctx, index) {
               print(
                   " $index: Offset ($controller.offset) is between  ${(250 * index) - 140} and  ${(250 * index)}");

               return MyVideoWidget(
                 videoUrl: controller.videoUrls[index],
                 index: index,
                 thumbNailUrl: "thumbNail_$index",
                 isPositioned:
                 controller.offset <= (250 * index) && controller.offset >= (250 * index) - 140,
                 key: ObjectKey(controller.videoUrls[index]),
               );
             }));
   }*/

   // Widget build(BuildContext context) {
   //   return Scaffold(
   //     appBar: AppBar(
   //       title: Text('Shorts'),
   //     ),
   //     body:Swiper(
   //       // layout: SwiperLayout.CUSTOM,
   //       // customLayoutOption: new CustomLayoutOption(
   //       //     startIndex: -1,
   //       //     stateCount: 3
   //       // ).addRotate([
   //       //   -45.0/180,
   //       //   0.0,
   //       //   45.0/180
   //       // ]).addTranslate([
   //       //   new Offset(-370.0, -40.0),
   //       //   new Offset(0.0, 0.0),
   //       //   new Offset(370.0, -40.0)
   //       // ]),
   //       // containerHeight: MediaQuery.of(context).size.height,
   //       // itemHeight: MediaQuery.of(context).size.height,
   //       autoplayDisableOnInteraction: true,
   //
   //       scrollDirection: Axis.vertical,
   //       itemCount: controller.videoUrls.length,
   //       itemBuilder: (context, index) {
   //         return ShortVideoItem(videoUrl: controller.videoUrls[0]);
   //       },
   //       loop: false,
   //       viewportFraction: 0.8,
   //       scale: 0.9,
   //       autoplay: true,
   //     ),
   //   );
   // }
}
