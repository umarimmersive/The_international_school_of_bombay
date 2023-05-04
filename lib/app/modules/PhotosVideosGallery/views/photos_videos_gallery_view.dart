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
                                crossAxisCount: 2
                            ),
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
                                    // Get.to(PhotoGallaryView(
                                    //   gallery_id: controller
                                    //       .PhotoVideoGallery[index].id
                                    //       .toString(),
                                    //   title: controller
                                    //       .PhotoVideoGallery[index].title
                                    //       .toString(),
                                    // ));
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

                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // player,
                          ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(top: 10),
                            itemCount: 8,
                            physics: NeverScrollableScrollPhysics(),
                            // addSemanticIndexes: false,
                            itemBuilder: (BuildContext, index) {
                              return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: index == 2
                                      ?Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: GlobalLocalText(
                                              text: "Shorts",
                                              fontWeight: FontWeight.bold,
                                              size: 16,
                                            ),
                                          ),
                                          Padding(
                                    padding: const EdgeInsets.only(bottom: 15.0),
                                    child: SizedBox(
                                          height: 280,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: 6,
                                              shrinkWrap: true,
                                              itemBuilder: (BuildContext, index) {
                                                return InkWell(
                                                    onTap: () {
                                                      // var data = {
                                                      //   /* "maintitle": "${controller.slider_data[index]['maintitle']}",
                                                      // "title": "${controller.slider_data[index]['title']}",
                                                      // "images": "${controller.slider_data[index]['images']}",*/
                                                      //   "id": "${controller.Slider[index].id}"
                                                      // };
                                                      // Get.toNamed(Routes.HOME_SLIDER_DETAILS,
                                                      //     parameters: data);
                                                      //  HomeSliderDetailsView
                                                    },
                                                    child:
                                                    Padding(
                                                        padding: EdgeInsets.only(left: 10,right: 10),
                                                        child: Stack(
                                                          clipBehavior: Clip.hardEdge,
                                                          children: [
                                                            Container(
                                                              clipBehavior: Clip.hardEdge,
                                                              decoration: BoxDecoration(
                                                                borderRadius:
                                                                BorderRadius.circular(10),
                                                              ),
                                                              height: 400,
                                                              width: 180,
                                                              child: Image.asset('assets/images/S2.jpg',fit: BoxFit.cover),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(top: 200.0),
                                                              child: Container(
                                                                height: 80,
                                                                width: 180,
                                                                decoration: BoxDecoration(
                                                                  color: Colors.black54,
                                                                  borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.zero,
                                                                    topRight: Radius.zero,
                                                                    bottomLeft:  Radius.circular(10.0),
                                                                    bottomRight:  Radius.circular(10.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets.only(top: 160),
                                                              padding: EdgeInsets.symmetric(horizontal: 10),
                                                              height: 80,
                                                              width: 180,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment.end,
                                                                children: [

                                                                  Text(
                                                                    textAlign: TextAlign.justify,
                                                                    maxLines: 2,
                                                                    "9 साल के Aaryav का सपना है KBC Host करना | Kaun Banega Crorepati Season",
                                                                    style: TextStyle(
                                                                        overflow:
                                                                        TextOverflow.ellipsis,
                                                                        fontSize: 12.5,
                                                                        fontWeight: FontWeight.w500,
                                                                        color: Colors.white),
                                                                  )
                                                                ],
                                                              ),
                                                            )



                                                          ],
                                                        )
                                                    )
                                                  /* Padding(
                                              padding: const EdgeInsets.only(left: 10),
                                              child: Container(
                                                height: 80,
                                                width: 220,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    image: DecorationImage(
                                                        image: NetworkImage(ApiService.IMAGE_URL+controller.Slider[index].image!),
                                                        fit: BoxFit.cover)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      right: 5, bottom: 10, left: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        controller.Slider[index].title!,
                                                        style: TextStyle(
                                                            fontFamily: "Roboto",
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 13.5,
                                                            color: Colors.white),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        textAlign: TextAlign.justify,
                                                        maxLines: 3,
                                                        controller.Slider[index].short_description!,
                                                        style: TextStyle(
                                                            overflow:
                                                            TextOverflow.ellipsis,
                                                            fontSize: 12.5,
                                                            fontWeight: FontWeight.w500,
                                                            color: Colors.yellow),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                              ),*/
                                                );
                                              }),
                                    ),
                                  ),
                                        ],
                                      )
                                      :index == 4
                                      ?Card(
                                    child: Container(
                                      child: Flexible(
                                        child: Image.asset('assets/images/dummy_add.jpeg')
                                      ),
                                    ),
                                  )
                                      :Card(
                                    child: Container(
                                      child: Flexible(
                                        child: Column(
                                          children: [
                                            YoutubePlayer(
                                                controller: YoutubePlayerController(
                                                    initialVideoId: "nPt8bK2gbaU",
                                                    flags: YoutubePlayerFlags(

                                                        disableDragSeek: true,
                                                        forceHD: false,
                                                        autoPlay: false,
                                                        showLiveFullscreenButton: true
                                                    )
                                                )
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.symmetric(vertical: 10,horizontal:5 ),
                                                  height: 60,
                                                  width: 60,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "assets/images/s1.jpg"),
                                                          fit: BoxFit.cover)
                                                  ),
                                                  // child: Icon(
                                                  //   Icons.play_arrow,
                                                  //   color: Colors.white,
                                                  // ),
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                              );
                            },
                          ),

                          //
                          //
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: 15.0),
                          //   child: SizedBox(
                          //     height: 280,
                          //     child: ListView.builder(
                          //         scrollDirection: Axis.horizontal,
                          //         itemCount: 6,
                          //         shrinkWrap: true,
                          //         itemBuilder: (BuildContext, index) {
                          //           return InkWell(
                          //               onTap: () {
                          //                 // var data = {
                          //                 //   /* "maintitle": "${controller.slider_data[index]['maintitle']}",
                          //                 // "title": "${controller.slider_data[index]['title']}",
                          //                 // "images": "${controller.slider_data[index]['images']}",*/
                          //                 //   "id": "${controller.Slider[index].id}"
                          //                 // };
                          //                 // Get.toNamed(Routes.HOME_SLIDER_DETAILS,
                          //                 //     parameters: data);
                          //                 //  HomeSliderDetailsView
                          //               },
                          //               child:
                          //               Padding(
                          //                   padding: EdgeInsets.only(left: 10,right: 10),
                          //                   child: Stack(
                          //                     clipBehavior: Clip.hardEdge,
                          //                     children: [
                          //                       Container(
                          //                         clipBehavior: Clip.hardEdge,
                          //                         decoration: BoxDecoration(
                          //                           borderRadius:
                          //                           BorderRadius.circular(10),
                          //                         ),
                          //                         height: 400,
                          //                         width: 180,
                          //                         child: Image.asset('assets/images/S2.jpg',fit: BoxFit.cover),
                          //                       ),
                          //                       Padding(
                          //                         padding: const EdgeInsets.only(top: 200.0),
                          //                         child: Container(
                          //                           height: 80,
                          //                           width: 180,
                          //                           decoration: BoxDecoration(
                          //                             color: Colors.black54,
                          //                             borderRadius: BorderRadius.only(
                          //                               topLeft: Radius.zero,
                          //                               topRight: Radius.zero,
                          //                               bottomLeft:  Radius.circular(10.0),
                          //                               bottomRight:  Radius.circular(10.0),
                          //                             ),
                          //                           ),
                          //                         ),
                          //                       ),
                          //                       Container(
                          //                         margin: EdgeInsets.only(top: 160),
                          //                         padding: EdgeInsets.symmetric(horizontal: 10),
                          //                         height: 80,
                          //                         width: 180,
                          //                         child: Column(
                          //                           crossAxisAlignment:
                          //                           CrossAxisAlignment.start,
                          //                           mainAxisAlignment:
                          //                           MainAxisAlignment.end,
                          //                           children: [
                          //
                          //                             Text(
                          //                               textAlign: TextAlign.justify,
                          //                               maxLines: 2,
                          //                               "9 साल के Aaryav का सपना है KBC Host करना | Kaun Banega Crorepati Season",
                          //                               style: TextStyle(
                          //                                   overflow:
                          //                                   TextOverflow.ellipsis,
                          //                                   fontSize: 12.5,
                          //                                   fontWeight: FontWeight.w500,
                          //                                   color: Colors.white),
                          //                             )
                          //                           ],
                          //                         ),
                          //                       )
                          //
                          //
                          //
                          //                     ],
                          //                   )
                          //               )
                          //             /* Padding(
                          //                 padding: const EdgeInsets.only(left: 10),
                          //                 child: Container(
                          //                   height: 80,
                          //                   width: 220,
                          //                   decoration: BoxDecoration(
                          //                       borderRadius:
                          //                       BorderRadius.circular(10),
                          //                       image: DecorationImage(
                          //                           image: NetworkImage(ApiService.IMAGE_URL+controller.Slider[index].image!),
                          //                           fit: BoxFit.cover)
                          //                   ),
                          //                   child: Padding(
                          //                     padding: const EdgeInsets.only(
                          //                         right: 5, bottom: 10, left: 10),
                          //                     child: Column(
                          //                       crossAxisAlignment:
                          //                       CrossAxisAlignment.start,
                          //                       mainAxisAlignment:
                          //                       MainAxisAlignment.end,
                          //                       children: [
                          //                         Text(
                          //                           controller.Slider[index].title!,
                          //                           style: TextStyle(
                          //                               fontFamily: "Roboto",
                          //                               overflow:
                          //                               TextOverflow.ellipsis,
                          //                               fontWeight: FontWeight.w600,
                          //                               fontSize: 13.5,
                          //                               color: Colors.white),
                          //                         ),
                          //                         SizedBox(
                          //                           height: 5,
                          //                         ),
                          //                         Text(
                          //                           textAlign: TextAlign.justify,
                          //                           maxLines: 3,
                          //                           controller.Slider[index].short_description!,
                          //                           style: TextStyle(
                          //                               overflow:
                          //                               TextOverflow.ellipsis,
                          //                               fontSize: 12.5,
                          //                               fontWeight: FontWeight.w500,
                          //                               color: Colors.yellow),
                          //                         )
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 )
                          //                 ),*/
                          //           );
                          //         }),
                          //   ),
                          // ),
                          //

                        ],
                      ),
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
                    showLiveFullscreenButton: true
                )
            )
        ),



      ),
    );
  }


}
