import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/checkbox_list_tile/gf_checkbox_list_tile.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/api_service.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/my_local_service.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/Text_widget.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/globle_var.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/constants/ShowToast.dart';
import '../../../utils/global_widgets/Text.dart';
import '../../../utils/global_widgets/buttons.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  TabController? _tabController;

  HomeScreenView({Key? key}) : super(key: key);

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    var color = (isDark(context) ? Color(0xFF414040) : Colors.white).obs;
    var color1 = (isDark(context) ? Colors.white : Colors.black).obs;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child:  Obx((){
        if(controller.isLoading.isTrue){
          return Center(
              child: SpinKitThreeBounce(
                color: Colors.red,
                size: 40,
              ));
        }else{
          return Scaffold(
            body: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverAppBar(
                    titleSpacing: 0,
                    toolbarHeight: 80,
                    excludeHeaderSemantics: true,
                    // backgroundColor: Color(0xFF+int.parse(controller.file_valude.value)),
                    backgroundColor: Color(0xFFD50000),
                    floating: false,
                    stretch: false,
                    automaticallyImplyLeading: false,
                    pinned: false,
                    //  title: Container(height:6000,color: Colors.transparent,),
                    expandedHeight: 175,
                    flexibleSpace: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 30),
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      userData!.profile_image.isNotEmpty?
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(5)),
                                        height: 60,
                                        width: 55,
                                        child: ClipRRect(
                                            borderRadius: BorderRadius.circular(5),
                                            child: Image.network(
                                              "${ApiService.IMAGE_URL+userData!.profile_image}",
                                              fit: BoxFit.cover,
                                            )),
                                      ):
                                      Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5)),
                                          height: 60,
                                          width: 55,
                                          child: Center(
                                            child: Text_widget(Simpletext: userData!.full_name.toString().substring(0,1)+userData!.lastname.toString().substring(0,1),
                                              fontSize: 15.0,maxLines: 1,color: Colors.red,
                                            ),
                                          )
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                GlobalLocalText(
                                                  text: "Hello,",
                                                  size: 16,
                                                  textColor: Colors.white,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                GlobalLocalText(
                                                  text: "${userData!.full_name}",
                                                  textColor: Colors.white,
                                                  size: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            GlobalLocalText(
                                              text: "Shift Morning",
                                              size: 12,
                                              textColor: Colors.white,
                                              fontWeight: FontWeight.w300,
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            Flexible(
                                              child: GlobalLocalText(
                                                size: 12,
                                                text: "${userData!.Class}, Section-${userData!.section}",
                                                textColor: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          _showSimpleDialog(context);
                                        },
                                        icon: Icon(
                                          size: 24,
                                          Icons.person,
                                          color: Colors.white,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          Get.toNamed(Routes.NOTIFICATION);
                                        },
                                        icon: Icon(
                                          size: 24,
                                          Icons.notifications,
                                          color: Colors.white,
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              margin: EdgeInsets.zero,
                              height: 80,
                              child: Stack(
                                children: [
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: color.value,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(30),
                                                topRight: Radius.circular(30))),
                                      )),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: CircleAvatar(
                                        backgroundColor: color.value,
                                        radius: 40,
                                        child: Image.network(
                                          "${ApiService.IMAGE_URL+controller.icon.value}",
                                          height: 50,
                                        ),
                                      ))
                                ],
                              ),
                            )),
                      ],
                    )
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                        (BuildContext context, int index) {
                      return Container(
                        color: color.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //  mainAxisSize: MainAxisSize.min,
                          children: [



                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Center(
                                child: Text_widget(
                                  Simpletext: '${controller.heading.value}',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),

                            Divider(color: ColorValues.kRedColor,thickness: 0.3,),
                            SizedBox(
                              height: 5,
                            ),

                            SizedBox(
                              height: 250,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.Slider.length,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext, index) {
                                    return InkWell(
                                      onTap: () {
                                        var data = {
                                          "maintitle": "${controller.slider_data[index]['maintitle']}",
                                          "title": "${controller.slider_data[index]['title']}",
                                          "images": "${controller.slider_data[index]['images']}",
                                          "id": "${controller.Slider[index].id}"
                                        };
                                        Get.toNamed(Routes.HOME_SLIDER_DETAILS,
                                            parameters: data);
                                        //  HomeSliderDetailsView
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Container(
                                            height: 80,
                                            width: 220,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        ApiService.IMAGE_URL+controller.Slider[index].image!),
                                                    fit: BoxFit.cover)),
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
                                          )),
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: GlobalLocalText(
                                text: "Explore More",
                                fontWeight: FontWeight.bold,
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                height: 125,
                                child: ListView.builder(
                                    itemCount: controller.title.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (BuildContext, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (index == 0) {
                                            Get.toNamed(Routes.LEAVES_SCREEN);
                                          } else if (index == 1) {
                                            Get.toNamed(Routes.NOTICE_BOARD);
                                          } else if (index == 2) {
                                            Get.toNamed(Routes.BUSROOT_SCREEN);
                                          } else if (index == 3) {
                                            Get.toNamed(Routes.SCHOOL_ROOLS_SCREEN);
                                          } else if (index == 4) {
                                            Get.toNamed(Routes.QUIRY_SCREEN);
                                          }
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, bottom: 05),
                                          child: Card(
                                              elevation: 03,
                                              margin: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: color.value,
                                                    borderRadius:
                                                    BorderRadius.circular(5)),
                                                // height: 70,
                                                //width: 120,
                                                child: Container(
                                                  width: 130,
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                          Color(ColorValues.RED),
                                                          child: Icon(
                                                            controller.icons[index],
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: GlobalLocalText(
                                                          text:
                                                          controller.title[index],
                                                          fontWeight: FontWeight.w400,
                                                          size: 15,
                                                          textAlign: TextAlign.center,
                                                          // wordSpacing: 1,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )),
                                        ),
                                      );
                                    }),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 10),
                              child: GlobalLocalText(
                                text: "Knowledge Base",
                                fontWeight: FontWeight.bold,
                                size: 16,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 3,
                              child: ListView.builder(
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 20, bottom: 20),
                                      child: Container(
                                        height:
                                        MediaQuery.of(context).size.height / 3,
                                        width:
                                        MediaQuery.of(context).size.width / 1.3,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(controller
                                                    .latesteventimage[index]),
                                                fit: BoxFit.cover),
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.blue),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, bottom: 0),
                                          child: Container(
                                            color: Colors.black38,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.end,
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(left: 18),
                                                  child: GlobalLocalText(
                                                    text: controller
                                                        .latestevents[index],
                                                    textColor: Colors.white,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 18, bottom: 10),
                                                  child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                        Color(ColorValues.RED),
                                                      ),
                                                      onPressed: () {
                                                        if (index == 0) {
                                                          Get.toNamed(
                                                              Routes.ARTICAL1);
                                                        } else if (index == 1) {
                                                          Get.toNamed(
                                                              Routes.ARTICAL2);
                                                        } else if (index == 2) {
                                                          Get.toNamed(
                                                              Routes.ARTICAL3);
                                                        } else if (index == 3) {
                                                          Get.toNamed(
                                                              Routes.ARTICAL4);
                                                        } else if (index == 4) {
                                                          Get.toNamed(
                                                              Routes.ARTICAL5);
                                                        }
                                                      },
                                                      child: GlobalLocalText(
                                                        textColor: Colors.white,
                                                        text: "Read More",
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.UPCOMING_EVENT);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Color(ColorValues.RED),
                                              child: Icon(
                                                Icons.update_rounded,
                                                color: Colors.white,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                GlobalLocalText(
                                                  text:
                                                  "Upcoming Events".toUpperCase(),
                                                  size: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                GlobalLocalText(
                                                  text:
                                                  "Check your daily events here",
                                                  size: 13.5,
                                                  textColor: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Card(
                                        color: Colors.white60,
                                        margin: EdgeInsets.zero,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: ColorValues.kRedColor,
                                            size: 18,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.ASSIGNMENT);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Color(ColorValues.RED),
                                              child: Icon(
                                                Icons.assessment,
                                                color: Colors.white,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                GlobalLocalText(
                                                  text: "Assignments".toUpperCase(),
                                                  size: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                GlobalLocalText(
                                                  text:
                                                  "Check your daily assignmets here",
                                                  size: 13.5,
                                                  textColor: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Card(
                                        color: Colors.white60,
                                        margin: EdgeInsets.zero,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: ColorValues.kRedColor,
                                            size: 18,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.SYLLABUS);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Color(ColorValues.RED),
                                              child: Icon(
                                                Icons.book,
                                                color: Colors.white,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                GlobalLocalText(
                                                  text: "SYLLABUS",
                                                  size: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                GlobalLocalText(
                                                  text:
                                                  "Syllabus for new academic year 2023-24",
                                                  size: 13.5,
                                                  textColor: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Card(
                                        color: Colors.white60,
                                        margin: EdgeInsets.zero,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: ColorValues.kRedColor,
                                            size: 18,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(),
                            SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed("/accedmic-content");
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Color(ColorValues.RED),
                                              child: Icon(
                                                Icons.theater_comedy_outlined,
                                                color: Colors.white,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                GlobalLocalText(
                                                  text: "ACADEMIC CONTENT",
                                                  size: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                GlobalLocalText(
                                                  text:
                                                  "Explore and check books online",
                                                  size: 13.5,
                                                  textColor: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Card(
                                        color: Colors.white60,
                                        margin: EdgeInsets.zero,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: ColorValues.kRedColor,
                                            size: 18,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(),
                            SizedBox(
                              height: 8,
                            ),
                            InkWell(
                              onTap: () {
                                var data = {"title": "Time Table"};
                                Get.toNamed("/time-table-screen");
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor: Color(ColorValues.RED),
                                              child: Icon(
                                                Icons.theater_comedy_outlined,
                                                color: Colors.white,
                                              )),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Flexible(
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                GlobalLocalText(
                                                  text: "TIME TABLE",
                                                  size: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                GlobalLocalText(
                                                  text: "Time table for year 2023-24",
                                                  size: 13.5,
                                                  textColor: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Card(
                                        color: Colors.white60,
                                        margin: EdgeInsets.zero,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: ColorValues.kRedColor,
                                            size: 18,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Divider(),
                            /* SizedBox(
                        height: 20,
                      ),*/
                            //_tabSection(context),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              child: GlobalLocalText(
                                text: "Latest Events",
                                fontWeight: FontWeight.bold,
                                size: 16,
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                Get.toNamed('/events');
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 05),
                                child: Container(
                                  height: 200,
                                  width: double.infinity,
                                  child: ListView.builder(
                                      itemCount: controller.data.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (BuildContext, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 12),
                                          child: Card(
                                              clipBehavior: Clip.hardEdge,
                                              margin: EdgeInsets.zero,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(
                                                            '${controller.sport_image_data[index]}'),
                                                        fit: BoxFit.cover),
                                                    color: Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                    children: [
                                                      GlobalLocalText(
                                                          text:
                                                          "${controller.data[index]['date']}",
                                                          textColor: Colors.white,
                                                          fontWeight:
                                                          FontWeight.w400),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          GlobalLocalText(
                                                            text:
                                                            "${controller.data[index]['title']}",
                                                            size: 16,
                                                            textColor: Colors.white,
                                                            fontWeight:
                                                            FontWeight.bold,
                                                          ),
                                                          Icon(
                                                            Icons.arrow_forward_ios,
                                                            color:
                                                            ColorValues.kRedColor,
                                                            size: 18,
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                //height: 70,
                                                width: 200,
                                              )),
                                        );
                                      }),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              child: GlobalLocalText(
                                text: "Announcements",
                                fontWeight: FontWeight.bold,
                                size: 16,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SizedBox(
                                height: 180,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: 3,
                                    itemBuilder: (BuildContext, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, bottom: 5, top: 3),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8)),
                                          margin: EdgeInsets.zero,
                                          elevation: 3,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              //color: color.value,

                                              // color: ColorValues
                                              //     .WHITE_COLORE,
                                                borderRadius:
                                                BorderRadius.circular(8)),
                                            width: 300,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10,
                                                  right: 10,
                                                  top: 20,
                                                  bottom: 10),
                                              child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text_widget(
                                                      Simpletext: controller
                                                          .anounsmentshh[index],
                                                      fontSize: 14.5,
                                                      color: Color(ColorValues.RED),
                                                      fontWeight: FontWeight.bold),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Flexible(
                                                    child: Text_widget(
                                                      maxLines: 4,
                                                      Simpletext:
                                                      '${controller.Annoucment[index]}',
                                                      fontSize: 14.0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Align(
                                                      alignment:
                                                      Alignment.centerRight,
                                                      child: InkWell(
                                                        onTap: () {
                                                          showModalBottomSheet(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                      topRight: Radius
                                                                          .circular(
                                                                          20),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                          20))),
                                                              backgroundColor:
                                                              Colors.white,
                                                              context: context,
                                                              builder: (context) {
                                                                return Padding(
                                                                  padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 20,
                                                                      right: 8,
                                                                      bottom: 20),
                                                                  child:
                                                                  SingleChildScrollView(
                                                                    child: Column(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                      children: [
                                                                        Align(
                                                                          alignment:
                                                                          Alignment
                                                                              .topRight,
                                                                          child: IconButton(
                                                                              onPressed: () {
                                                                                Get.back();
                                                                              },
                                                                              icon: Icon(Icons.cancel_outlined)),
                                                                        ),
                                                                        Text_widget(
                                                                            Simpletext:
                                                                            controller.anounsmentshh[
                                                                            index],
                                                                            fontSize:
                                                                            16.0,
                                                                            color: Color(
                                                                                ColorValues
                                                                                    .RED)),
                                                                        SizedBox(
                                                                          height: 8,
                                                                        ),
                                                                        Text_widget(
                                                                            maxLines:
                                                                            10,
                                                                            Simpletext:
                                                                            '${controller.Annoucment[index]}',
                                                                            fontSize:
                                                                            14.0,
                                                                            color: Color(
                                                                                ColorValues
                                                                                    .DIVIDER_COL)),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Read More',
                                                              style: TextStyle(
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  color: Colors.red,
                                                                  decoration:
                                                                  TextDecoration
                                                                      .underline),
                                                            ),
                                                          ],
                                                        ),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      }
      ));



  }

  Future<void> _showSimpleDialog(context) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            title: Center(child: const Text('Select Student')),
            children: <Widget>[
              for (int i = 0; i <controller.Sibling.length; i++)
                /*Obx(()=>
                 GFRadioListTile(
                  titleText: '${controller.Studentdata[i]['titleText']}',
                  subTitleText: '${controller.Studentdata[i]['subTitleText']}',
                  avatar: GFAvatar(
                    backgroundImage: AssetImage('assets/profileimages.jpeg'),
                  ),
                  size: 20,
                  radioColor: Color(ColorValues.RED),
                  activeBorderColor: Colors.red,
                  focusColor: Colors.red,
                  //color: Colors.red,
                  selected: false,
                  type: GFRadioType.basic,
                  value: 1,
                  groupValue: controller.groupValue.value,
                  onChanged: (value) {
                    controller.groupValue.value = value;

                    print('groupValue---------------------------------${controller.groupValue.value}');
                  },
                  inactiveIcon: null,
                ),

              ),*/

                Obx(
                  () => GFCheckboxListTile(color: Colors.grey,
                    titleText: '${controller.Sibling[i].full_name}',
                    subTitleText:
                        '${controller.Sibling[i].Class+' Section'+controller.Sibling[i].section}',
                    avatar: GFAvatar(
                      backgroundImage: NetworkImage('${ApiService.IMAGE_URL+controller.Sibling[i].profile_image}'),
                    ),
                    size: 25,
                    activeBgColor: Colors.red,
                    type: GFCheckboxType.circle,
                    activeIcon: Icon(
                      Icons.check,
                      size: 15,
                      color: Colors.white,
                    ),
                    onChanged: (value) {


                      for (int i = 0; i < controller.isChecked.length; i++) {
                        controller.isChecked[i] = false;
                        controller.token.value='';
                      }
                      controller.isChecked[i] = value;
                      controller.token.value=controller.Sibling[i].token;
                      print('token--------${controller.token}');

                    },
                    value: controller.isChecked[i],
                    inactiveIcon: null,
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: RoundedFilledButton(
                  label: 'SWITCH PROFILE',
                  color: Color(ColorValues.RED),
                  height: 40,
                  width: double.infinity,
                  fontSize: 12,
                  ontap: () async {
                    if(controller.token.value.isEmpty){
                      ToastClass.showToast('Please select profile', 'assets/only_logo.png');
                    }else{
                      await my_local_service.updateSharedPreferencesFromServer(controller.token.value);
                      Get.back();
                      ToastClass.showToast('Profile Switch succesfully.', 'assets/only_logo.png');
                    }
                    // Get.to(DeshboardScreenView())

                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: GlobalLocalText(
                      text: "Cancle",
                      size: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}

class MyFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      isExtended: true,
      onPressed: () {
        showBottomSheet(
            context: context,
            builder: (context) => Container(
                  color: Colors.red,
                ));
      },
    );
  }
}