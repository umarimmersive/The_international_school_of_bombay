import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/checkbox_list_tile/gf_checkbox_list_tile.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:the_international_school_of_bombay/app/modules/NoticeBoardDetails/views/notice_board_details_view.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/api_service.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/my_local_service.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/Text_widget.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/globle_var.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/constants/ShowToast.dart';
import '../../../utils/global_widgets/Text.dart';
import '../controllers/home_screen_controller.dart';
import '../../../utils/global_widgets/buttons.dart';
import 'dart:io' show Platform;


class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {

  final controller = Get.find<HomeScreenController>();

  Future<void> _showSimpleDialog(context) async {
    await showDialog<void>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            // <-- SEE HERE
            title: Row(
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 9,
                    child: Center(child: const Text('Switch Profile'))
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.cancel,
                      size: 25,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            children: <Widget>[
              Container(
                constraints: BoxConstraints(
                  maxHeight: 300,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      for (int i = 0; i < controller.Sibling.length; i++)
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

                        // controller.Sibling[i].full_name != userData!.  full_name?
                             Obx(
                              () => GFCheckboxListTile(
                            color: Colors.black12,
                            titleText:
                            '${controller.Sibling[i].full_name}',
                            subTitleText:
                            '${controller.Sibling[i].Class + ","}' +
                                ' Section-' +
                                '${controller.Sibling[i].section}',
                            avatar: userData!.profile_image.isNotEmpty
                                ? Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                  BorderRadius.circular(5)),
                              height: 60,
                              width: 55,
                              child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(5),
                                  child: Image.network(
                                    "${ApiService.IMAGE_URL + controller.Sibling[i].profile_image}",
                                    fit: BoxFit.cover,
                                  )),
                            )
                                : Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                    BorderRadius.circular(5)),
                                height: 60,
                                width: 55,
                                child: Center(
                                  child: Text_widget(
                                    Simpletext: controller
                                        .Sibling[i].full_name
                                        .toString()
                                        .substring(0, 1) +
                                        controller.Sibling[i].lastname
                                            .toString()
                                            .substring(0, 1),
                                    fontSize: 15.0,
                                    maxLines: 1,
                                    color: Colors.red,
                                  ),
                                )),
                            /*  GFAvatar(
                                backgroundImage: NetworkImage('${ApiService.IMAGE_URL+controller.Sibling[i].profile_image}'),
                              ),*/
                            size: 18,
                            activeBgColor: Colors.red,
                            type: GFCheckboxType.circle,
                            activeIcon: Icon(
                              Icons.check,
                              size: 10,
                              color: Colors.white,
                            ),
                            onChanged: (value) {
                              for (int i = 0; i < controller.isChecked.length; i++) {
                                controller.isChecked[i] = false;
                                controller.token.value = '';
                              }
                              controller.isChecked[i] = value;
                              controller.token.value =
                                  controller.Sibling[i].token;
                              print('token--------${controller.token}');
                            },
                            value: controller.isChecked[i],
                            inactiveIcon: null,
                          ),
                        )
                        //     : Text_widget(
                        //   Simpletext: 'Another Profile Not Found.',
                        //   fontSize: 18.0,
                        //   color: ColorValues.BLACK,
                        // )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: RoundedFilledButton(
                  label: 'Switch Profile',
                  color: Color(ColorValues.RED),
                  height: 40,
                  width: double.infinity,
                  fontSize: 12,
                  ontap: () async {
                    if (controller.token.value.isEmpty) {
                      ToastClass.showToast(
                          'Please select profile', 'assets/only_logo.png');
                    } else {
                      await my_local_service.updateSharedPreferencesFromServer(controller.token.value);
                      Get.back();
                      // await controller.refrshApi();
                      // await Future.delayed(Duration(milliseconds: 1000));
                      //
                      // if (true) controller.refreshController.refreshCompleted();
                      ToastClass.showToast('Profile Switch succesfully.',
                          'assets/only_logo.png');
                    }
                    // Get.to(DeshboardScreenView())
                  },
                ),
              )
              // for (int i = 0; i < controller.Sibling.length; i++)
              //   if (controller.Sibling[i].full_name != userData!.full_name)
              //     Padding(
              //       padding: const EdgeInsets.only(left: 10.0, right: 10),
              //       child: RoundedFilledButton(
              //         label: 'SWITCH PROFILE',
              //         color: Color(ColorValues.RED),
              //         height: 40,
              //         width: double.infinity,
              //         fontSize: 12,
              //         ontap: () async {
              //           if (controller.token.value.isEmpty) {
              //             ToastClass.showToast(
              //                 'Please select profile', 'assets/only_logo.png');
              //           } else {
              //             await my_local_service
              //                 .updateSharedPreferencesFromServer(
              //                 controller.token.value);
              //             Get.back();
              //             ToastClass.showToast('Profile Switch succesfully.',
              //                 'assets/only_logo.png');
              //           }
              //           // Get.to(DeshboardScreenView())
              //         },
              //       ),
              //     ),

              /* GestureDetector(
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
              ),*/
            ],
          );
        });
  }

  // HomeScreenView({Key? key}) : super(key: key);
  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  // YoutubePlayerController _controller = YoutubePlayerController(
  //     initialVideoId:YoutubePlayer.convertUrlToId(controller.selectionList[index].extra![0].redirection_url.toString()).toString(),
  //     flags: YoutubePlayerFlags(
  //         enableCaption:true,
  //         disableDragSeek: true,
  //         forceHD: false,
  //         autoPlay: true,
  //         showLiveFullscreenButton: true
  //     )
  // );

  @override
  Widget build(BuildContext context) {
    var color = (isDark(context) ? Color(0xFF414040) : Colors.white).obs;
    var color1 = (isDark(context) ? Colors.white : Colors.black).obs;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Obx(() {
      print('controller.Slider.value.length =========controller.Slider.value.lengthcontroller.Slider.value.length${controller.Slider.value.length}');
      return Scaffold(
          body: SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            // key: controller.refresherKey,
            enablePullDown: true,
            // header: MaterialClassicHeader(),
            child: CustomScrollView(
              semanticChildCount: 2,
              shrinkWrap: true,
              slivers: <Widget>[
                if(controller.isLoading_selectionList == false)
                  SliverAppBar(
                      titleSpacing: 0,
                      toolbarHeight: 90,
                      excludeHeaderSemantics: true,
                      backgroundColor: controller.selectionList[0].bgType == 0
                          ? controller.hexToColor(
                          controller.selectionList[0].bgValue.toString())
                          : Colors.transparent,
                      floating: false,
                      stretch: false,
                      actions: Platform.isIOS
                          ?[
                         controller.Sibling.value.length != 0 ?
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:10.0),
                              child: IconButton(
                                  onPressed: () {
                                    _showSimpleDialog(context);
                                    print("(userData!.full_name)====>>>>>>> ${userData!.id}");
                                  },
                                  icon: Icon(
                                    size: 24,
                                    Icons.person,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        )
                         :SizedBox(),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:10.0),
                              child: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.NOTIFICATION);
                                  },
                                  icon: Icon(
                                    size: 24,
                                    Icons.notifications,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ]
                          :[
                        controller.Sibling.value.length != 0  ?
                        Padding(
                          padding: const EdgeInsets.only(top:25.0),
                          child: IconButton(
                              onPressed: () {
                                _showSimpleDialog(context);
                              },
                              icon: Icon(
                                size: 24,
                                Icons.person,
                                color: Colors.white,
                              )),
                        )
                         :SizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(top:25.0),
                          child: IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.NOTIFICATION);
                              },
                              icon: Icon(
                                size: 24,
                                Icons.notifications,
                                color: Colors.white,
                              )),
                        ),
                      ],
                      automaticallyImplyLeading: false,
                      pinned: false,
                      title: Container(height:6000,color: Colors.transparent,),
                      expandedHeight: controller.selectionList.length != 1
                          ? controller.selectionList[1].id == 2 ?Platform.isIOS?165:200 : 120:120,
                      flexibleSpace: Stack(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                      ApiService.IMAGE_URL +
                                          controller.selectionList[0].bgValue
                                              .toString(),
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          Padding(
                              padding:  EdgeInsets.only(left: 15, top:Platform.isIOS?45:30),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          userData!.profile_image.isNotEmpty
                                              ? Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            height: 60,
                                            width: 55,
                                            child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                child: Image.network(
                                                  "${ApiService.IMAGE_URL + userData!.profile_image}",
                                                  fit: BoxFit.cover,
                                                )),
                                          )
                                              : Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              height: 60,
                                              width: 55,
                                              child: Center(
                                                child: Text_widget(
                                                  Simpletext: userData!.full_name
                                                      .toString()
                                                      .substring(0, 1) +
                                                      userData!.lastname
                                                          .toString()
                                                          .substring(0, 1),
                                                  fontSize: 15.0,
                                                  maxLines: 1,
                                                  color: Colors.red,
                                                ),
                                              )),
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
                                                  text: "Shift ${userData!.shift}",
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
                                                    text:
                                                    "${userData!.Class}, Section-${userData!.section}",
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
                                    // Row(
                                    //   children: [
                                    //     // controller.Slider.value == false ?
                                    //         IconButton(
                                    //             onPressed: () {
                                    //               _showSimpleDialog(context);
                                    //             },
                                    //             icon: Icon(
                                    //               size: 24,
                                    //               Icons.person,
                                    //               color: Colors.white,
                                    //             )),
                                    //         // : SizedBox(),
                                    //     IconButton(
                                    //         onPressed: () {
                                    //           Get.to(NoticeBoardDetailsView());
                                    //         },
                                    //         icon: Icon(
                                    //           size: 24,
                                    //           Icons.notifications,
                                    //           color: Colors.white,
                                    //         )),
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ),

                          if(controller.selectionList.length == 1)
                            SizedBox()
                          else
                            if (controller.selectionList[1].id == 2)
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    margin: EdgeInsets.zero,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                              height: 70,
                                              decoration: BoxDecoration(
                                                  color: color.value,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(30),
                                                      topRight: Radius.circular(30))),
                                            )),
                                        Align(
                                            alignment: Alignment.topCenter,
                                            child: CircleAvatar(
                                              backgroundColor: color.value,
                                              radius: 40,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(bottom: 20.0),
                                                child: Image.network(
                                                  "${ApiService.IMAGE_URL + controller.selectionList[1].extra![0].appIcon.toString()}",
                                                  height: 50,
                                                ),
                                              ),
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text_widget(
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              Simpletext:
                                              '${controller.selectionList[1].title.toString()}',
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 20.0),
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Container(
                                                width:
                                                MediaQuery.of(context).size.width,
                                                child: Divider(
                                                    color: controller.hexToColor(
                                                        controller.selectionList[1]
                                                            .extra![0].lineColor
                                                            .toString()))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                            else
                              SizedBox(),
                        ],
                      ))
                else
                  SliverAppBar(
                      titleSpacing: 0,
                      toolbarHeight: 90,
                      excludeHeaderSemantics: true,
                      backgroundColor: ColorValues.BG_BT2,
                      floating: false,
                      stretch: false,
                      automaticallyImplyLeading: false,
                      pinned: false,
                      actions: Platform.isIOS?[
                        controller.Sibling.value.length != 0 ?
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:10.0),
                              child: IconButton(
                                  onPressed: () {
                                    _showSimpleDialog(context);
                                    print("(userData!.full_name)====>>>>>>> ${userData!.id}");
                                  },
                                  icon: Icon(
                                    size: 24,
                                    Icons.person,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        )
                            :SizedBox(),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:10.0),
                              child: IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.NOTIFICATION);
                                  },
                                  icon: Icon(
                                    size: 24,
                                    Icons.notifications,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                      ]:[
                        controller.Sibling.value.length != 0 ?
                        Padding(
                          padding: const EdgeInsets.only(top:25.0),
                          child: IconButton(
                              onPressed: () {
                                _showSimpleDialog(context);
                              },
                              icon: Icon(
                                size: 24,
                                Icons.person,
                                color: Colors.white,
                              )),
                        )
                            :SizedBox(),
                        Padding(
                          padding: const EdgeInsets.only(top:25.0),
                          child: IconButton(
                              onPressed: () {
                                Get.toNamed(Routes.NOTIFICATION);
                              },
                              icon: Icon(
                                size: 24,
                                Icons.notifications,
                                color: Colors.white,
                              )),
                        ),
                      ],
                      title: Container(height:6000,color: Colors.transparent,),
                      expandedHeight: Platform.isIOS?165:200 ,
                      flexibleSpace: Stack(
                        children: [
                          Container(
                            height: 200,
                          ),
                          Padding(
                              padding:  EdgeInsets.only(left: 15, top:Platform.isIOS? 45:30),
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          userData!.profile_image.isNotEmpty
                                              ? Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            height: 60,
                                            width: 55,
                                            child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                child: Image.network(
                                                  "${ApiService.IMAGE_URL + userData!.profile_image}",
                                                  fit: BoxFit.cover,
                                                )),
                                          )
                                              : Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                  BorderRadius.circular(5)),
                                              height: 60,
                                              width: 55,
                                              child: Center(
                                                child: Text_widget(
                                                  Simpletext: userData!.full_name
                                                      .toString()
                                                      .substring(0, 1) +
                                                      userData!.lastname
                                                          .toString()
                                                          .substring(0, 1),
                                                  fontSize: 15.0,
                                                  maxLines: 1,
                                                  color: Colors.red,
                                                ),
                                              )),
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
                                                  text: "Shift ${userData!.shift}",
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
                                                    text:
                                                    "${userData!.Class}, Section-${userData!.section}",
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
                                    // Row(
                                    //   children: [
                                    //     // controller.Slider.value == true
                                    //     //     ? IconButton(
                                    //     //         onPressed: () {
                                    //     //           _showSimpleDialog(context);
                                    //     //         },
                                    //     //         icon: Icon(
                                    //     //           size: 24,
                                    //     //           Icons.person,
                                    //     //           color: Colors.white,
                                    //     //         ))
                                    //     //     : SizedBox(),
                                    //     IconButton(
                                    //         onPressed: () {
                                    //           Get.toNamed(Routes.NOTIFICATION);
                                    //         },
                                    //         icon: Icon(
                                    //           size: 24,
                                    //           Icons.notifications,
                                    //           color: Colors.white,
                                    //         )),
                                    //   ],
                                    // )
                                  ],
                                ),
                              ),
                            ),

                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                margin: EdgeInsets.zero,
                                height: 100,
                                child: Stack(
                                  children: [
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          height: 70,
                                          decoration: BoxDecoration(
                                              color: color.value,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30),
                                                  topRight: Radius.circular(30))),
                                        )),
                                    Align(
                                        alignment: Alignment.topCenter,
                                        child: CircleAvatar(
                                          backgroundColor: color.value,
                                          radius: 40,
                                          child: Padding(
                                              padding:
                                              const EdgeInsets.only(bottom: 20.0),
                                              child: Container(
                                                height: 60,
                                                width: 60,
                                              )
                                          ),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text_widget(
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          Simpletext:
                                          '',
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 20.0),
                                        child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Container(
                                            width:
                                            MediaQuery.of(context).size.width,
                                            child: Divider(),
                                          ),
                                        )
                                    )
                                  ],
                                ),
                              ))

                        ],
                      )
                  ),


                // body

                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: controller.selectionList.length,
                        (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: color.value,
                          // borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(30),
                          //     topRight: Radius.circular(30))

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          //  mainAxisSize: MainAxisSize.min,
                          children: [


                            // Highlighter
                            if (controller.selectionList[index].id == 3)
                              controller.isLoading_selectionList == false
                                  ? Container(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    if(controller.selectionList[2].id == 3)
                                      SizedBox()
                                    else
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: GlobalLocalText(
                                          text: controller
                                              .selectionList[index].title,
                                          fontWeight: FontWeight.bold,
                                          size: 16,
                                        ),
                                      ),
                                    Padding(padding:
                                      const EdgeInsets.only(top: 10.0,bottom:10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: isDark(context)
                                                ? Color(0xFF414040)
                                                : controller.selectionList[index].bgType == 0
                                                ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
                                                : Colors.transparent,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  ApiService.IMAGE_URL +
                                                      controller
                                                          .selectionList[
                                                      index]
                                                          .bgValue
                                                          .toString(),
                                                ),
                                                fit: BoxFit.fill)),
                                        height: 250,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: controller.selectionList[index].extra!.length,
                                            shrinkWrap: true,
                                            itemBuilder:
                                                (BuildContext, idx1) {
                                              var highliter = controller.selectionList[index].extra![idx1];
                                              return InkWell(
                                                  onTap: () {
                                                    var data = {
                                                      /* "maintitle": "${controller.slider_data[index]['maintitle']}",
                                                  "title": "${controller.slider_data[index]['title']}",
                                                  "images": "${controller.slider_data[index]['images']}",*/
                                                      "id": "${highliter.id}"
                                                    };
                                                    Get.toNamed(
                                                        Routes
                                                            .HOME_SLIDER_DETAILS,
                                                        parameters: data);
                                                    //  HomeSliderDetailsView
                                                  },
                                                  child: Padding(
                                                      padding:
                                                      EdgeInsets.only(
                                                          top: 5,
                                                          left: 10,
                                                          right: 10,
                                                          bottom: 5),
                                                      child: Stack(
                                                        clipBehavior:
                                                        Clip.hardEdge,
                                                        children: [
                                                          Container(
                                                            clipBehavior:
                                                            Clip.hardEdge,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10),
                                                            ),
                                                            height: 240,
                                                            width: 220,
                                                            child: Image.network(
                                                                ApiService
                                                                    .IMAGE_URL +
                                                                    highliter
                                                                        .image!,
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top:
                                                                160.0),
                                                            child: Container(
                                                              height: 80,
                                                              width: 220,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Colors
                                                                    .black54,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  topLeft:
                                                                  Radius
                                                                      .zero,
                                                                  topRight:
                                                                  Radius
                                                                      .zero,
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      10.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets
                                                                .only(
                                                                top: 140,
                                                                left: 10),
                                                            height: 80,
                                                            width: 200,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                              children: [
                                                                Text(
                                                                  highliter.title!,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                      "Roboto",
                                                                      overflow: TextOverflow.ellipsis,
                                                                      fontWeight: FontWeight.w600,
                                                                      fontSize: 13.5,
                                                                      color: controller.hexToColor(highliter.titleColor.toString())),
                                                                ),
                                                                SizedBox(
                                                                  height: 5,
                                                                ),
                                                                Text(
                                                                  textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                                  maxLines: 2,
                                                                  highliter.shortDescription.toString(),
                                                                  style: TextStyle(
                                                                      overflow: TextOverflow.ellipsis,
                                                                      fontSize: 12.5,
                                                                      fontWeight: FontWeight.w500,
                                                                      color: controller.hexToColor(highliter.subTitleColor.toString())
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ))
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
                                ),
                              )
                                  : Shimmer.fromColors(
                                  baseColor: Colors.black,
                                  highlightColor: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: SizedBox(
                                      height: 200,
                                      child: ListView.builder(
                                          itemCount:  controller.selectionList[index].extra!.length,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                if (index == 0) {
                                                  Get.toNamed(
                                                      Routes.LEAVES_SCREEN);
                                                } else if (index == 1) {
                                                  Get.toNamed(
                                                      Routes.NOTICE_BOARD);
                                                } else if (index == 2) {
                                                  Get.toNamed(
                                                      Routes.BUSROOT_SCREEN);
                                                } else if (index == 3) {
                                                  Get.toNamed(Routes
                                                      .SCHOOL_ROOLS_SCREEN);
                                                } else if (index == 4) {
                                                  Get.toNamed(
                                                      Routes.QUIRY_SCREEN);
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10,
                                                    bottom: 05,
                                                    right: 10),
                                                child: Card(
                                                    elevation: 03,
                                                    margin: EdgeInsets.zero,
                                                    shape:
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            5)),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: color.value,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(5)),
                                                      // height: 70,
                                                      //width: 120,
                                                      child: Container(
                                                        width: 130,
                                                        child: Column(
                                                          mainAxisSize:
                                                          MainAxisSize.min,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                          children: [
                                                            Expanded(
                                                              flex: 2,
                                                              child:
                                                              CircleAvatar(
                                                                backgroundColor:
                                                                Color(ColorValues
                                                                    .RED),
                                                                child: Icon(
                                                                  controller
                                                                      .icons[
                                                                  index],
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child:
                                                              GlobalLocalText(
                                                                text: controller
                                                                    .title[
                                                                index],
                                                                fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                                size: 15,
                                                                textAlign:
                                                                TextAlign
                                                                    .center,
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
                                  )
                              ),

                            // Explore More
                            if (controller.selectionList[index].id == 4)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if(controller.selectionList[2].id == 4)
                                    SizedBox()
                                  else
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                      child: GlobalLocalText(
                                        text: controller.selectionList[index].title,
                                        fontWeight: FontWeight.bold,
                                        size: 16,
                                      ),
                                    ),
                                  controller.isLoading_selectionList == false
                                      ? Padding(
                                    padding: const EdgeInsets.only(top: 10,bottom:10),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: isDark(context)
                                              ? Color(0xFF414040)
                                              : controller.selectionList[index].bgType == 0
                                              ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
                                              : Colors.transparent,

                                          image: DecorationImage(
                                              image: NetworkImage(
                                                ApiService.IMAGE_URL +
                                                    controller
                                                        .selectionList[index].bgValue
                                                        .toString(),
                                              ),
                                              fit: BoxFit.fill
                                          )
                                      ),
                                      child: SizedBox(
                                        height: 125,
                                        child: ListView.builder(
                                            itemCount: controller.selectionList[index].extra!.length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext, idx2) {
                                              var expoler = controller.selectionList[index].extra![idx2];
                                              print(
                                                  'controller.selectionList[index].extra![idx2]' +
                                                      idx2.toString());

                                              return GestureDetector(
                                                onTap: () {
                                                  if (idx2 == 0) {
                                                    Get.toNamed(Routes.LEAVES_SCREEN);
                                                  } else if (idx2 == 1) {
                                                    Get.toNamed(Routes.NOTICE_BOARD);
                                                  } else if (idx2 == 2) {
                                                    Get.toNamed(Routes.BUSROOT_SCREEN);
                                                  } else if (idx2 == 3) {
                                                    Get.toNamed(Routes.SCHOOL_ROOLS_SCREEN);
                                                  } else if (idx2 == 4) {
                                                    Get.toNamed(Routes.QUIRY_SCREEN);
                                                  }
                                                },
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 10,
                                                      top:5,
                                                      bottom: 05,
                                                      right: 10),
                                                  child: Card(
                                                      elevation: 03,
                                                      margin: EdgeInsets.zero,
                                                      // color: Colors.red,
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color:controller.hexToColor(expoler.boxColor.toString()),
                                                            borderRadius: BorderRadius.circular(5)),
                                                        // height: 70,
                                                        //width: 120,
                                                        child: Container(
                                                          width: 130,
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize
                                                                .min,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Expanded(
                                                                flex: 2,
                                                                child: CircleAvatar(
                                                                    backgroundColor: Color(ColorValues.RED),
                                                                    child: Image.network(
                                                                      ApiService.IMAGE_URL + expoler.icon.toString(),height: 25,color: Colors.white,
                                                                    )),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                GlobalLocalText(
                                                                  text: expoler
                                                                      .title,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                                  size: 15,
                                                                  textAlign:
                                                                  TextAlign
                                                                      .center,
                                                                  textColor: controller.hexToColor(expoler
                                                                      .titleColor
                                                                      .toString()),
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
                                  )
                                      : Shimmer.fromColors(
                                      baseColor: Colors.black,
                                      highlightColor: Colors.red,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(top: 20),
                                        child: SizedBox(
                                          height: 125,
                                          child: ListView.builder(
                                              itemCount:
                                              controller.selectionList.length,
                                              shrinkWrap: true,
                                              scrollDirection:
                                              Axis.horizontal,
                                              itemBuilder:
                                                  (BuildContext, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    // if (index == 0) {
                                                    //   Get.toNamed(Routes
                                                    //       .LEAVES_SCREEN);
                                                    // } else if (index == 1) {
                                                    //   Get.toNamed(Routes
                                                    //       .NOTICE_BOARD);
                                                    // } else if (index == 2) {
                                                    //   Get.toNamed(Routes
                                                    //       .BUSROOT_SCREEN);
                                                    // } else if (index == 3) {
                                                    //   Get.toNamed(Routes
                                                    //       .SCHOOL_ROOLS_SCREEN);
                                                    // } else if (index == 4) {
                                                    //   Get.toNamed(Routes
                                                    //       .QUIRY_SCREEN);
                                                    // }
                                                  },
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 10,
                                                        bottom: 05,
                                                        right: 10),
                                                    child: Card(
                                                        elevation: 03,
                                                        margin:
                                                        EdgeInsets.zero,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                5)),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                              color.value,
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5)),
                                                          // height: 70,
                                                          //width: 120,
                                                          child: Container(
                                                            width: 130,
                                                            child: Column(
                                                              mainAxisSize:
                                                              MainAxisSize
                                                                  .min,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                  CircleAvatar(
                                                                    backgroundColor:
                                                                    Color(
                                                                        ColorValues.RED),
                                                                    child:
                                                                    Icon(
                                                                      controller
                                                                          .icons[index],
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                  GlobalLocalText(
                                                                    text: controller
                                                                        .title[
                                                                    index],
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                    size: 15,
                                                                    textAlign:
                                                                    TextAlign
                                                                        .center,
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
                                      )),
                                ],
                              ),

                            // knowledge base
                            if (controller.selectionList[index].id == 5)
                              Container(
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if(controller.selectionList[2].id == 5)
                                          SizedBox()
                                        else
                                          Padding(
                                            padding:
                                            const EdgeInsets.only(left: 10, top: 10),
                                            child: GlobalLocalText(
                                              text: controller.selectionList[index].title,
                                              fontWeight: FontWeight.bold,
                                              size: 16,
                                            ),
                                          ),
                                        if (controller.selectionList[index].id == 5)
                                          controller.isLoading_selectionList == false
                                              ? Padding(
                                            padding: const EdgeInsets.only(top:10.0,bottom:10),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  color: isDark(context)
                                                      ? Color(0xFF414040)
                                                      : controller.selectionList[index].bgType == 0
                                                      ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
                                                      : Colors.transparent,
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        ApiService.IMAGE_URL +
                                                            controller
                                                                .selectionList[index].bgValue
                                                                .toString(),
                                                      ),
                                                      fit: BoxFit.fill)),
                                              child: Container(
                                                height: MediaQuery.of(context).size.height / 3.2,
                                                child: ListView.builder(
                                                    itemCount: controller.selectionList[index].extra!.length,
                                                    scrollDirection: Axis.horizontal,
                                                    shrinkWrap: true,
                                                    itemBuilder: (BuildContext, idx3) {
                                                      var knowledge =  controller.selectionList[index].extra![idx3];
                                                      return Padding(
                                                        padding:
                                                        const EdgeInsets.only(
                                                            left: 15,
                                                            right: 15,
                                                            top: 5,
                                                            bottom: 5),
                                                        child: InkWell(
                                                          onTap: () {
                                                            var data = {
                                                              'id':  knowledge.id.toString(),
                                                            };
                                                            print(
                                                                '-------------${data}');

                                                            Get.toNamed(
                                                                Routes.ARTICAL1,
                                                                parameters: data);
                                                          },
                                                          child: Container(
                                                            height: MediaQuery.of(context).size.height / 3,
                                                            width: MediaQuery.of(context).size.width / 1.3,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: NetworkImage(ApiService
                                                                        .IMAGE_URL +
                                                                        knowledge.image.toString()),
                                                                    fit: BoxFit.fill),
                                                                borderRadius: BorderRadius.circular(10),
                                                                color: Colors.blue),
                                                            child: Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 0,
                                                                  bottom: 0),
                                                              child: Container(
                                                                // color: Colors.black38,
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                          18),
                                                                      child:
                                                                      GlobalLocalText(
                                                                        maxLines: 2,
                                                                        text:knowledge.title,
                                                                        textColor:
                                                                        Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height: 8,
                                                                    ),
                                                                    Padding(
                                                                      padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                          18,
                                                                          bottom:
                                                                          10),
                                                                      child:
                                                                      ElevatedButton(
                                                                          style: ElevatedButton
                                                                              .styleFrom(
                                                                            backgroundColor: controller.hexToColor(knowledge.btnColor.toString()),),
                                                                          onPressed:
                                                                              () {
                                                                            var data =
                                                                            {
                                                                              'id':
                                                                              knowledge.id.toString()
                                                                            };
                                                                            print(
                                                                                '-------------${data}');

                                                                            Get.toNamed(
                                                                                Routes.ARTICAL1,
                                                                                parameters: data);

                                                                            /* if (index == 0) {
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
                                                                }*/
                                                                          },
                                                                          child:
                                                                          GlobalLocalText(
                                                                            textColor: controller.hexToColor(knowledge.btnTextColor.toString()),
                                                                            text:
                                                                            "Read More",
                                                                          )),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ),
                                          )
                                              : Shimmer.fromColors(
                                            baseColor: Colors.black,
                                            highlightColor: Colors.red,
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                                  3,
                                              child: ListView.builder(
                                                  itemCount: controller
                                                      .KnowledgeBaseList.length,
                                                  scrollDirection:
                                                  Axis.horizontal,
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (BuildContext, index) {
                                                    return Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 15,
                                                          right: 15,
                                                          top: 20,
                                                          bottom: 20),
                                                      child: InkWell(
                                                        onTap: () {
                                                          var data = {
                                                            'id': controller
                                                                .KnowledgeBaseList[
                                                            index]
                                                                .id
                                                                .toString(),
                                                          };
                                                          print(
                                                              '-------------${data}');

                                                          Get.toNamed(
                                                              Routes.ARTICAL1,
                                                              parameters: data);
                                                        },
                                                        child: Container(
                                                          height: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .height /
                                                              3,
                                                          width: MediaQuery.of(
                                                              context)
                                                              .size
                                                              .width /
                                                              1.3,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(ApiService
                                                                      .IMAGE_URL +
                                                                      controller
                                                                          .KnowledgeBaseList[
                                                                      index]
                                                                          .image!),
                                                                  fit: BoxFit
                                                                      .cover),
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  5),
                                                              color: Colors.blue),
                                                          child: Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 0,
                                                                bottom: 0),
                                                            child: Container(
                                                              color:
                                                              Colors.black38,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left: 18),
                                                                    child:
                                                                    GlobalLocalText(
                                                                      maxLines: 2,
                                                                      text: controller
                                                                          .KnowledgeBaseList[
                                                                      index]
                                                                          .title,
                                                                      textColor:
                                                                      Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        left: 18,
                                                                        bottom:
                                                                        10),
                                                                    child: ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                          backgroundColor:
                                                                          Color(ColorValues.RED),
                                                                        ),
                                                                        onPressed: () {
                                                                          var data =
                                                                          {
                                                                            'id': controller
                                                                                .KnowledgeBaseList[index]
                                                                                .id
                                                                                .toString(),
                                                                          };
                                                                          print(
                                                                              '-------------${data}');

                                                                          Get.toNamed(
                                                                              Routes
                                                                                  .ARTICAL1,
                                                                              parameters:
                                                                              data);

                                                                          /* if (index == 0) {
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
                                                            }*/
                                                                        },
                                                                        child: GlobalLocalText(
                                                                          textColor:
                                                                          Colors.white,
                                                                          text:
                                                                          "Read More",
                                                                        )),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                            ),
                                          ),
                                      ])),

                            // main menu
                            if (controller.selectionList[index].id == 6)
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: isDark(context)
                                        ? Color(0xFF414040)
                                        : controller.selectionList[index].bgType == 0
                                        ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
                                        : Colors.transparent,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          ApiService.IMAGE_URL +
                                              controller
                                                  .selectionList[index].bgValue
                                                  .toString(),
                                        ),
                                        fit: BoxFit.fill)),
                                padding :EdgeInsets.only( top:20,bottom:0),
                                child: ListView.builder(
                                    padding:EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: controller.selectionList[index].extra!.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext,idx4){
                                      var menu = controller.selectionList[index].extra![idx4];
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            child: InkWell(
                                              onTap: () {

                                                // Redirection Screen

                                                // if (menu.redirection == "") {
                                                //   Get.toNamed(Routes.UPCOMING_EVENT);
                                                // } else if (menu.redirection == 1) {
                                                //   Get.toNamed(Routes.ASSIGNMENT);
                                                // } else if (idx4 == 2) {
                                                //   Get.toNamed(Routes.SYLLABUS);
                                                // } else if (idx4 == 3) {
                                                //   Get.toNamed("/accedmic-content");
                                                // }
                                                //
                                                //
                                                //




                                                if (idx4 == 0) {
                                                  Get.toNamed(Routes.UPCOMING_EVENT);
                                                } else if (idx4 == 1) {
                                                  Get.toNamed(Routes.ASSIGNMENT);
                                                } else if (idx4 == 2) {
                                                  Get.toNamed(Routes.SYLLABUS);
                                                } else if (idx4 == 3) {
                                                  Get.toNamed("/accedmic-content");
                                                }
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Row(
                                                      children: [
                                                        CircleAvatar(
                                                            backgroundColor:
                                                            Color(ColorValues.RED),
                                                            child: Image.network(ApiService.IMAGE_URL + menu.icon.toString(),
                                                              height:25,
                                                              color:Colors.white,
                                                            )
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Flexible(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: [
                                                              GlobalLocalText(
                                                                text: menu.title.toString().toUpperCase(), size: 17,
                                                                fontWeight: FontWeight.w500,
                                                                textColor:  controller.hexToColor(menu.titleColor.toString()),

                                                              ),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              GlobalLocalText(
                                                                text:
                                                                menu.subTitle.toString(),
                                                                size: 13.5,
                                                                textColor: controller.hexToColor(menu.subTitleColor.toString()),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Card(
                                                      color: controller.hexToColor(menu.btnColor.toString()),
                                                      margin: EdgeInsets.zero,
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets.all(8.0),
                                                        child: Icon(
                                                          Icons.arrow_forward_ios,
                                                          color: controller.hexToColor(menu.iconColor.toString()),
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
                                          if(idx4==controller.selectionList[index].extra!.length-1)
                                            SizedBox()
                                          else
                                            Divider() ,
                                          SizedBox(
                                            height: 8,
                                          ),

                                        ],
                                      );
                                    }
                                ),
                              ),

                            // Latest Events
                            if (controller.selectionList[index].id == 7)
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if(controller.selectionList[2].id == 7)
                                      SizedBox()
                                    else
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 10),
                                        child: GlobalLocalText(
                                          text: controller.selectionList[index].title.toString(),
                                          fontWeight: FontWeight.bold,
                                          size: 16,
                                        ),
                                      ),
                                    controller.isLoading_selectionList == false
                                        ? Padding(
                                      padding: const EdgeInsets.only(top: 10,bottom:10),
                                      child: Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: isDark(context)
                                                ? Color(0xFF414040)
                                                : controller.selectionList[index].bgType == 0
                                                ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
                                                : Colors.transparent,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  ApiService.IMAGE_URL +
                                                      controller
                                                          .selectionList[index].bgValue
                                                          .toString(),
                                                ),
                                                fit: BoxFit.fill)),
                                        child: ListView.builder(
                                            itemCount: controller.selectionList[index].extra!.length,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder:
                                                (BuildContext, idx5) {
                                              var evets = controller.selectionList[index].extra![idx5];
                                              return InkWell(
                                                  onTap: () {
                                                    var data = {
                                                      'id': evets.id
                                                          .toString(),
                                                    };
                                                    Get.toNamed(Routes.EVENTS,
                                                        parameters: data);
                                                  },
                                                  child: Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          left: 15,
                                                          right: 15,
                                                          top: 5,
                                                          bottom: 5),
                                                      child: Stack(
                                                        clipBehavior:
                                                        Clip.hardEdge,
                                                        children: [
                                                          Container(
                                                            clipBehavior:
                                                            Clip.hardEdge,
                                                            decoration:
                                                            BoxDecoration(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  10),
                                                            ),
                                                            height: 240,
                                                            width: 220,
                                                            child: Image.network(
                                                                ApiService
                                                                    .IMAGE_URL +
                                                                    evets.image!,
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top:
                                                                145.0),
                                                            child: Container(
                                                              height: 80,
                                                              width: 220,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Colors
                                                                    .black54,
                                                                borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                                  topLeft:
                                                                  Radius
                                                                      .zero,
                                                                  topRight:
                                                                  Radius
                                                                      .zero,
                                                                  bottomLeft:
                                                                  Radius.circular(
                                                                      10.0),
                                                                  bottomRight:
                                                                  Radius.circular(
                                                                      10.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            top: 127,
                                                            left: 10,
                                                            child: Container(
                                                              //margin: EdgeInsets.only(top: 140,left: 10),
                                                              height: 60,
                                                              width: 200,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                                children: [
                                                                  Text(
                                                                    evets.year.toString(),
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                        "Roboto",
                                                                        overflow: TextOverflow
                                                                            .ellipsis,
                                                                        fontWeight: FontWeight
                                                                            .w600,
                                                                        fontSize:
                                                                        13.5,
                                                                        color:
                                                                        Colors.white),
                                                                  ),

                                                                  /* Text(
                                                            textAlign: TextAlign.justify,
                                                            maxLines: 2,
                                                            controller.Event_list[index].title!,
                                                            style: TextStyle(
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                                fontSize: 12.5,
                                                                fontWeight: FontWeight.w500,
                                                                color: Colors.yellow),
                                                          ),*/

                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        vertical:
                                                                        2),
                                                                    child:
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                          9,
                                                                          child:
                                                                          GlobalLocalText(
                                                                            maxLines: 1,
                                                                            text: "${  evets.title.toString()}",
                                                                            size: 16,
                                                                            textColor: Colors.white,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                          1,
                                                                          child:
                                                                          Icon(
                                                                            Icons.arrow_forward_ios,
                                                                            color: ColorValues.kRedColor,
                                                                            size: 20,
                                                                          ),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ))

                                                /* Padding(
                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                            child: Card(
                                                clipBehavior: Clip.hardEdge,
                                                margin: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(5)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              '${ApiService.IMAGE_URL+controller.Event_list[index].image!}'),
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
                                                            "${controller.Event_list[index].date}",
                                                            textColor: Colors.white,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 9,
                                                              child: GlobalLocalText(
                                                                maxLines: 1,
                                                                text:
                                                                "${controller.Event_list[index].title}",
                                                                size: 16,
                                                                textColor: Colors.white,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Icon(
                                                                Icons.arrow_forward_ios,
                                                                color:
                                                                ColorValues.kRedColor,
                                                                size: 18,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  //height: 70,
                                                  width: 200,
                                                )),
                                          ),*/
                                              );
                                            }),
                                      ),
                                    )
                                        : Shimmer.fromColors(
                                        baseColor: Colors.black,
                                        highlightColor: Colors.red,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(top: 05),
                                          child: Container(
                                            height: 200,
                                            width: double.infinity,
                                            child: ListView.builder(
                                                itemCount: controller
                                                    .Event_list.length,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                Axis.horizontal,
                                                itemBuilder:
                                                    (BuildContext, index) {
                                                  return InkWell(
                                                      onTap: () {
                                                        var data = {
                                                          'id': controller
                                                              .Event_list[index]
                                                              .id
                                                              .toString(),
                                                        };
                                                        Get.toNamed(
                                                            Routes.EVENTS,
                                                            parameters: data);
                                                      },
                                                      child: Padding(
                                                          padding:
                                                          EdgeInsets.only(
                                                              left: 10,
                                                              right: 10),
                                                          child: Stack(
                                                            clipBehavior:
                                                            Clip.hardEdge,
                                                            children: [
                                                              Container(
                                                                clipBehavior:
                                                                Clip.hardEdge,
                                                                decoration:
                                                                BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      10),
                                                                ),
                                                                height: 240,
                                                                width: 220,
                                                                child: Image.network(
                                                                    ApiService
                                                                        .IMAGE_URL +
                                                                        controller
                                                                            .Event_list[
                                                                        index]
                                                                            .image!,
                                                                    fit: BoxFit
                                                                        .cover),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                    top: 160.0),
                                                                child:
                                                                Container(
                                                                  height: 80,
                                                                  width: 220,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: Colors
                                                                        .black54,
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                      topLeft:
                                                                      Radius
                                                                          .zero,
                                                                      topRight:
                                                                      Radius
                                                                          .zero,
                                                                      bottomLeft:
                                                                      Radius.circular(
                                                                          10.0),
                                                                      bottomRight:
                                                                      Radius.circular(
                                                                          10.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Positioned(
                                                                top: 140,
                                                                left: 10,
                                                                child:
                                                                Container(
                                                                  //margin: EdgeInsets.only(top: 140,left: 10),
                                                                  height: 60,
                                                                  width: 200,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                    children: [
                                                                      Text(
                                                                        controller
                                                                            .Event_list[index]
                                                                            .date!,
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                            "Roboto",
                                                                            overflow: TextOverflow
                                                                                .ellipsis,
                                                                            fontWeight: FontWeight
                                                                                .w600,
                                                                            fontSize:
                                                                            13.5,
                                                                            color:
                                                                            Colors.white),
                                                                      ),

                                                                      /* Text(
                                                            textAlign: TextAlign.justify,
                                                            maxLines: 2,
                                                            controller.Event_list[index].title!,
                                                            style: TextStyle(
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                                fontSize: 12.5,
                                                                fontWeight: FontWeight.w500,
                                                                color: Colors.yellow),
                                                          ),*/

                                                                      Padding(
                                                                        padding:
                                                                        const EdgeInsets.symmetric(vertical: 2),
                                                                        child:
                                                                        Row(
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 9,
                                                                              child: GlobalLocalText(
                                                                                maxLines: 1,
                                                                                text: "${controller.Event_list[index].title}",
                                                                                size: 16,
                                                                                textColor: Colors.white,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              flex: 1,
                                                                              child: Icon(
                                                                                Icons.arrow_forward_ios,
                                                                                color: ColorValues.kRedColor,
                                                                                size: 20,
                                                                              ),
                                                                            )
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ))

                                                    /* Padding(
                                            padding: const EdgeInsets.only(left: 10, right: 10),
                                            child: Card(
                                                clipBehavior: Clip.hardEdge,
                                                margin: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(5)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              '${ApiService.IMAGE_URL+controller.Event_list[index].image!}'),
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
                                                            "${controller.Event_list[index].date}",
                                                            textColor: Colors.white,
                                                            fontWeight:
                                                            FontWeight.w400),
                                                        SizedBox(
                                                          height: 5,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 9,
                                                              child: GlobalLocalText(
                                                                maxLines: 1,
                                                                text:
                                                                "${controller.Event_list[index].title}",
                                                                size: 16,
                                                                textColor: Colors.white,
                                                                fontWeight:
                                                                FontWeight.bold,
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Icon(
                                                                Icons.arrow_forward_ios,
                                                                color:
                                                                ColorValues.kRedColor,
                                                                size: 18,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  //height: 70,
                                                  width: 200,
                                                )),
                                          ),*/
                                                  );
                                                }),
                                          ),
                                        )),
                                  ],
                                ),
                              ),

                            // Advertisement
                            if (controller.selectionList[index].id == 8)
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 5.0, right: 5.0,bottom: 10),
                                child: Card(
                                  elevation: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: isDark(context)
                                            ? Color(0xFF414040)
                                            : controller.selectionList[index].bgType == 0
                                            ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
                                            : Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                              ApiService.IMAGE_URL +
                                                  controller
                                                      .selectionList[index].bgValue
                                                      .toString(),
                                            ),
                                            fit: BoxFit.fill)),
                                    height: 80,
                                    width: double.infinity,
                                    child: Image.network(
                                      ApiService.IMAGE_URL + controller.adv_image.value,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ),

                            // Photo Slider
                            if (controller.selectionList[index].id == 9)
                              Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if(controller.selectionList[2].id == 9)
                                        SizedBox()
                                      else
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Column(
                                            children: [
                                              Center(
                                                child: GlobalLocalText(
                                                  textAlign: TextAlign.center,
                                                  text: controller.selectionList[index].title,
                                                  fontWeight: FontWeight.bold,
                                                  size: 20,
                                                  textColor: controller.hexToColor(controller.selectionList[index].titleColor.toString()),
                                                ),
                                              ),
                                              Center(
                                                child: GlobalLocalText(
                                                  textAlign: TextAlign.center,
                                                  text:controller.selectionList[index].subTitle,
                                                  fontWeight: FontWeight.bold,
                                                  size: 20,
                                                  textColor:controller.hexToColor(controller.selectionList[index].subTitleColor.toString()),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 10,bottom:10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: isDark(context)
                                                  ? Color(0xFF414040)
                                                  : controller.selectionList[index].bgType == 0
                                                  ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
                                                  : Colors.transparent,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    ApiService.IMAGE_URL +
                                                        controller
                                                            .selectionList[index].bgValue
                                                            .toString(),
                                                  ),
                                                  fit: BoxFit.fill)),
                                          child: SizedBox(
                                            height: 400,
                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount:
                                                controller.slider_image.length,
                                                itemBuilder: (BuildContext, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets.only(
                                                        top:5,left: 5, right: 5, bottom: 5),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.asset(
                                                        controller.slider_image[index],
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),

                            // Announcement
                            if (controller.selectionList[index].id == 10)
                              Container(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      if(controller.selectionList[2].id == 10)
                                        SizedBox()
                                      else
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: GlobalLocalText(
                                            text: controller.selectionList[index].title,
                                            fontWeight: FontWeight.bold,
                                            size: 16,
                                          ),
                                        ),
                                      controller.isLoading_Announcement == false
                                          ? Padding(
                                        padding: EdgeInsets.only(top: 10.0,bottom:10),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                              color: isDark(context)
                                                  ? Color(0xFF414040)
                                                  : controller.selectionList[index].bgType == 0
                                                  ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
                                                  : Colors.transparent,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    ApiService.IMAGE_URL +
                                                        controller
                                                            .selectionList[index].bgValue
                                                            .toString(),
                                                  ),
                                                  fit: BoxFit.fill)),
                                          child: SizedBox(
                                            height: 160,
                                            child: ListView.builder(
                                                scrollDirection:
                                                Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: controller
                                                    .Announcement_list.length,
                                                itemBuilder:
                                                    (BuildContext, index) {
                                                  return Padding(
                                                    padding:
                                                    const EdgeInsets.only(
                                                        left: 10,
                                                        right: 10,
                                                        bottom: 5,
                                                        top: 5),
                                                    child: Card(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              8)),
                                                      margin: EdgeInsets.zero,
                                                      elevation: 3,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                8)),
                                                        width: 300,
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets
                                                              .only(
                                                              left: 10,
                                                              right: 10,
                                                              top: 20,
                                                              bottom: 10),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                            children: [
                                                              Text_widget(
                                                                  Simpletext: controller
                                                                      .Announcement_list[
                                                                  index]
                                                                      .title,
                                                                  fontSize:
                                                                  14.5,
                                                                  color: Color(
                                                                      ColorValues
                                                                          .RED),
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                              Flexible(
                                                                child:
                                                                Text_widget(
                                                                  maxLines: 4,
                                                                  Simpletext:
                                                                  '${controller.Announcement_list[index].content.toString().replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ')}',
                                                                  fontSize:
                                                                  14.0,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 3,
                                                              ),
                                                              Align(
                                                                  alignment:
                                                                  Alignment
                                                                      .centerRight,
                                                                  child:
                                                                  InkWell(
                                                                    onTap: () {
                                                                      showModalBottomSheet(
                                                                          shape:
                                                                          RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                                                                          backgroundColor: Colors.white,
                                                                          context: context,
                                                                          builder: (context) {
                                                                            return Padding(
                                                                              padding: const EdgeInsets.only(left: 20, right: 8, bottom: 20),
                                                                              child: SingleChildScrollView(
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Align(
                                                                                      alignment: Alignment.topRight,
                                                                                      child: IconButton(
                                                                                          onPressed: () {
                                                                                            Get.back();
                                                                                          },
                                                                                          icon: Icon(Icons.cancel_outlined)),
                                                                                    ),
                                                                                    Text_widget(Simpletext: controller.Announcement_list[index].title, fontSize: 16.0, color: Color(ColorValues.RED)),
                                                                                    SizedBox(
                                                                                      height: 8,
                                                                                    ),
                                                                                    Text_widget(maxLines: 10, Simpletext: '${controller.Announcement_list[index].content.toString().replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ')}', fontSize: 16.0, color: Color(ColorValues.DIVIDER_COL)),
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
                                                                              overflow: TextOverflow.ellipsis,
                                                                              color: Colors.red,
                                                                              decoration: TextDecoration.underline),
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
                                      )
                                          : Shimmer.fromColors(
                                          baseColor: Colors.black,
                                          highlightColor: Colors.red,
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.only(top: 20),
                                            child: SizedBox(
                                              height: 125,
                                              child: ListView.builder(
                                                  itemCount: controller.Announcement_list.length,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                  Axis.horizontal,
                                                  itemBuilder:
                                                      (BuildContext, index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        // if (index == 0) {
                                                        //   Get.toNamed(Routes
                                                        //       .LEAVES_SCREEN);
                                                        // } else if (index == 1) {
                                                        //   Get.toNamed(Routes
                                                        //       .NOTICE_BOARD);
                                                        // } else if (index == 2) {
                                                        //   Get.toNamed(Routes
                                                        //       .BUSROOT_SCREEN);
                                                        // } else if (index == 3) {
                                                        //   Get.toNamed(Routes
                                                        //       .SCHOOL_ROOLS_SCREEN);
                                                        // } else if (index == 4) {
                                                        //   Get.toNamed(Routes
                                                        //       .QUIRY_SCREEN);
                                                        // }
                                                      },
                                                      child: Padding(
                                                        padding:
                                                        const EdgeInsets.only(
                                                            left: 10,
                                                            bottom: 05,
                                                            right: 10),
                                                        child: Card(
                                                            elevation: 03,
                                                            margin:
                                                            EdgeInsets.zero,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    5)),
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color:
                                                                  color.value,
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      5)),
                                                              // height: 70,
                                                              //width: 120,
                                                              child: Container(
                                                                width: 160,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                      CircleAvatar(
                                                                        backgroundColor:
                                                                        Color(
                                                                            ColorValues.RED),
                                                                        child:
                                                                        Icon(
                                                                          controller
                                                                              .icons[index],
                                                                          color: Colors
                                                                              .white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                      GlobalLocalText(
                                                                        text: controller
                                                                            .title[
                                                                        index],
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                        size: 15,
                                                                        textAlign:
                                                                        TextAlign
                                                                            .center,
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
                                          )),
                                    ]),
                              ),

                            // image slider
                            if (controller.selectionList[index].id == 13)
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0,bottom:10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: isDark(context)
                                          ? Color(0xFF414040)
                                          : controller.selectionList[index].bgType == 0
                                          ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
                                          : Colors.transparent,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            ApiService.IMAGE_URL +
                                                controller
                                                    .selectionList[
                                                index]
                                                    .bgValue
                                                    .toString(),
                                          ),
                                          fit: BoxFit.fill)),
                                  height: 290,
                                  child: Column(
                                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(height: 10),
                                      Stack(
                                        children: [
                                          CarouselSlider(
                                            items: _getImageSlider(),
                                            carouselController: CarouselController(),
                                            options: CarouselOptions(
                                                autoPlay: true,
                                                enlargeCenterPage: false,
                                                height: 270,
                                                viewportFraction: 1.0,
                                                onPageChanged: (index, reason) {
                                                  setState(() {
                                                    controller.imageSliderindex
                                                        .value = index;
                                                  }
                                                  );
                                                }
                                            ),
                                          ),
                                          Positioned(
                                            bottom:10,
                                            child: Container(
                                              width: width,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: controller.imgListSlider.asMap().entries.map((entry) {
                                                  return Container(
                                                    width: 10,
                                                    height: 10,
                                                    margin: EdgeInsets.symmetric(
                                                        horizontal: 4),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 1),
                                                      shape: BoxShape.circle,
                                                      color: controller.imageSliderindex.value == entry.key
                                                          ? Colors.white
                                                          : null,
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              ),

                           // video player
                            if (controller.selectionList[index].id == 14)
                              controller.selectionList[index].extra!.isNotEmpty
                              ?Container(
                                  width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: isDark(context)
                                        ? Color(0xFF414040)
                                        : controller.selectionList[index].bgType == 0
                                        ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
                                        : Colors.transparent,
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          ApiService.IMAGE_URL +
                                              controller
                                                  .selectionList[index].bgValue
                                                  .toString(),
                                        ),
                                        fit: BoxFit.fill)),
                                child: Container(
                                  height: 200,
                                  width: width,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child:Stack(
                                        children: [
                                          Container(
                                            width: width,
                                            child: Image.network( ApiService.IMAGE_URL+controller.selectionList[index].extra![0].thumbnail.toString(),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  width: width,
                                                  child: IconButton(
                                                      tooltip: "play",
                                                      onPressed: (){


                                                        showGeneralDialog(
                                                          context: context,
                                                          barrierColor: Colors.black12.withOpacity(0.6), // Background color
                                                          barrierDismissible: true,
                                                          barrierLabel: 'Dialog',
                                                          transitionDuration: Duration(milliseconds: 400),
                                                          pageBuilder: (BuildContext context, __, ___) {
                                                            return Container(
                                                              height: MediaQuery.of(context).size.height,
                                                              width: MediaQuery.of(context).size.width,
                                                              color: Colors.black,
                                                              child: Stack(
                                                                children: [
                                                                  Align(alignment:Alignment.center,
                                                                    child: Container(
                                                                      width: MediaQuery.of(context).size.width,
                                                                      padding: EdgeInsets.all(10),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(10)
                                                                      ),
                                                                      child: ClipRRect(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        child:  YoutubePlayer(
                                                                            controller: YoutubePlayerController(
                                                                                initialVideoId:YoutubePlayer.convertUrlToId(controller.selectionList[index].extra![0].redirectionUrl.toString()).toString(),
                                                                                flags: YoutubePlayerFlags(
                                                                                    enableCaption:true,
                                                                                    disableDragSeek: true,
                                                                                    forceHD: false,
                                                                                    autoPlay: true,
                                                                                    showLiveFullscreenButton: true
                                                                                )
                                                                            )
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    top: 40,
                                                                    left: 20,
                                                                    child: Material(
                                                                      color: Colors.transparent,
                                                                      child: InkWell(
                                                                        onTap: (){
                                                                          Get.back();
                                                                          SystemChrome.setPreferredOrientations([
                                                                            DeviceOrientation.portraitUp,
                                                                            DeviceOrientation.portraitDown,
                                                                          ]);
                                                                        },
                                                                        child: Container(
                                                                            height: 50,
                                                                            width: 50,
                                                                            decoration: BoxDecoration(
                                                                                shape:BoxShape.circle
                                                                            ),
                                                                            child: Icon(Icons.close,size: 40,color: Colors.white,)),
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );



                                                        // _videoWidget(context);
                                                      },
                                                      icon: Icon(
                                                          Icons.play_arrow,
                                                          size: 50,
                                                          color: Colors.white
                                                      )
                                                  )
                                              )
                                          )
                                        ],
                                      )
                                  ),
                                ),
                              ):SizedBox(),


                            /*// main menu
                        if (controller.selectionList[index].id == 6)
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.UPCOMING_EVENT);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                  backgroundColor:
                                                      Color(ColorValues.RED),
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
                                                      text: "Upcoming Events"
                                                          .toUpperCase(),
                                                      size: 17,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.ASSIGNMENT);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                  backgroundColor:
                                                      Color(ColorValues.RED),
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
                                                      text: "Assignments"
                                                          .toUpperCase(),
                                                      size: 17,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.SYLLABUS);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                  backgroundColor:
                                                      Color(ColorValues.RED),
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
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed("/accedmic-content");
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                  backgroundColor:
                                                      Color(ColorValues.RED),
                                                  child: Icon(
                                                    Icons
                                                        .theater_comedy_outlined,
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
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                              ],
                            ),
                          ),*/

                            /* InkWell(
                                  onTap: () {
                                    var data = {"title": "Time Table"};
                                    Get.toNamed("/time-table-screen");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                  backgroundColor: Color(
                                                      ColorValues.RED),
                                                  child: Icon(
                                                    Icons
                                                        .theater_comedy_outlined,
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
                                                      fontWeight: FontWeight
                                                          .w500,
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
                                              padding: const EdgeInsets.all(
                                                  8.0),
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
                               //  SizedBox(
                               //    height: 8,
                               //  ),*/
                            /* Padding(
                                  padding: const EdgeInsets.only(left: 4.0,right: 4.0),
                                  child: ImageSlideshow(
                                    height: MediaQuery.of(context).size.height/2,
                                    indicatorRadius: 4.0,
                                    indicatorColor: Colors.white,
                                    onPageChanged: (value) {
                                      debugPrint('Page changed: $value');
                                    },
                                    autoPlayInterval: 2000,
                                    isLoop: true,
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Image.asset(
                                            'assets/Slider/1.png',
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            bottom: 40.0,
                                            child: Column(
                                              children: [
                                                Text_widget(
                                                    fontWeight: FontWeight.bold,
                                                    maxLines: 10,
                                                    Simpletext:"Pool Party",
                                                    fontSize:
                                                    30.0,
                                                    color: Color(
                                                        ColorValues
                                                            .WHITE)),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      left: 00,
                                                      bottom: 00),
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                        Color(ColorValues
                                                            .RED),
                                                      ),
                                                      onPressed: () {
                                                      },
                                                      child: GlobalLocalText(
                                                        textColor: Colors
                                                            .white,
                                                        text: "Explore More",
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Image.asset(
                                            'assets/Slider/2.png',
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            bottom: 40.0,
                                            child: Column(
                                              children: [
                                                Text_widget(
                                                    fontWeight: FontWeight.bold,
                                                    maxLines: 10,
                                                    Simpletext:"Games",
                                                    fontSize:
                                                    30.0,
                                                    color: Color(
                                                        ColorValues
                                                            .WHITE)),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      left: 00,
                                                      bottom: 00),
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                        Color(ColorValues
                                                            .RED),
                                                      ),
                                                      onPressed: () {
                                                      },
                                                      child: GlobalLocalText(
                                                        textColor: Colors
                                                            .white,
                                                        text: "Explore More",
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        alignment: Alignment.bottomCenter,
                                        children: [
                                          Image.asset(
                                            'assets/Slider/3.png',
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            bottom: 40.0,
                                            child: Column(
                                              children: [
                                                Text_widget(
                                                    fontWeight: FontWeight.bold,
                                                    maxLines: 10,
                                                    Simpletext:"Winners",
                                                    fontSize:
                                                    30.0,
                                                    color: Color(
                                                        ColorValues
                                                            .WHITE)),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .only(
                                                      left: 00,
                                                      bottom: 00),
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                        Color(ColorValues
                                                            .RED),
                                                      ),
                                                      onPressed: () {
                                                      },
                                                      child: GlobalLocalText(
                                                        textColor: Colors
                                                            .white,
                                                        text: "Explore More",
                                                      )),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),*/
                            /* CarouselSlider(
                                    items: controller.imgList
                                        .map((item) => Container(
                                      child: Stack(
                                        children: <Widget>[
                                          Image.network(item, fit: BoxFit.fill, width: 1400),
                                          Positioned(
                                            bottom: 0.0,
                                            left: 0.0,
                                            right: 0.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Color.fromARGB(200, 0, 0, 0),
                                                    Color.fromARGB(0, 0, 0, 0)
                                                  ],
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.0, horizontal: 20.0),
                                              child: Text(
                                                'No. ${controller.imgList.indexOf(item)} image',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                                        .toList(),
                                    carouselController: controller
                                        .slidercontroller,
                                    options: CarouselOptions(
                                        autoPlay: true,
                                        enlargeCenterPage: true,
                                        aspectRatio: 2.0,
                                        onPageChanged: (index, reason) {
                                          // setState(() {
                                          controller.current = index;
                                          // });
                                        }),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: controller.imgList
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                      return GestureDetector(
                                        onTap: () => controller.slidercontroller
                                            .animateToPage(entry.key),
                                        child: Container(
                                          width: 12.0,
                                          height: 12.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: (Theme
                                                  .of(context)
                                                  .brightness == Brightness.dark
                                                  ? Colors.white
                                                  : Colors.black)
                                                  .withOpacity(
                                                  controller.current ==
                                                      entry.key ? 0.9 : 0.4)),
                                        ),
                                      );
                                    }).toList(),
                                  ),*/
                          ],
                        ),
                      );
                    },
                  ),
                ),

              ],
            ),
            physics: BouncingScrollPhysics(),
            footer: ClassicFooter(
              loadStyle: LoadStyle.HideAlways,
              completeDuration: Duration(milliseconds: 500),
            ),
            onRefresh: () async {
              await controller.refrshApi();
              await Future.delayed(Duration(milliseconds: 1000));

              if (true)  refreshController.refreshCompleted();
            },
          )
      );
      // }
    });
  }

  // _videoWidget(context){
  //   showGeneralDialog(
  //     context: context,
  //     barrierColor: Colors.black12.withOpacity(0.6), // Background color
  //     barrierDismissible: true,
  //     barrierLabel: 'Dialog',
  //     transitionDuration: Duration(milliseconds: 400),
  //     pageBuilder: (BuildContext context, __, ___) {
  //       return Container(
  //         height: MediaQuery.of(context).size.height,
  //         width: MediaQuery.of(context).size.width,
  //         color: Colors.black,
  //         child: Stack(
  //           children: [
  //             Container(
  //               width: MediaQuery.of(context).size.width,
  //               padding: EdgeInsets.all(10),
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10)
  //               ),
  //               child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   ClipRRect(
  //                       borderRadius: BorderRadius.circular(10),
  //                       child:  YoutubePlayer(
  //                           controller: _controller
  //                       ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             Positioned(
  //               top: 50,
  //               left: 20,
  //               child: Container(
  //                 height: 50,
  //                 width: 50,
  //                 decoration: BoxDecoration(
  //                     shape:BoxShape.circle
  //                 ),
  //                   child: Icon(Icons.close,size: 40,color: Colors.white,)),
  //             )
  //           ],
  //         ),
  //       );
  //     },
  //   );
  //
  // }

  List<Widget> _getImageSlider() {
    final List<Widget> imageSliders = controller.imgListSlider
        .map((imgListSlider) => _buildImageView(imgListSlider))
        .toList();

    return imageSliders;
  }

  // List<Widget> _getImageSlider(int idx) {
  //   final List<Widget> imageSliders = controller.imgListSlider.map((item) => _buildImageView(imgListSlider.toString())).toList();
  //
  //   return imageSliders;
  // }

  Widget _buildImageView(String imageUrl) {
    return Container(
      height: 270,
      // margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.fill),
      ),
    );
  }

}
//
//
// class HomeScreenView extends GetView<HomeScreenController> {
//   TabController? _tabController;
//
//   Future<void> _showSimpleDialog(context) async {
//     await showDialog<void>(
//         barrierDismissible: false,
//         context: context,
//         builder: (BuildContext context) {
//           return SimpleDialog(
//             // <-- SEE HERE
//             title: Row(
//               children: [
//                 Expanded(flex: 1, child: Container()),
//                 Expanded(
//                     flex: 9,
//                     child: Center(child: const Text('Switch Profile'))),
//                 Expanded(
//                   flex: 1,
//                   child: GestureDetector(
//                     onTap: () {
//                       Get.back();
//                     },
//                     child: Icon(
//                       Icons.cancel,
//                       size: 25,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             children: <Widget>[
//               Container(
//                 constraints: BoxConstraints(
//                   maxHeight: 300,
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       for (int i = 0; i < controller.Sibling.length; i++)
//                         /*Obx(()=>
//                    GFRadioListTile(
//                     titleText: '${controller.Studentdata[i]['titleText']}',
//                     subTitleText: '${controller.Studentdata[i]['subTitleText']}',
//                     avatar: GFAvatar(
//                       backgroundImage: AssetImage('assets/profileimages.jpeg'),
//                     ),
//                     size: 20,
//                     radioColor: Color(ColorValues.RED),
//                     activeBorderColor: Colors.red,
//                     focusColor: Colors.red,
//                     //color: Colors.red,
//                     selected: false,
//                     type: GFRadioType.basic,
//                     value: 1,
//                     groupValue: controller.groupValue.value,
//                     onChanged: (value) {
//                       controller.groupValue.value = value;
//
//                       print('groupValue---------------------------------${controller.groupValue.value}');
//                     },
//                     inactiveIcon: null,
//                   ),
//
//               ),*/
//
//                         controller.Sibling[i].full_name != userData!.full_name
//                             ? Obx(
//                                 () => GFCheckboxListTile(
//                                   color: Colors.black12,
//                                   titleText:
//                                       '${controller.Sibling[i].full_name}',
//                                   subTitleText:
//                                       '${controller.Sibling[i].Class + ","}' +
//                                           ' Section-' +
//                                           '${controller.Sibling[i].section}',
//                                   avatar: userData!.profile_image.isNotEmpty
//                                       ? Container(
//                                           decoration: BoxDecoration(
//                                               color: Colors.red,
//                                               borderRadius:
//                                                   BorderRadius.circular(5)),
//                                           height: 60,
//                                           width: 55,
//                                           child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                               child: Image.network(
//                                                 "${ApiService.IMAGE_URL + controller.Sibling[i].profile_image}",
//                                                 fit: BoxFit.cover,
//                                               )),
//                                         )
//                                       : Container(
//                                           decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(5)),
//                                           height: 60,
//                                           width: 55,
//                                           child: Center(
//                                             child: Text_widget(
//                                               Simpletext: controller
//                                                       .Sibling[i].full_name
//                                                       .toString()
//                                                       .substring(0, 1) +
//                                                   controller.Sibling[i].lastname
//                                                       .toString()
//                                                       .substring(0, 1),
//                                               fontSize: 15.0,
//                                               maxLines: 1,
//                                               color: Colors.red,
//                                             ),
//                                           )),
//                                   /*  GFAvatar(
//                                 backgroundImage: NetworkImage('${ApiService.IMAGE_URL+controller.Sibling[i].profile_image}'),
//                               ),*/
//                                   size: 14,
//                                   activeBgColor: Colors.red,
//                                   type: GFCheckboxType.circle,
//                                   activeIcon: Icon(
//                                     Icons.check,
//                                     size: 10,
//                                     color: Colors.white,
//                                   ),
//                                   onChanged: (value) {
//                                     for (int i = 0;
//                                         i < controller.isChecked.length;
//                                         i++) {
//                                       controller.isChecked[i] = false;
//                                       controller.token.value = '';
//                                     }
//                                     controller.isChecked[i] = value;
//                                     controller.token.value =
//                                         controller.Sibling[i].token;
//                                     print('token--------${controller.token}');
//                                   },
//                                   value: controller.isChecked[i],
//                                   inactiveIcon: null,
//                                 ),
//                               )
//                             : Text_widget(
//                                 Simpletext: 'Another Profile Not Found.',
//                                 fontSize: 18.0,
//                                 color: ColorValues.BLACK,
//                               )
//                     ],
//                   ),
//                 ),
//               ),
//               for (int i = 0; i < controller.Sibling.length; i++)
//                 if (controller.Sibling[i].full_name != userData!.full_name)
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10.0, right: 10),
//                     child: RoundedFilledButton(
//                       label: 'SWITCH PROFILE',
//                       color: Color(ColorValues.RED),
//                       height: 40,
//                       width: double.infinity,
//                       fontSize: 12,
//                       ontap: () async {
//                         if (controller.token.value.isEmpty) {
//                           ToastClass.showToast(
//                               'Please select profile', 'assets/only_logo.png');
//                         } else {
//                           await my_local_service
//                               .updateSharedPreferencesFromServer(
//                                   controller.token.value);
//                           Get.back();
//                           ToastClass.showToast('Profile Switch succesfully.',
//                               'assets/only_logo.png');
//                         }
//                         // Get.to(DeshboardScreenView())
//                       },
//                     ),
//                   ),
//
//               /* GestureDetector(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Center(
//                   child: Padding(
//                     padding: EdgeInsets.all(20.0),
//                     child: GlobalLocalText(
//                       text: "Cancle",
//                       size: 14,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),*/
//             ],
//           );
//         });
//   }
//
//   HomeScreenView({Key? key}) : super(key: key);
//
//   static bool isDark(BuildContext context) {
//     return Theme.of(context).brightness == Brightness.dark;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var color = (isDark(context) ? Color(0xFF414040) : Colors.white).obs;
//     var color1 = (isDark(context) ? Colors.white : Colors.black).obs;
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Obx(() {
//       //   if(controller.isLoading.isTrue){
//       //   return Center(
//       //       child: SpinKitThreeBounce(
//       //         color: Colors.red,
//       //         size: 40,
//       //       ));
//       //
//       // }else{
//       return Scaffold(
//           body: SmartRefresher(
//             controller: controller.refreshController,
//             enablePullUp: true,
//             enablePullDown: true,
//             header: MaterialClassicHeader(),
//             child: CustomScrollView(
//           semanticChildCount: 2,
//           shrinkWrap: true,
//           slivers: <Widget>[
//             if(controller.isLoading_selectionList == false)
//             SliverAppBar(
//                 titleSpacing: 0,
//                 toolbarHeight: 90,
//                 excludeHeaderSemantics: true,
//                 backgroundColor: controller.selectionList[0].bgType == 0
//                     ? controller.hexToColor(
//                         controller.selectionList[0].bgValue.toString())
//                     : Colors.transparent,
//                 floating: false,
//                 stretch: false,
//                 automaticallyImplyLeading: false,
//                 pinned: false,
//                  title: Container(height:6000,color: Colors.transparent,),
//                 expandedHeight: controller.selectionList.length != 1
//                ? controller.selectionList[1].id == 2 ?Platform.isIOS?165:200 : 120:120,
//                 flexibleSpace: Stack(
//                   children: [
//                     Container(
//                       height: 200,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: NetworkImage(
//                                 ApiService.IMAGE_URL +
//                                     controller.selectionList[0].bgValue
//                                         .toString(),
//                               ),
//                               fit: BoxFit.fill)),
//                     ),
//
//                     if(Platform.isIOS)
//                       Padding(
//                         padding: const EdgeInsets.only(left: 15, top:45),
//                         child: Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Flexible(
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     userData!.profile_image.isNotEmpty
//                                         ? Container(
//                                       decoration: BoxDecoration(
//                                           color: Colors.red,
//                                           borderRadius:
//                                           BorderRadius.circular(5)),
//                                       height: 60,
//                                       width: 55,
//                                       child: ClipRRect(
//                                           borderRadius:
//                                           BorderRadius.circular(5),
//                                           child: Image.network(
//                                             "${ApiService.IMAGE_URL + userData!.profile_image}",
//                                             fit: BoxFit.cover,
//                                           )),
//                                     )
//                                         : Container(
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                             BorderRadius.circular(5)),
//                                         height: 60,
//                                         width: 55,
//                                         child: Center(
//                                           child: Text_widget(
//                                             Simpletext: userData!.full_name
//                                                 .toString()
//                                                 .substring(0, 1) +
//                                                 userData!.lastname
//                                                     .toString()
//                                                     .substring(0, 1),
//                                             fontSize: 15.0,
//                                             maxLines: 1,
//                                             color: Colors.red,
//                                           ),
//                                         )),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     Flexible(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               GlobalLocalText(
//                                                 text: "Hello,",
//                                                 size: 16,
//                                                 textColor: Colors.white,
//                                                 fontWeight: FontWeight.w300,
//                                               ),
//                                               SizedBox(
//                                                 width: 2,
//                                               ),
//                                               GlobalLocalText(
//                                                 text: "${userData!.full_name}",
//                                                 textColor: Colors.white,
//                                                 size: 15,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 3,
//                                           ),
//                                           GlobalLocalText(
//                                             text: "Shift ${userData!.shift}",
//                                             size: 12,
//                                             textColor: Colors.white,
//                                             fontWeight: FontWeight.w300,
//                                           ),
//                                           SizedBox(
//                                             height: 3,
//                                           ),
//                                           Flexible(
//                                             child: GlobalLocalText(
//                                               size: 12,
//                                               text:
//                                               "${userData!.Class}, Section-${userData!.section}",
//                                               textColor: Colors.white,
//                                               fontWeight: FontWeight.w300,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   // controller.Slider.value == true
//                                   //     ? IconButton(
//                                   //         onPressed: () {
//                                   //           _showSimpleDialog(context);
//                                   //         },
//                                   //         icon: Icon(
//                                   //           size: 24,
//                                   //           Icons.person,
//                                   //           color: Colors.white,
//                                   //         ))
//                                   //     : SizedBox(),
//                                   IconButton(
//                                       onPressed: () {
//                                         Get.toNamed(Routes.NOTIFICATION);
//                                       },
//                                       icon: Icon(
//                                         size: 24,
//                                         Icons.notifications,
//                                         color: Colors.white,
//                                       )),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       )
//                     else
//                     Padding(
//                       padding: const EdgeInsets.only(left: 15, top:30),
//                       child: Container(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Flexible(
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   userData!.profile_image.isNotEmpty
//                                       ? Container(
//                                           decoration: BoxDecoration(
//                                               color: Colors.red,
//                                               borderRadius:
//                                                   BorderRadius.circular(5)),
//                                           height: 60,
//                                           width: 55,
//                                           child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(5),
//                                               child: Image.network(
//                                                 "${ApiService.IMAGE_URL + userData!.profile_image}",
//                                                 fit: BoxFit.cover,
//                                               )),
//                                         )
//                                       : Container(
//                                           decoration: BoxDecoration(
//                                               color: Colors.white,
//                                               borderRadius:
//                                                   BorderRadius.circular(5)),
//                                           height: 60,
//                                           width: 55,
//                                           child: Center(
//                                             child: Text_widget(
//                                               Simpletext: userData!.full_name
//                                                       .toString()
//                                                       .substring(0, 1) +
//                                                   userData!.lastname
//                                                       .toString()
//                                                       .substring(0, 1),
//                                               fontSize: 15.0,
//                                               maxLines: 1,
//                                               color: Colors.red,
//                                             ),
//                                           )),
//                                   const SizedBox(
//                                     width: 10,
//                                   ),
//                                   Flexible(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             GlobalLocalText(
//                                               text: "Hello,",
//                                               size: 16,
//                                               textColor: Colors.white,
//                                               fontWeight: FontWeight.w300,
//                                             ),
//                                             SizedBox(
//                                               width: 2,
//                                             ),
//                                             GlobalLocalText(
//                                               text: "${userData!.full_name}",
//                                               textColor: Colors.white,
//                                               size: 15,
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 3,
//                                         ),
//                                         GlobalLocalText(
//                                           text: "Shift ${userData!.shift}",
//                                           size: 12,
//                                           textColor: Colors.white,
//                                           fontWeight: FontWeight.w300,
//                                         ),
//                                         SizedBox(
//                                           height: 3,
//                                         ),
//                                         Flexible(
//                                           child: GlobalLocalText(
//                                             size: 12,
//                                             text:
//                                                 "${userData!.Class}, Section-${userData!.section}",
//                                             textColor: Colors.white,
//                                             fontWeight: FontWeight.w300,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 15,
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 // controller.Slider.value == true
//                                 //     ? IconButton(
//                                 //         onPressed: () {
//                                 //           _showSimpleDialog(context);
//                                 //         },
//                                 //         icon: Icon(
//                                 //           size: 24,
//                                 //           Icons.person,
//                                 //           color: Colors.white,
//                                 //         ))
//                                 //     : SizedBox(),
//                                 IconButton(
//                                     onPressed: () {
//                                       Get.toNamed(Routes.NOTIFICATION);
//                                     },
//                                     icon: Icon(
//                                       size: 24,
//                                       Icons.notifications,
//                                       color: Colors.white,
//                                     )),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//
//                     if(controller.selectionList.length == 1)
//                       SizedBox()
//                     else
//                     if (controller.selectionList[1].id == 2)
//                       Align(
//                           alignment: Alignment.bottomCenter,
//                           child: Container(
//                             margin: EdgeInsets.zero,
//                             height: 100,
//                             child: Stack(
//                               children: [
//                                 Align(
//                                     alignment: Alignment.bottomCenter,
//                                     child: Container(
//                                       height: 70,
//                                       decoration: BoxDecoration(
//                                           color: color.value,
//                                           borderRadius: BorderRadius.only(
//                                               topLeft: Radius.circular(30),
//                                               topRight: Radius.circular(30))),
//                                     )),
//                                 Align(
//                                     alignment: Alignment.topCenter,
//                                     child: CircleAvatar(
//                                       backgroundColor: color.value,
//                                       radius: 40,
//                                       child: Padding(
//                                         padding:
//                                             const EdgeInsets.only(bottom: 20.0),
//                                         child: Image.network(
//                                           "${ApiService.IMAGE_URL + controller.selectionList[1].extra![0].appIcon.toString()}",
//                                           height: 50,
//                                         ),
//                                       ),
//                                     )),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       vertical: 12.0),
//                                   child: Align(
//                                     alignment: Alignment.bottomCenter,
//                                     child: Text_widget(
//                                       textAlign: TextAlign.center,
//                                       maxLines: 2,
//                                       Simpletext:
//                                           '${controller.selectionList[1].title.toString()}',
//                                       fontSize: 16.0,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 20.0),
//                                   child: Align(
//                                     alignment: Alignment.bottomCenter,
//                                     child: Container(
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         child: Divider(
//                                             color: controller.hexToColor(
//                                                 controller.selectionList[1]
//                                                     .extra![0].lineColor
//                                                     .toString()))),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ))
//                     else
//                       SizedBox(),
//                   ],
//                 ))
//             else
//               SliverAppBar(
//                   titleSpacing: 0,
//                   toolbarHeight: 90,
//                   excludeHeaderSemantics: true,
//                   backgroundColor: ColorValues.BG_BT2,
//                   floating: false,
//                   stretch: false,
//                   automaticallyImplyLeading: false,
//                   pinned: false,
//                   title: Container(height:6000,color: Colors.transparent,),
//                   expandedHeight: Platform.isIOS?165:200 ,
//                   flexibleSpace: Stack(
//                     children: [
//                       Container(
//                         height: 200,
//                       ),
//                       if(Platform.isIOS)
//                       Padding(
//                         padding: const EdgeInsets.only(left: 15, top: 45),
//                         child: Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Flexible(
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     userData!.profile_image.isNotEmpty
//                                         ? Container(
//                                       decoration: BoxDecoration(
//                                           color: Colors.red,
//                                           borderRadius:
//                                           BorderRadius.circular(5)),
//                                       height: 60,
//                                       width: 55,
//                                       child: ClipRRect(
//                                           borderRadius:
//                                           BorderRadius.circular(5),
//                                           child: Image.network(
//                                             "${ApiService.IMAGE_URL + userData!.profile_image}",
//                                             fit: BoxFit.cover,
//                                           )),
//                                     )
//                                         : Container(
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                             BorderRadius.circular(5)),
//                                         height: 60,
//                                         width: 55,
//                                         child: Center(
//                                           child: Text_widget(
//                                             Simpletext: userData!.full_name
//                                                 .toString()
//                                                 .substring(0, 1) +
//                                                 userData!.lastname
//                                                     .toString()
//                                                     .substring(0, 1),
//                                             fontSize: 15.0,
//                                             maxLines: 1,
//                                             color: Colors.red,
//                                           ),
//                                         )),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     Flexible(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               GlobalLocalText(
//                                                 text: "Hello,",
//                                                 size: 16,
//                                                 textColor: Colors.white,
//                                                 fontWeight: FontWeight.w300,
//                                               ),
//                                               SizedBox(
//                                                 width: 2,
//                                               ),
//                                               GlobalLocalText(
//                                                 text: "${userData!.full_name}",
//                                                 textColor: Colors.white,
//                                                 size: 15,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 3,
//                                           ),
//                                           GlobalLocalText(
//                                             text: "Shift ${userData!.shift}",
//                                             size: 12,
//                                             textColor: Colors.white,
//                                             fontWeight: FontWeight.w300,
//                                           ),
//                                           SizedBox(
//                                             height: 3,
//                                           ),
//                                           Flexible(
//                                             child: GlobalLocalText(
//                                               size: 12,
//                                               text:
//                                               "${userData!.Class}, Section-${userData!.section}",
//                                               textColor: Colors.white,
//                                               fontWeight: FontWeight.w300,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   // controller.Slider.value == true
//                                   //     ? IconButton(
//                                   //         onPressed: () {
//                                   //           _showSimpleDialog(context);
//                                   //         },
//                                   //         icon: Icon(
//                                   //           size: 24,
//                                   //           Icons.person,
//                                   //           color: Colors.white,
//                                   //         ))
//                                   //     : SizedBox(),
//                                   IconButton(
//                                       onPressed: () {
//                                         Get.toNamed(Routes.NOTIFICATION);
//                                       },
//                                       icon: Icon(
//                                         size: 24,
//                                         Icons.notifications,
//                                         color: Colors.white,
//                                       )),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       )
//                       else
//                         Padding(
//                         padding: const EdgeInsets.only(left: 15, top: 30),
//                         child: Container(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Flexible(
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     userData!.profile_image.isNotEmpty
//                                         ? Container(
//                                       decoration: BoxDecoration(
//                                           color: Colors.red,
//                                           borderRadius:
//                                           BorderRadius.circular(5)),
//                                       height: 60,
//                                       width: 55,
//                                       child: ClipRRect(
//                                           borderRadius:
//                                           BorderRadius.circular(5),
//                                           child: Image.network(
//                                             "${ApiService.IMAGE_URL + userData!.profile_image}",
//                                             fit: BoxFit.cover,
//                                           )),
//                                     )
//                                         : Container(
//                                         decoration: BoxDecoration(
//                                             color: Colors.white,
//                                             borderRadius:
//                                             BorderRadius.circular(5)),
//                                         height: 60,
//                                         width: 55,
//                                         child: Center(
//                                           child: Text_widget(
//                                             Simpletext: userData!.full_name
//                                                 .toString()
//                                                 .substring(0, 1) +
//                                                 userData!.lastname
//                                                     .toString()
//                                                     .substring(0, 1),
//                                             fontSize: 15.0,
//                                             maxLines: 1,
//                                             color: Colors.red,
//                                           ),
//                                         )),
//                                     const SizedBox(
//                                       width: 10,
//                                     ),
//                                     Flexible(
//                                       child: Column(
//                                         crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             children: [
//                                               GlobalLocalText(
//                                                 text: "Hello,",
//                                                 size: 16,
//                                                 textColor: Colors.white,
//                                                 fontWeight: FontWeight.w300,
//                                               ),
//                                               SizedBox(
//                                                 width: 2,
//                                               ),
//                                               GlobalLocalText(
//                                                 text: "${userData!.full_name}",
//                                                 textColor: Colors.white,
//                                                 size: 15,
//                                                 fontWeight: FontWeight.bold,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 3,
//                                           ),
//                                           GlobalLocalText(
//                                             text: "Shift ${userData!.shift}",
//                                             size: 12,
//                                             textColor: Colors.white,
//                                             fontWeight: FontWeight.w300,
//                                           ),
//                                           SizedBox(
//                                             height: 3,
//                                           ),
//                                           Flexible(
//                                             child: GlobalLocalText(
//                                               size: 12,
//                                               text:
//                                               "${userData!.Class}, Section-${userData!.section}",
//                                               textColor: Colors.white,
//                                               fontWeight: FontWeight.w300,
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height: 15,
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   // controller.Slider.value == true
//                                   //     ? IconButton(
//                                   //         onPressed: () {
//                                   //           _showSimpleDialog(context);
//                                   //         },
//                                   //         icon: Icon(
//                                   //           size: 24,
//                                   //           Icons.person,
//                                   //           color: Colors.white,
//                                   //         ))
//                                   //     : SizedBox(),
//                                   IconButton(
//                                       onPressed: () {
//                                         Get.toNamed(Routes.NOTIFICATION);
//                                       },
//                                       icon: Icon(
//                                         size: 24,
//                                         Icons.notifications,
//                                         color: Colors.white,
//                                       )),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       Align(
//                               alignment: Alignment.bottomCenter,
//                               child: Container(
//                                 margin: EdgeInsets.zero,
//                                 height: 100,
//                                 child: Stack(
//                                   children: [
//                                     Align(
//                                         alignment: Alignment.bottomCenter,
//                                         child: Container(
//                                           height: 70,
//                                           decoration: BoxDecoration(
//                                               color: color.value,
//                                               borderRadius: BorderRadius.only(
//                                                   topLeft: Radius.circular(30),
//                                                   topRight: Radius.circular(30))),
//                                         )),
//                                     Align(
//                                         alignment: Alignment.topCenter,
//                                         child: CircleAvatar(
//                                           backgroundColor: color.value,
//                                           radius: 40,
//                                           child: Padding(
//                                             padding:
//                                             const EdgeInsets.only(bottom: 20.0),
//                                             child: Container(
//                                               height: 60,
//                                               width: 60,
//                                             )
//                                           ),
//                                         )),
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           vertical: 12.0),
//                                       child: Align(
//                                         alignment: Alignment.bottomCenter,
//                                         child: Text_widget(
//                                           textAlign: TextAlign.center,
//                                           maxLines: 2,
//                                           Simpletext:
//                                           '',
//                                           fontSize: 16.0,
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(top: 20.0),
//                                       child: Align(
//                                         alignment: Alignment.bottomCenter,
//                                         child: Container(
//                                             width:
//                                             MediaQuery.of(context).size.width,
//                                             child: Divider(),
//                                       ),
//                                     )
//                                     )
//                                   ],
//                                 ),
//                               ))
//
//                     ],
//                   )
//               ),
//
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 childCount: controller.selectionList.length,
//                 (BuildContext context, int index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                         color: color.value,
//                         // borderRadius: BorderRadius.only(
//                         //     topLeft: Radius.circular(30),
//                         //     topRight: Radius.circular(30))
//
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       //  mainAxisSize: MainAxisSize.min,
//                       children: [
//
//                         // image slider
//                         if (controller.selectionList[index].id == 3)
//                         Column(
//                           //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             SizedBox(height: 10),
//                             CarouselSlider(
//
//                               items: _getImageSlider(),
//                               carouselController: CarouselController(),
//                               options: CarouselOptions(
//                                   autoPlay: true,
//
//                                   enlargeCenterPage: true,
//                                   height: 200,
//                                   viewportFraction: 1.0,
//                                   aspectRatio: 1.0,
//                                   onPageChanged: (index, reason) {
//                                     setState(() {
//                                       controller.photographerSliderindex
//                                           .value = index;
//                                     }
//                                     );
//                                   }
//                                   ),
//                             ),
//                             SizedBox(height: 24),
//                             Align(
//                                 alignment: Alignment.bottomCenter,
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment:
//                                   MainAxisAlignment.center,
//                                   children: controller.imgListSlider.asMap().entries.map((entry) {
//                                     return Container(
//                                       width: 12,
//                                       height: 12,
//                                       margin: EdgeInsets.symmetric(
//                                           horizontal: 4),
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: Colors.grey,
//                                             width: 1),
//                                         shape: BoxShape.circle,
//                                         color: controller.imgListSlider[] == entry.key
//                                             ? Colors.blue
//                                             : null,
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ),),
//                           ],
//                         ),
//
//
//                         // Highlighter
//                         if (controller.selectionList[index].id == 3)
//                           controller.isLoading_selectionList == false
//                               ? Container(
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       if(controller.selectionList[2].id == 3)
//                                       SizedBox()
//                                       else
//                                       Padding(
//                                         padding: const EdgeInsets.only(
//                                             left: 10, top: 10),
//                                         child: GlobalLocalText(
//                                           text: controller
//                                               .selectionList[index].title,
//                                           fontWeight: FontWeight.bold,
//                                           size: 16,
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding:
//                                             const EdgeInsets.only(top: 10.0,bottom:10),
//                                         child: Container(
//                                           decoration: BoxDecoration(
//                                               color: isDark(context)
//                                                   ? Color(0xFF414040)
//                                                   : controller.selectionList[index].bgType == 0
//                                                   ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
//                                                   : Colors.transparent,
//                                               image: DecorationImage(
//                                                   image: NetworkImage(
//                                                     ApiService.IMAGE_URL +
//                                                         controller
//                                                             .selectionList[
//                                                                 index]
//                                                             .bgValue
//                                                             .toString(),
//                                                   ),
//                                                   fit: BoxFit.fill)),
//                                           height: 250,
//                                           child: ListView.builder(
//                                               scrollDirection: Axis.horizontal,
//                                               itemCount: controller.selectionList[index].extra!.length,
//                                               shrinkWrap: true,
//                                               itemBuilder:
//                                                   (BuildContext, idx1) {
//                                                 var highliter = controller.selectionList[index].extra![idx1];
//                                                 return InkWell(
//                                                     onTap: () {
//                                                       var data = {
//                                                         /* "maintitle": "${controller.slider_data[index]['maintitle']}",
//                                                   "title": "${controller.slider_data[index]['title']}",
//                                                   "images": "${controller.slider_data[index]['images']}",*/
//                                                         "id": "${highliter.id}"
//                                                       };
//                                                       Get.toNamed(
//                                                           Routes
//                                                               .HOME_SLIDER_DETAILS,
//                                                           parameters: data);
//                                                       //  HomeSliderDetailsView
//                                                     },
//                                                     child: Padding(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                               top: 5,
//                                                                 left: 10,
//                                                                 right: 10,
//                                                             bottom: 5),
//                                                         child: Stack(
//                                                           clipBehavior:
//                                                               Clip.hardEdge,
//                                                           children: [
//                                                             Container(
//                                                               clipBehavior:
//                                                                   Clip.hardEdge,
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             10),
//                                                               ),
//                                                               height: 240,
//                                                               width: 220,
//                                                               child: Image.network(
//                                                                   ApiService
//                                                                           .IMAGE_URL +
//                                                                       highliter
//                                                                           .image!,
//                                                                   fit: BoxFit
//                                                                       .cover),
//                                                             ),
//                                                             Padding(
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                           .only(
//                                                                       top:
//                                                                           160.0),
//                                                               child: Container(
//                                                                 height: 80,
//                                                                 width: 220,
//                                                                 decoration:
//                                                                     BoxDecoration(
//                                                                   color: Colors
//                                                                       .black54,
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .only(
//                                                                     topLeft:
//                                                                         Radius
//                                                                             .zero,
//                                                                     topRight:
//                                                                         Radius
//                                                                             .zero,
//                                                                     bottomLeft:
//                                                                         Radius.circular(
//                                                                             10.0),
//                                                                     bottomRight:
//                                                                         Radius.circular(
//                                                                             10.0),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Container(
//                                                               margin: EdgeInsets
//                                                                   .only(
//                                                                       top: 140,
//                                                                       left: 10),
//                                                               height: 80,
//                                                               width: 200,
//                                                               child: Column(
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .end,
//                                                                 children: [
//                                                                   Text(
//                                                                     highliter.title!,
//                                                                     style: TextStyle(
//                                                                         fontFamily:
//                                                                             "Roboto",
//                                                                         overflow: TextOverflow.ellipsis,
//                                                                         fontWeight: FontWeight.w600,
//                                                                         fontSize: 13.5,
//                                                                         color: controller.hexToColor(highliter.titleColor.toString())),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     height: 5,
//                                                                   ),
//                                                                   Text(
//                                                                     textAlign:
//                                                                         TextAlign
//                                                                             .justify,
//                                                                     maxLines: 2,
//                                                                     highliter.shortDescription.toString(),
//                                                                     style: TextStyle(
//                                                                         overflow: TextOverflow.ellipsis,
//                                                                         fontSize: 12.5,
//                                                                         fontWeight: FontWeight.w500,
//                                                                         color: controller.hexToColor(highliter.subTitleColor.toString())
//                                                                     ),
//                                                                   )
//                                                                 ],
//                                                               ),
//                                                             )
//                                                           ],
//                                                         ))
//                                                     /* Padding(
//                                                   padding: const EdgeInsets.only(left: 10),
//                                                   child: Container(
//                                                     height: 80,
//                                                     width: 220,
//                                                     decoration: BoxDecoration(
//                                                         borderRadius:
//                                                         BorderRadius.circular(10),
//                                                         image: DecorationImage(
//                                                             image: NetworkImage(ApiService.IMAGE_URL+controller.Slider[index].image!),
//                                                             fit: BoxFit.cover)
//                                                     ),
//                                                     child: Padding(
//                                                       padding: const EdgeInsets.only(
//                                                           right: 5, bottom: 10, left: 10),
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                         CrossAxisAlignment.start,
//                                                         mainAxisAlignment:
//                                                         MainAxisAlignment.end,
//                                                         children: [
//                                                           Text(
//                                                             controller.Slider[index].title!,
//                                                             style: TextStyle(
//                                                                 fontFamily: "Roboto",
//                                                                 overflow:
//                                                                 TextOverflow.ellipsis,
//                                                                 fontWeight: FontWeight.w600,
//                                                                 fontSize: 13.5,
//                                                                 color: Colors.white),
//                                                           ),
//                                                           SizedBox(
//                                                             height: 5,
//                                                           ),
//                                                           Text(
//                                                             textAlign: TextAlign.justify,
//                                                             maxLines: 3,
//                                                             controller.Slider[index].short_description!,
//                                                             style: TextStyle(
//                                                                 overflow:
//                                                                 TextOverflow.ellipsis,
//                                                                 fontSize: 12.5,
//                                                                 fontWeight: FontWeight.w500,
//                                                                 color: Colors.yellow),
//                                                           )
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   )
//                                                   ),*/
//                                                     );
//                                               }),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               : Shimmer.fromColors(
//                                   baseColor: Colors.black,
//                                   highlightColor: Colors.red,
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(top: 20),
//                                     child: SizedBox(
//                                       height: 200,
//                                       child: ListView.builder(
//                                           itemCount:  controller.selectionList[index].extra!.length,
//                                           shrinkWrap: true,
//                                           scrollDirection: Axis.horizontal,
//                                           itemBuilder: (BuildContext, index) {
//                                             return GestureDetector(
//                                               onTap: () {
//                                                 if (index == 0) {
//                                                   Get.toNamed(
//                                                       Routes.LEAVES_SCREEN);
//                                                 } else if (index == 1) {
//                                                   Get.toNamed(
//                                                       Routes.NOTICE_BOARD);
//                                                 } else if (index == 2) {
//                                                   Get.toNamed(
//                                                       Routes.BUSROOT_SCREEN);
//                                                 } else if (index == 3) {
//                                                   Get.toNamed(Routes
//                                                       .SCHOOL_ROOLS_SCREEN);
//                                                 } else if (index == 4) {
//                                                   Get.toNamed(
//                                                       Routes.QUIRY_SCREEN);
//                                                 }
//                                               },
//                                               child: Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     left: 10,
//                                                     bottom: 05,
//                                                     right: 10),
//                                                 child: Card(
//                                                     elevation: 03,
//                                                     margin: EdgeInsets.zero,
//                                                     shape:
//                                                         RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         5)),
//                                                     child: Container(
//                                                       decoration: BoxDecoration(
//                                                           color: color.value,
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(5)),
//                                                       // height: 70,
//                                                       //width: 120,
//                                                       child: Container(
//                                                         width: 130,
//                                                         child: Column(
//                                                           mainAxisSize:
//                                                               MainAxisSize.min,
//                                                           crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .center,
//                                                           mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .center,
//                                                           children: [
//                                                             Expanded(
//                                                               flex: 2,
//                                                               child:
//                                                                   CircleAvatar(
//                                                                 backgroundColor:
//                                                                     Color(ColorValues
//                                                                         .RED),
//                                                                 child: Icon(
//                                                                   controller
//                                                                           .icons[
//                                                                       index],
//                                                                   color: Colors
//                                                                       .white,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Expanded(
//                                                               flex: 1,
//                                                               child:
//                                                                   GlobalLocalText(
//                                                                 text: controller
//                                                                         .title[
//                                                                     index],
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w400,
//                                                                 size: 15,
//                                                                 textAlign:
//                                                                     TextAlign
//                                                                         .center,
//                                                                 // wordSpacing: 1,
//                                                               ),
//                                                             )
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     )),
//                                               ),
//                                             );
//                                           }),
//                                     ),
//                                   )
//                           ),
//
//                         // Explore More
//                         if (controller.selectionList[index].id == 4)
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               if(controller.selectionList[2].id == 4)
//                                 SizedBox()
//                               else
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 10, top: 10),
//                                 child: GlobalLocalText(
//                                   text: controller.selectionList[index].title,
//                                   fontWeight: FontWeight.bold,
//                                   size: 16,
//                                 ),
//                               ),
//                               controller.isLoading_selectionList == false
//                                   ? Padding(
//                                       padding: const EdgeInsets.only(top: 10,bottom:10),
//                                       child: Container(
//                                         width: MediaQuery.of(context).size.width,
//                                         decoration: BoxDecoration(
//                                             color: isDark(context)
//                                                 ? Color(0xFF414040)
//                                                 : controller.selectionList[index].bgType == 0
//                                                 ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
//                                                 : Colors.transparent,
//
//                                             image: DecorationImage(
//                                                 image: NetworkImage(
//                                                   ApiService.IMAGE_URL +
//                                                       controller
//                                                           .selectionList[index].bgValue
//                                                           .toString(),
//                                                 ),
//                                                 fit: BoxFit.fill
//                                             )
//                                         ),
//                                         child: SizedBox(
//                                           height: 125,
//                                           child: ListView.builder(
//                                               itemCount: controller.selectionList[index].extra!.length,
//                                               shrinkWrap: true,
//                                               scrollDirection: Axis.horizontal,
//                                               itemBuilder: (BuildContext, idx2) {
//                                                 var expoler = controller.selectionList[index].extra![idx2];
//                                                 print(
//                                                     'controller.selectionList[index].extra![idx2]' +
//                                                         idx2.toString());
//
//                                                 return GestureDetector(
//                                                   onTap: () {
//                                                     if (idx2 == 0) {
//                                                       Get.toNamed(Routes.LEAVES_SCREEN);
//                                                     } else if (idx2 == 1) {
//                                                       Get.toNamed(Routes.NOTICE_BOARD);
//                                                     } else if (idx2 == 2) {
//                                                       Get.toNamed(Routes.BUSROOT_SCREEN);
//                                                     } else if (idx2 == 3) {
//                                                       Get.toNamed(Routes.SCHOOL_ROOLS_SCREEN);
//                                                     } else if (idx2 == 4) {
//                                                       Get.toNamed(Routes.QUIRY_SCREEN);
//                                                     }
//                                                   },
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             left: 10,
//                                                             top:5,
//                                                             bottom: 05,
//                                                             right: 10),
//                                                     child: Card(
//                                                         elevation: 03,
//                                                         margin: EdgeInsets.zero,
//                                                         // color: Colors.red,
//                                                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                                                         child: Container(
//                                                           decoration: BoxDecoration(
//                                                               color:controller.hexToColor(expoler.boxColor.toString()),
//                                                               borderRadius: BorderRadius.circular(5)),
//                                                           // height: 70,
//                                                           //width: 120,
//                                                           child: Container(
//                                                             width: 130,
//                                                             child: Column(
//                                                               mainAxisSize:
//                                                                   MainAxisSize
//                                                                       .min,
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .center,
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .center,
//                                                               children: [
//                                                                 Expanded(
//                                                                   flex: 2,
//                                                                   child: CircleAvatar(
//                                                                       backgroundColor: Color(ColorValues.RED),
//                                                                       child: Image.network(
//                                                                         ApiService.IMAGE_URL + expoler.icon.toString(),height: 25,color: Colors.white,
//                                                                       )),
//                                                                 ),
//                                                                 Expanded(
//                                                                   flex: 1,
//                                                                   child:
//                                                                       GlobalLocalText(
//                                                                     text: expoler
//                                                                         .title,
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w400,
//                                                                     size: 15,
//                                                                     textAlign:
//                                                                         TextAlign
//                                                                             .center,
//                                                                     textColor: controller.hexToColor(expoler
//                                                                         .titleColor
//                                                                         .toString()),
//                                                                     // wordSpacing: 1,
//                                                                   ),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         )),
//                                                   ),
//                                                 );
//                                               }),
//                                         ),
//                                       ),
//                                     )
//                                   : Shimmer.fromColors(
//                                       baseColor: Colors.black,
//                                       highlightColor: Colors.red,
//                                       child: Padding(
//                                         padding:
//                                             const EdgeInsets.only(top: 20),
//                                         child: SizedBox(
//                                           height: 125,
//                                           child: ListView.builder(
//                                               itemCount:
//                                                   controller.selectionList.length,
//                                               shrinkWrap: true,
//                                               scrollDirection:
//                                                   Axis.horizontal,
//                                               itemBuilder:
//                                                   (BuildContext, index) {
//                                                 return GestureDetector(
//                                                   onTap: () {
//                                                     // if (index == 0) {
//                                                     //   Get.toNamed(Routes
//                                                     //       .LEAVES_SCREEN);
//                                                     // } else if (index == 1) {
//                                                     //   Get.toNamed(Routes
//                                                     //       .NOTICE_BOARD);
//                                                     // } else if (index == 2) {
//                                                     //   Get.toNamed(Routes
//                                                     //       .BUSROOT_SCREEN);
//                                                     // } else if (index == 3) {
//                                                     //   Get.toNamed(Routes
//                                                     //       .SCHOOL_ROOLS_SCREEN);
//                                                     // } else if (index == 4) {
//                                                     //   Get.toNamed(Routes
//                                                     //       .QUIRY_SCREEN);
//                                                     // }
//                                                   },
//                                                   child: Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             left: 10,
//                                                             bottom: 05,
//                                                             right: 10),
//                                                     child: Card(
//                                                         elevation: 03,
//                                                         margin:
//                                                             EdgeInsets.zero,
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         5)),
//                                                         child: Container(
//                                                           decoration: BoxDecoration(
//                                                               color:
//                                                                   color.value,
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           5)),
//                                                           // height: 70,
//                                                           //width: 120,
//                                                           child: Container(
//                                                             width: 130,
//                                                             child: Column(
//                                                               mainAxisSize:
//                                                                   MainAxisSize
//                                                                       .min,
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .center,
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .center,
//                                                               children: [
//                                                                 Expanded(
//                                                                   flex: 2,
//                                                                   child:
//                                                                       CircleAvatar(
//                                                                     backgroundColor:
//                                                                         Color(
//                                                                             ColorValues.RED),
//                                                                     child:
//                                                                         Icon(
//                                                                       controller
//                                                                           .icons[index],
//                                                                       color: Colors
//                                                                           .white,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Expanded(
//                                                                   flex: 1,
//                                                                   child:
//                                                                       GlobalLocalText(
//                                                                     text: controller
//                                                                             .title[
//                                                                         index],
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .w400,
//                                                                     size: 15,
//                                                                     textAlign:
//                                                                         TextAlign
//                                                                             .center,
//                                                                     // wordSpacing: 1,
//                                                                   ),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         )),
//                                                   ),
//                                                 );
//                                               }),
//                                         ),
//                                       )),
//                             ],
//                           ),
//
//                         // knowledge base
//                         if (controller.selectionList[index].id == 5)
//                           Container(
//                               child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if(controller.selectionList[2].id == 5)
//                                       SizedBox()
//                                     else
//                                 Padding(
//                                   padding:
//                                       const EdgeInsets.only(left: 10, top: 10),
//                                   child: GlobalLocalText(
//                                     text: controller.selectionList[index].title,
//                                     fontWeight: FontWeight.bold,
//                                     size: 16,
//                                   ),
//                                 ),
//                                 if (controller.selectionList[index].id == 5)
//                                   controller.isLoading_selectionList == false
//                                       ? Padding(
//                                         padding: const EdgeInsets.only(top:10.0,bottom:10),
//                                         child: Container(
//                                     width: MediaQuery.of(context).size.width,
//                                     decoration: BoxDecoration(
//                                         color: isDark(context)
//                                             ? Color(0xFF414040)
//                                             : controller.selectionList[index].bgType == 0
//                                             ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
//                                             : Colors.transparent,
//                                           image: DecorationImage(
//                                               image: NetworkImage(
//                                                 ApiService.IMAGE_URL +
//                                                     controller
//                                                         .selectionList[index].bgValue
//                                                         .toString(),
//                                               ),
//                                               fit: BoxFit.fill)),
//                                           child: Container(
//                                               height: MediaQuery.of(context).size.height / 3.2,
//                                               child: ListView.builder(
//                                                   itemCount: controller.selectionList[index].extra!.length,
//                                                   scrollDirection: Axis.horizontal,
//                                                   shrinkWrap: true,
//                                                   itemBuilder: (BuildContext, idx3) {
//                                                     var knowledge =  controller.selectionList[index].extra![idx3];
//                                                     return Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               left: 15,
//                                                               right: 15,
//                                                               top: 5,
//                                                               bottom: 5),
//                                                       child: InkWell(
//                                                         onTap: () {
//                                                           var data = {
//                                                             'id':  knowledge.id.toString(),
//                                                           };
//                                                           print(
//                                                               '-------------${data}');
//
//                                                           Get.toNamed(
//                                                               Routes.ARTICAL1,
//                                                               parameters: data);
//                                                         },
//                                                         child: Container(
//                                                           height: MediaQuery.of(context).size.height / 3,
//                                                           width: MediaQuery.of(context).size.width / 1.3,
//                                                           decoration: BoxDecoration(
//                                                               image: DecorationImage(
//                                                                   image: NetworkImage(ApiService
//                                                                           .IMAGE_URL +
//                                                                       knowledge.image.toString()),
//                                                                   fit: BoxFit.fill),
//                                                               borderRadius: BorderRadius.circular(10),
//                                                               color: Colors.blue),
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 0,
//                                                                     bottom: 0),
//                                                             child: Container(
//                                                               // color: Colors.black38,
//                                                               child: Column(
//                                                                 mainAxisAlignment:
//                                                                     MainAxisAlignment
//                                                                         .end,
//                                                                 crossAxisAlignment:
//                                                                     CrossAxisAlignment
//                                                                         .start,
//                                                                 children: [
//                                                                   Padding(
//                                                                     padding:
//                                                                         const EdgeInsets
//                                                                                 .only(
//                                                                             left:
//                                                                                 18),
//                                                                     child:
//                                                                         GlobalLocalText(
//                                                                       maxLines: 2,
//                                                                       text:knowledge.title,
//                                                                       textColor:
//                                                                           Colors
//                                                                               .white,
//                                                                     ),
//                                                                   ),
//                                                                   SizedBox(
//                                                                     height: 8,
//                                                                   ),
//                                                                   Padding(
//                                                                     padding:
//                                                                         const EdgeInsets
//                                                                                 .only(
//                                                                             left:
//                                                                                 18,
//                                                                             bottom:
//                                                                                 10),
//                                                                     child:
//                                                                         ElevatedButton(
//                                                                             style: ElevatedButton
//                                                                                 .styleFrom(
//                                                                               backgroundColor: controller.hexToColor(knowledge.btnColor.toString()),),
//                                                                             onPressed:
//                                                                                 () {
//                                                                               var data =
//                                                                                   {
//                                                                                 'id':
//                                                                                 knowledge.id.toString()
//                                                                               };
//                                                                               print(
//                                                                                   '-------------${data}');
//
//                                                                               Get.toNamed(
//                                                                                   Routes.ARTICAL1,
//                                                                                   parameters: data);
//
//                                                                               /* if (index == 0) {
//                                                                   Get.toNamed(
//                                                                       Routes.ARTICAL1);
//                                                                 } else if (index == 1) {
//                                                                   Get.toNamed(
//                                                                       Routes.ARTICAL2);
//                                                                 } else if (index == 2) {
//                                                                   Get.toNamed(
//                                                                       Routes.ARTICAL3);
//                                                                 } else if (index == 3) {
//                                                                   Get.toNamed(
//                                                                       Routes.ARTICAL4);
//                                                                 } else if (index == 4) {
//                                                                   Get.toNamed(
//                                                                       Routes.ARTICAL5);
//                                                                 }*/
//                                                                             },
//                                                                             child:
//                                                                                 GlobalLocalText(
//                                                                               textColor: controller.hexToColor(knowledge.btnTextColor.toString()),
//                                                                               text:
//                                                                                   "Read More",
//                                                                             )),
//                                                                   )
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     );
//                                                   }),
//                                             ),
//                                         ),
//                                       )
//                                       : Shimmer.fromColors(
//                                           baseColor: Colors.black,
//                                           highlightColor: Colors.red,
//                                           child: SizedBox(
//                                             height: MediaQuery.of(context)
//                                                     .size
//                                                     .height /
//                                                 3,
//                                             child: ListView.builder(
//                                                 itemCount: controller
//                                                     .KnowledgeBaseList.length,
//                                                 scrollDirection:
//                                                     Axis.horizontal,
//                                                 shrinkWrap: true,
//                                                 itemBuilder:
//                                                     (BuildContext, index) {
//                                                   return Padding(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                             left: 15,
//                                                             right: 15,
//                                                             top: 20,
//                                                             bottom: 20),
//                                                     child: InkWell(
//                                                       onTap: () {
//                                                         var data = {
//                                                           'id': controller
//                                                               .KnowledgeBaseList[
//                                                                   index]
//                                                               .id
//                                                               .toString(),
//                                                         };
//                                                         print(
//                                                             '-------------${data}');
//
//                                                         Get.toNamed(
//                                                             Routes.ARTICAL1,
//                                                             parameters: data);
//                                                       },
//                                                       child: Container(
//                                                         height: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .height /
//                                                             3,
//                                                         width: MediaQuery.of(
//                                                                     context)
//                                                                 .size
//                                                                 .width /
//                                                             1.3,
//                                                         decoration: BoxDecoration(
//                                                             image: DecorationImage(
//                                                                 image: NetworkImage(ApiService
//                                                                         .IMAGE_URL +
//                                                                     controller
//                                                                         .KnowledgeBaseList[
//                                                                             index]
//                                                                         .image!),
//                                                                 fit: BoxFit
//                                                                     .cover),
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         5),
//                                                             color: Colors.blue),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                       .only(
//                                                                   left: 0,
//                                                                   bottom: 0),
//                                                           child: Container(
//                                                             color:
//                                                                 Colors.black38,
//                                                             child: Column(
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment
//                                                                       .end,
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Padding(
//                                                                   padding: const EdgeInsets
//                                                                           .only(
//                                                                       left: 18),
//                                                                   child:
//                                                                       GlobalLocalText(
//                                                                     maxLines: 2,
//                                                                     text: controller
//                                                                         .KnowledgeBaseList[
//                                                                             index]
//                                                                         .title,
//                                                                     textColor:
//                                                                         Colors
//                                                                             .white,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 8,
//                                                                 ),
//                                                                 Padding(
//                                                                   padding: const EdgeInsets
//                                                                           .only(
//                                                                       left: 18,
//                                                                       bottom:
//                                                                           10),
//                                                                   child: ElevatedButton(
//                                                                       style: ElevatedButton.styleFrom(
//                                                                         backgroundColor:
//                                                                             Color(ColorValues.RED),
//                                                                       ),
//                                                                       onPressed: () {
//                                                                         var data =
//                                                                             {
//                                                                           'id': controller
//                                                                               .KnowledgeBaseList[index]
//                                                                               .id
//                                                                               .toString(),
//                                                                         };
//                                                                         print(
//                                                                             '-------------${data}');
//
//                                                                         Get.toNamed(
//                                                                             Routes
//                                                                                 .ARTICAL1,
//                                                                             parameters:
//                                                                                 data);
//
//                                                                         /* if (index == 0) {
//                                                               Get.toNamed(
//                                                                   Routes.ARTICAL1);
//                                                             } else if (index == 1) {
//                                                               Get.toNamed(
//                                                                   Routes.ARTICAL2);
//                                                             } else if (index == 2) {
//                                                               Get.toNamed(
//                                                                   Routes.ARTICAL3);
//                                                             } else if (index == 3) {
//                                                               Get.toNamed(
//                                                                   Routes.ARTICAL4);
//                                                             } else if (index == 4) {
//                                                               Get.toNamed(
//                                                                   Routes.ARTICAL5);
//                                                             }*/
//                                                                       },
//                                                                       child: GlobalLocalText(
//                                                                         textColor:
//                                                                             Colors.white,
//                                                                         text:
//                                                                             "Read More",
//                                                                       )),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   );
//                                                 }),
//                                           ),
//                                         ),
//                               ])),
//
//                         // main menu
//                         if (controller.selectionList[index].id == 6)
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                               color: isDark(context)
//                                   ? Color(0xFF414040)
//                                   : controller.selectionList[index].bgType == 0
//                                   ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
//                                   : Colors.transparent,
//                               image: DecorationImage(
//                                   image: NetworkImage(
//                                     ApiService.IMAGE_URL +
//                                         controller
//                                             .selectionList[index].bgValue
//                                             .toString(),
//                                   ),
//                                   fit: BoxFit.fill)),
//                           padding :EdgeInsets.only(top:20,bottom:0),
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                               itemCount: controller.selectionList[index].extra!.length,
//                               physics: NeverScrollableScrollPhysics(),
//                               itemBuilder: (BuildContext,idx4){
//                               var menu = controller.selectionList[index].extra![idx4];
//                                 return Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                           horizontal: 15),
//                                       child: InkWell(
//                                         onTap: () {
//                                           if (idx4 == 0) {
//                                             Get.toNamed(Routes.UPCOMING_EVENT);
//                                           } else if (idx4 == 1) {
//                                             Get.toNamed(Routes.ASSIGNMENT);
//                                           } else if (idx4 == 2) {
//                                             Get.toNamed(Routes.SYLLABUS);
//                                           } else if (idx4 == 3) {
//                                             Get.toNamed("/accedmic-content");
//                                           }
//                                         },
//                                         child: Row(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Flexible(
//                                               child: Row(
//                                                 children: [
//                                                   CircleAvatar(
//                                                       backgroundColor:
//                                                       Color(ColorValues.RED),
//                                                       child: Image.network(ApiService.IMAGE_URL + menu.icon.toString(),
//                                                         height:25,
//                                                           color:Colors.white,
//                                                       )
//                                                   ),
//                                                   SizedBox(
//                                                     width: 10,
//                                                   ),
//                                                   Flexible(
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                       children: [
//                                                         GlobalLocalText(
//                                                           text: menu.title.toString().toUpperCase(), size: 17,
//                                                           fontWeight: FontWeight.w500,
//                                                           textColor:  controller.hexToColor(menu.titleColor.toString()),
//
//                                                         ),
//                                                         SizedBox(
//                                                           height: 3,
//                                                         ),
//                                                         GlobalLocalText(
//                                                           text:
//                                                           menu.subTitle.toString(),
//                                                           size: 13.5,
//                                                           textColor: controller.hexToColor(menu.subTitleColor.toString()),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ),
//                                             Card(
//                                                 color: controller.hexToColor(menu.btnColor.toString()),
//                                                 margin: EdgeInsets.zero,
//                                                 child: Padding(
//                                                   padding:
//                                                   const EdgeInsets.all(8.0),
//                                                   child: Icon(
//                                                     Icons.arrow_forward_ios,
//                                                     color: controller.hexToColor(menu.iconColor.toString()),
//                                                     size: 18,
//                                                   ),
//                                                 ))
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       height: 8,
//                                     ),
//                                     if(idx4==controller.selectionList[index].extra!.length-1)
//                                 SizedBox()
//                                     else
//                                  Divider() ,
//                                     SizedBox(
//                                       height: 8,
//                                     ),
//
//                                   ],
//                                 );
//                               }
//                           ),
//                         ),
//
//                         // Latest Events
//                         if (controller.selectionList[index].id == 7)
//                           Container(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 if(controller.selectionList[2].id == 7)
//                                   SizedBox()
//                                 else
//                                 Padding(
//                                   padding: const EdgeInsets.only(
//                                       left: 10, top: 10),
//                                   child: GlobalLocalText(
//                                     text: controller.selectionList[index].title.toString(),
//                                     fontWeight: FontWeight.bold,
//                                     size: 16,
//                                   ),
//                                 ),
//                                 controller.isLoading_selectionList == false
//                                     ? Padding(
//                                         padding: const EdgeInsets.only(top: 10,bottom:10),
//                                         child: Container(
//                                           height: 200,
//                                           width: double.infinity,
//                                           decoration: BoxDecoration(
//                                               color: isDark(context)
//                                                   ? Color(0xFF414040)
//                                                   : controller.selectionList[index].bgType == 0
//                                                   ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
//                                                   : Colors.transparent,
//                                               image: DecorationImage(
//                                                   image: NetworkImage(
//                                                     ApiService.IMAGE_URL +
//                                                         controller
//                                                             .selectionList[index].bgValue
//                                                             .toString(),
//                                                   ),
//                                                   fit: BoxFit.fill)),
//                                           child: ListView.builder(
//                                               itemCount: controller.selectionList[index].extra!.length,
//                                               shrinkWrap: true,
//                                               scrollDirection: Axis.horizontal,
//                                               itemBuilder:
//                                                   (BuildContext, idx5) {
//                                                 var evets = controller.selectionList[index].extra![idx5];
//                                                 return InkWell(
//                                                     onTap: () {
//                                                       var data = {
//                                                         'id': evets.id
//                                                             .toString(),
//                                                       };
//                                                       Get.toNamed(Routes.EVENTS,
//                                                           parameters: data);
//                                                     },
//                                                     child: Padding(
//                                                         padding:
//                                                         const EdgeInsets.only(
//                                                             left: 15,
//                                                             right: 15,
//                                                             top: 5,
//                                                             bottom: 5),
//                                                         child: Stack(
//                                                           clipBehavior:
//                                                               Clip.hardEdge,
//                                                           children: [
//                                                             Container(
//                                                               clipBehavior:
//                                                                   Clip.hardEdge,
//                                                               decoration:
//                                                                   BoxDecoration(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             10),
//                                                               ),
//                                                               height: 240,
//                                                               width: 220,
//                                                               child: Image.network(
//                                                                   ApiService
//                                                                           .IMAGE_URL +
//                                                                       evets.image!,
//                                                                   fit: BoxFit
//                                                                       .cover),
//                                                             ),
//                                                             Padding(
//                                                               padding:
//                                                                   const EdgeInsets
//                                                                           .only(
//                                                                       top:
//                                                                           145.0),
//                                                               child: Container(
//                                                                 height: 80,
//                                                                 width: 220,
//                                                                 decoration:
//                                                                     BoxDecoration(
//                                                                   color: Colors
//                                                                       .black54,
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .only(
//                                                                     topLeft:
//                                                                         Radius
//                                                                             .zero,
//                                                                     topRight:
//                                                                         Radius
//                                                                             .zero,
//                                                                     bottomLeft:
//                                                                         Radius.circular(
//                                                                             10.0),
//                                                                     bottomRight:
//                                                                         Radius.circular(
//                                                                             10.0),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Positioned(
//                                                               top: 127,
//                                                               left: 10,
//                                                               child: Container(
//                                                                 //margin: EdgeInsets.only(top: 140,left: 10),
//                                                                 height: 60,
//                                                                 width: 200,
//                                                                 child: Column(
//                                                                   crossAxisAlignment:
//                                                                       CrossAxisAlignment
//                                                                           .start,
//                                                                   mainAxisAlignment:
//                                                                       MainAxisAlignment
//                                                                           .end,
//                                                                   children: [
//                                                                     Text(
//                                                                       evets.year.toString(),
//                                                                       style: TextStyle(
//                                                                           fontFamily:
//                                                                               "Roboto",
//                                                                           overflow: TextOverflow
//                                                                               .ellipsis,
//                                                                           fontWeight: FontWeight
//                                                                               .w600,
//                                                                           fontSize:
//                                                                               13.5,
//                                                                           color:
//                                                                               Colors.white),
//                                                                     ),
//
//                                                                     /* Text(
//                                                             textAlign: TextAlign.justify,
//                                                             maxLines: 2,
//                                                             controller.Event_list[index].title!,
//                                                             style: TextStyle(
//                                                                 overflow:
//                                                                 TextOverflow.ellipsis,
//                                                                 fontSize: 12.5,
//                                                                 fontWeight: FontWeight.w500,
//                                                                 color: Colors.yellow),
//                                                           ),*/
//
//                                                                     Padding(
//                                                                       padding: const EdgeInsets
//                                                                               .symmetric(
//                                                                           vertical:
//                                                                               2),
//                                                                       child:
//                                                                           Row(
//                                                                         children: [
//                                                                           Expanded(
//                                                                             flex:
//                                                                                 9,
//                                                                             child:
//                                                                                 GlobalLocalText(
//                                                                               maxLines: 1,
//                                                                               text: "${  evets.title.toString()}",
//                                                                               size: 16,
//                                                                               textColor: Colors.white,
//                                                                               fontWeight: FontWeight.bold,
//                                                                             ),
//                                                                           ),
//                                                                           Expanded(
//                                                                             flex:
//                                                                                 1,
//                                                                             child:
//                                                                                 Icon(
//                                                                               Icons.arrow_forward_ios,
//                                                                               color: ColorValues.kRedColor,
//                                                                               size: 20,
//                                                                             ),
//                                                                           )
//                                                                         ],
//                                                                       ),
//                                                                     )
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             )
//                                                           ],
//                                                         ))
//
//                                                     /* Padding(
//                                             padding: const EdgeInsets.only(left: 10, right: 10),
//                                             child: Card(
//                                                 clipBehavior: Clip.hardEdge,
//                                                 margin: EdgeInsets.zero,
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                     BorderRadius.circular(5)),
//                                                 child: Container(
//                                                   decoration: BoxDecoration(
//                                                       image: DecorationImage(
//                                                           image: NetworkImage(
//                                                               '${ApiService.IMAGE_URL+controller.Event_list[index].image!}'),
//                                                           fit: BoxFit.cover),
//                                                       color: Colors.white,
//                                                       borderRadius:
//                                                       BorderRadius.circular(10)),
//                                                   child: Padding(
//                                                     padding: EdgeInsets.all(8.0),
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                       mainAxisAlignment:
//                                                       MainAxisAlignment.end,
//                                                       children: [
//                                                         GlobalLocalText(
//                                                             text:
//                                                             "${controller.Event_list[index].date}",
//                                                             textColor: Colors.white,
//                                                             fontWeight:
//                                                             FontWeight.w400),
//                                                         SizedBox(
//                                                           height: 5,
//                                                         ),
//                                                         Row(
//                                                           children: [
//                                                             Expanded(
//                                                               flex: 9,
//                                                               child: GlobalLocalText(
//                                                                 maxLines: 1,
//                                                                 text:
//                                                                 "${controller.Event_list[index].title}",
//                                                                 size: 16,
//                                                                 textColor: Colors.white,
//                                                                 fontWeight:
//                                                                 FontWeight.bold,
//                                                               ),
//                                                             ),
//                                                             Expanded(
//                                                               flex: 1,
//                                                               child: Icon(
//                                                                 Icons.arrow_forward_ios,
//                                                                 color:
//                                                                 ColorValues.kRedColor,
//                                                                 size: 18,
//                                                               ),
//                                                             )
//                                                           ],
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   //height: 70,
//                                                   width: 200,
//                                                 )),
//                                           ),*/
//                                                     );
//                                               }),
//                                         ),
//                                       )
//                                     : Shimmer.fromColors(
//                                         baseColor: Colors.black,
//                                         highlightColor: Colors.red,
//                                         child: Padding(
//                                           padding:
//                                               const EdgeInsets.only(top: 05),
//                                           child: Container(
//                                             height: 200,
//                                             width: double.infinity,
//                                             child: ListView.builder(
//                                                 itemCount: controller
//                                                     .Event_list.length,
//                                                 shrinkWrap: true,
//                                                 scrollDirection:
//                                                     Axis.horizontal,
//                                                 itemBuilder:
//                                                     (BuildContext, index) {
//                                                   return InkWell(
//                                                       onTap: () {
//                                                         var data = {
//                                                           'id': controller
//                                                               .Event_list[index]
//                                                               .id
//                                                               .toString(),
//                                                         };
//                                                         Get.toNamed(
//                                                             Routes.EVENTS,
//                                                             parameters: data);
//                                                       },
//                                                       child: Padding(
//                                                           padding:
//                                                               EdgeInsets.only(
//                                                                   left: 10,
//                                                                   right: 10),
//                                                           child: Stack(
//                                                             clipBehavior:
//                                                                 Clip.hardEdge,
//                                                             children: [
//                                                               Container(
//                                                                 clipBehavior:
//                                                                     Clip.hardEdge,
//                                                                 decoration:
//                                                                     BoxDecoration(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               10),
//                                                                 ),
//                                                                 height: 240,
//                                                                 width: 220,
//                                                                 child: Image.network(
//                                                                     ApiService
//                                                                             .IMAGE_URL +
//                                                                         controller
//                                                                             .Event_list[
//                                                                                 index]
//                                                                             .image!,
//                                                                     fit: BoxFit
//                                                                         .cover),
//                                                               ),
//                                                               Padding(
//                                                                 padding: const EdgeInsets
//                                                                         .only(
//                                                                     top: 160.0),
//                                                                 child:
//                                                                     Container(
//                                                                   height: 80,
//                                                                   width: 220,
//                                                                   decoration:
//                                                                       BoxDecoration(
//                                                                     color: Colors
//                                                                         .black54,
//                                                                     borderRadius:
//                                                                         BorderRadius
//                                                                             .only(
//                                                                       topLeft:
//                                                                           Radius
//                                                                               .zero,
//                                                                       topRight:
//                                                                           Radius
//                                                                               .zero,
//                                                                       bottomLeft:
//                                                                           Radius.circular(
//                                                                               10.0),
//                                                                       bottomRight:
//                                                                           Radius.circular(
//                                                                               10.0),
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               Positioned(
//                                                                 top: 140,
//                                                                 left: 10,
//                                                                 child:
//                                                                     Container(
//                                                                   //margin: EdgeInsets.only(top: 140,left: 10),
//                                                                   height: 60,
//                                                                   width: 200,
//                                                                   child: Column(
//                                                                     crossAxisAlignment:
//                                                                         CrossAxisAlignment
//                                                                             .start,
//                                                                     mainAxisAlignment:
//                                                                         MainAxisAlignment
//                                                                             .end,
//                                                                     children: [
//                                                                       Text(
//                                                                         controller
//                                                                             .Event_list[index]
//                                                                             .date!,
//                                                                         style: TextStyle(
//                                                                             fontFamily:
//                                                                                 "Roboto",
//                                                                             overflow: TextOverflow
//                                                                                 .ellipsis,
//                                                                             fontWeight: FontWeight
//                                                                                 .w600,
//                                                                             fontSize:
//                                                                                 13.5,
//                                                                             color:
//                                                                                 Colors.white),
//                                                                       ),
//
//                                                                       /* Text(
//                                                             textAlign: TextAlign.justify,
//                                                             maxLines: 2,
//                                                             controller.Event_list[index].title!,
//                                                             style: TextStyle(
//                                                                 overflow:
//                                                                 TextOverflow.ellipsis,
//                                                                 fontSize: 12.5,
//                                                                 fontWeight: FontWeight.w500,
//                                                                 color: Colors.yellow),
//                                                           ),*/
//
//                                                                       Padding(
//                                                                         padding:
//                                                                             const EdgeInsets.symmetric(vertical: 2),
//                                                                         child:
//                                                                             Row(
//                                                                           children: [
//                                                                             Expanded(
//                                                                               flex: 9,
//                                                                               child: GlobalLocalText(
//                                                                                 maxLines: 1,
//                                                                                 text: "${controller.Event_list[index].title}",
//                                                                                 size: 16,
//                                                                                 textColor: Colors.white,
//                                                                                 fontWeight: FontWeight.bold,
//                                                                               ),
//                                                                             ),
//                                                                             Expanded(
//                                                                               flex: 1,
//                                                                               child: Icon(
//                                                                                 Icons.arrow_forward_ios,
//                                                                                 color: ColorValues.kRedColor,
//                                                                                 size: 20,
//                                                                               ),
//                                                                             )
//                                                                           ],
//                                                                         ),
//                                                                       )
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               )
//                                                             ],
//                                                           ))
//
//                                                       /* Padding(
//                                             padding: const EdgeInsets.only(left: 10, right: 10),
//                                             child: Card(
//                                                 clipBehavior: Clip.hardEdge,
//                                                 margin: EdgeInsets.zero,
//                                                 shape: RoundedRectangleBorder(
//                                                     borderRadius:
//                                                     BorderRadius.circular(5)),
//                                                 child: Container(
//                                                   decoration: BoxDecoration(
//                                                       image: DecorationImage(
//                                                           image: NetworkImage(
//                                                               '${ApiService.IMAGE_URL+controller.Event_list[index].image!}'),
//                                                           fit: BoxFit.cover),
//                                                       color: Colors.white,
//                                                       borderRadius:
//                                                       BorderRadius.circular(10)),
//                                                   child: Padding(
//                                                     padding: EdgeInsets.all(8.0),
//                                                     child: Column(
//                                                       crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                       mainAxisAlignment:
//                                                       MainAxisAlignment.end,
//                                                       children: [
//                                                         GlobalLocalText(
//                                                             text:
//                                                             "${controller.Event_list[index].date}",
//                                                             textColor: Colors.white,
//                                                             fontWeight:
//                                                             FontWeight.w400),
//                                                         SizedBox(
//                                                           height: 5,
//                                                         ),
//                                                         Row(
//                                                           children: [
//                                                             Expanded(
//                                                               flex: 9,
//                                                               child: GlobalLocalText(
//                                                                 maxLines: 1,
//                                                                 text:
//                                                                 "${controller.Event_list[index].title}",
//                                                                 size: 16,
//                                                                 textColor: Colors.white,
//                                                                 fontWeight:
//                                                                 FontWeight.bold,
//                                                               ),
//                                                             ),
//                                                             Expanded(
//                                                               flex: 1,
//                                                               child: Icon(
//                                                                 Icons.arrow_forward_ios,
//                                                                 color:
//                                                                 ColorValues.kRedColor,
//                                                                 size: 18,
//                                                               ),
//                                                             )
//                                                           ],
//                                                         )
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   //height: 70,
//                                                   width: 200,
//                                                 )),
//                                           ),*/
//                                                       );
//                                                 }),
//                                           ),
//                                         )),
//                               ],
//                             ),
//                           ),
//
//                         // Advertisement
//                         if (controller.selectionList[index].id == 8)
//                           Padding(
//                             padding:
//                                 const EdgeInsets.only(left: 5.0, right: 5.0,bottom: 10),
//                             child: Card(
//                               elevation: 5,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     color: isDark(context)
//                                         ? Color(0xFF414040)
//                                         : controller.selectionList[index].bgType == 0
//                                         ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
//                                         : Colors.transparent,
//                                     image: DecorationImage(
//                                         image: NetworkImage(
//                                           ApiService.IMAGE_URL +
//                                               controller
//                                                   .selectionList[index].bgValue
//                                                   .toString(),
//                                         ),
//                                         fit: BoxFit.fill)),
//                                 height: 80,
//                                 width: double.infinity,
//                                 child: Image.network(
//                                   ApiService.IMAGE_URL + controller.adv_image.value,
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//
//                         // Photo Slider
//                         if (controller.selectionList[index].id == 9)
//                           Container(
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   if(controller.selectionList[2].id == 9)
//                                     SizedBox()
//                                   else
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 10, top: 10),
//                                     child: Column(
//                                       children: [
//                                         Center(
//                                           child: GlobalLocalText(
//                                             textAlign: TextAlign.center,
//                                             text: controller.selectionList[index].title,
//                                             fontWeight: FontWeight.bold,
//                                             size: 20,
//                                             textColor: controller.hexToColor(controller.selectionList[index].titleColor.toString()),
//                                           ),
//                                         ),
//                                         Center(
//                                           child: GlobalLocalText(
//                                             textAlign: TextAlign.center,
//                                             text:controller.selectionList[index].subTitle,
//                                             fontWeight: FontWeight.bold,
//                                             size: 20,
//                                             textColor:controller.hexToColor(controller.selectionList[index].subTitleColor.toString()),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.only(top: 10,bottom:10),
//                                     child: Container(
//                                       decoration: BoxDecoration(
//                                           color: isDark(context)
//                                               ? Color(0xFF414040)
//                                               : controller.selectionList[index].bgType == 0
//                                               ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
//                                               : Colors.transparent,
//                                           image: DecorationImage(
//                                               image: NetworkImage(
//                                                 ApiService.IMAGE_URL +
//                                                     controller
//                                                         .selectionList[index].bgValue
//                                                         .toString(),
//                                               ),
//                                               fit: BoxFit.fill)),
//                                       child: SizedBox(
//                                         height: 400,
//                                         child: ListView.builder(
//                                             scrollDirection: Axis.horizontal,
//                                             shrinkWrap: true,
//                                             itemCount:
//                                                 controller.slider_image.length,
//                                             itemBuilder: (BuildContext, index) {
//                                               return Padding(
//                                                 padding: const EdgeInsets.only(
//                                                     top:5,left: 5, right: 5, bottom: 5),
//                                                 child: ClipRRect(
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   child: Image.asset(
//                                                     controller.slider_image[index],
//                                                     fit: BoxFit.fill,
//                                                   ),
//                                                 ),
//                                               );
//                                             }),
//                                       ),
//                                     ),
//                                   ),
//                                 ]),
//                           ),
//
//                         // Announcement
//                         if (controller.selectionList[index].id == 10)
//                           Container(
//                             child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   if(controller.selectionList[2].id == 10)
//                                     SizedBox()
//                                   else
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 10, top: 10),
//                                     child: GlobalLocalText(
//                                       text: controller.selectionList[index].title,
//                                       fontWeight: FontWeight.bold,
//                                       size: 16,
//                                     ),
//                                   ),
//                                   controller.isLoading_Announcement == false
//                                       ? Padding(
//                                           padding: EdgeInsets.only(top: 10.0,bottom:10),
//                                           child: Container(
//                                               width: double.infinity,
//                                             decoration: BoxDecoration(
//                                                 color: isDark(context)
//                                                     ? Color(0xFF414040)
//                                                     : controller.selectionList[index].bgType == 0
//                                                     ? controller.hexToColor(controller.selectionList[index].bgValue.toString())
//                                                     : Colors.transparent,
//                                                 image: DecorationImage(
//                                                     image: NetworkImage(
//                                                       ApiService.IMAGE_URL +
//                                                           controller
//                                                               .selectionList[index].bgValue
//                                                               .toString(),
//                                                     ),
//                                                     fit: BoxFit.fill)),
//                                             child: SizedBox(
//                                               height: 160,
//                                               child: ListView.builder(
//                                                   scrollDirection:
//                                                       Axis.horizontal,
//                                                   shrinkWrap: true,
//                                                   itemCount: controller
//                                                       .Announcement_list.length,
//                                                   itemBuilder:
//                                                       (BuildContext, index) {
//                                                     return Padding(
//                                                       padding:
//                                                           const EdgeInsets.only(
//                                                               left: 10,
//                                                               right: 10,
//                                                               bottom: 5,
//                                                               top: 5),
//                                                       child: Card(
//                                                         shape: RoundedRectangleBorder(
//                                                                 borderRadius:
//                                                                     BorderRadius
//                                                                         .circular(
//                                                                             8)),
//                                                         margin: EdgeInsets.zero,
//                                                         elevation: 3,
//                                                         child: Container(
//                                                           decoration: BoxDecoration(
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(
//                                                                           8)),
//                                                           width: 300,
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .only(
//                                                                     left: 10,
//                                                                     right: 10,
//                                                                     top: 20,
//                                                                     bottom: 10),
//                                                             child: Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: [
//                                                                 Text_widget(
//                                                                     Simpletext: controller
//                                                                         .Announcement_list[
//                                                                             index]
//                                                                         .title,
//                                                                     fontSize:
//                                                                         14.5,
//                                                                     color: Color(
//                                                                         ColorValues
//                                                                             .RED),
//                                                                     fontWeight:
//                                                                         FontWeight
//                                                                             .bold),
//                                                                 SizedBox(
//                                                                   height: 8,
//                                                                 ),
//                                                                 Flexible(
//                                                                   child:
//                                                                       Text_widget(
//                                                                     maxLines: 4,
//                                                                     Simpletext:
//                                                                         '${controller.Announcement_list[index].content.toString().replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ')}',
//                                                                     fontSize:
//                                                                         14.0,
//                                                                   ),
//                                                                 ),
//                                                                 SizedBox(
//                                                                   height: 3,
//                                                                 ),
//                                                                 Align(
//                                                                     alignment:
//                                                                         Alignment
//                                                                             .centerRight,
//                                                                     child:
//                                                                         InkWell(
//                                                                       onTap: () {
//                                                                         showModalBottomSheet(
//                                                                             shape:
//                                                                                 RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
//                                                                             backgroundColor: Colors.white,
//                                                                             context: context,
//                                                                             builder: (context) {
//                                                                               return Padding(
//                                                                                 padding: const EdgeInsets.only(left: 20, right: 8, bottom: 20),
//                                                                                 child: SingleChildScrollView(
//                                                                                   child: Column(
//                                                                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                                                                     mainAxisSize: MainAxisSize.min,
//                                                                                     children: [
//                                                                                       Align(
//                                                                                         alignment: Alignment.topRight,
//                                                                                         child: IconButton(
//                                                                                             onPressed: () {
//                                                                                               Get.back();
//                                                                                             },
//                                                                                             icon: Icon(Icons.cancel_outlined)),
//                                                                                       ),
//                                                                                       Text_widget(Simpletext: controller.Announcement_list[index].title, fontSize: 16.0, color: Color(ColorValues.RED)),
//                                                                                       SizedBox(
//                                                                                         height: 8,
//                                                                                       ),
//                                                                                       Text_widget(maxLines: 10, Simpletext: '${controller.Announcement_list[index].content.toString().replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ')}', fontSize: 16.0, color: Color(ColorValues.DIVIDER_COL)),
//                                                                                     ],
//                                                                                   ),
//                                                                                 ),
//                                                                               );
//                                                                             });
//                                                                       },
//                                                                       child: Row(
//                                                                         children: [
//                                                                           Text(
//                                                                             'Read More',
//                                                                             style: TextStyle(
//                                                                                 overflow: TextOverflow.ellipsis,
//                                                                                 color: Colors.red,
//                                                                                 decoration: TextDecoration.underline),
//                                                                           ),
//                                                                         ],
//                                                                       ),
//                                                                     ))
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     );
//                                                   }),
//                                             ),
//                                           ),
//                                         )
//                                       : Shimmer.fromColors(
//                                       baseColor: Colors.black,
//                                       highlightColor: Colors.red,
//                                       child: Padding(
//                                         padding:
//                                         const EdgeInsets.only(top: 20),
//                                         child: SizedBox(
//                                           height: 125,
//                                           child: ListView.builder(
//                                               itemCount: controller.Announcement_list.length,
//                                               shrinkWrap: true,
//                                               scrollDirection:
//                                               Axis.horizontal,
//                                               itemBuilder:
//                                                   (BuildContext, index) {
//                                                 return GestureDetector(
//                                                   onTap: () {
//                                                     // if (index == 0) {
//                                                     //   Get.toNamed(Routes
//                                                     //       .LEAVES_SCREEN);
//                                                     // } else if (index == 1) {
//                                                     //   Get.toNamed(Routes
//                                                     //       .NOTICE_BOARD);
//                                                     // } else if (index == 2) {
//                                                     //   Get.toNamed(Routes
//                                                     //       .BUSROOT_SCREEN);
//                                                     // } else if (index == 3) {
//                                                     //   Get.toNamed(Routes
//                                                     //       .SCHOOL_ROOLS_SCREEN);
//                                                     // } else if (index == 4) {
//                                                     //   Get.toNamed(Routes
//                                                     //       .QUIRY_SCREEN);
//                                                     // }
//                                                   },
//                                                   child: Padding(
//                                                     padding:
//                                                     const EdgeInsets.only(
//                                                         left: 10,
//                                                         bottom: 05,
//                                                         right: 10),
//                                                     child: Card(
//                                                         elevation: 03,
//                                                         margin:
//                                                         EdgeInsets.zero,
//                                                         shape: RoundedRectangleBorder(
//                                                             borderRadius:
//                                                             BorderRadius
//                                                                 .circular(
//                                                                 5)),
//                                                         child: Container(
//                                                           decoration: BoxDecoration(
//                                                               color:
//                                                               color.value,
//                                                               borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                   5)),
//                                                           // height: 70,
//                                                           //width: 120,
//                                                           child: Container(
//                                                             width: 160,
//                                                             child: Column(
//                                                               mainAxisSize:
//                                                               MainAxisSize
//                                                                   .min,
//                                                               crossAxisAlignment:
//                                                               CrossAxisAlignment
//                                                                   .center,
//                                                               mainAxisAlignment:
//                                                               MainAxisAlignment
//                                                                   .center,
//                                                               children: [
//                                                                 Expanded(
//                                                                   flex: 2,
//                                                                   child:
//                                                                   CircleAvatar(
//                                                                     backgroundColor:
//                                                                     Color(
//                                                                         ColorValues.RED),
//                                                                     child:
//                                                                     Icon(
//                                                                       controller
//                                                                           .icons[index],
//                                                                       color: Colors
//                                                                           .white,
//                                                                     ),
//                                                                   ),
//                                                                 ),
//                                                                 Expanded(
//                                                                   flex: 1,
//                                                                   child:
//                                                                   GlobalLocalText(
//                                                                     text: controller
//                                                                         .title[
//                                                                     index],
//                                                                     fontWeight:
//                                                                     FontWeight
//                                                                         .w400,
//                                                                     size: 15,
//                                                                     textAlign:
//                                                                     TextAlign
//                                                                         .center,
//                                                                     // wordSpacing: 1,
//                                                                   ),
//                                                                 )
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         )),
//                                                   ),
//                                                 );
//                                               }),
//                                         ),
//                                       )),
//                                 ]),
//                           ),
//
//                        /*// main menu
//                         if (controller.selectionList[index].id == 6)
//                           Container(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 15),
//                                   child: InkWell(
//                                     onTap: () {
//                                       Get.toNamed(Routes.UPCOMING_EVENT);
//                                     },
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Flexible(
//                                           child: Row(
//                                             children: [
//                                               CircleAvatar(
//                                                   backgroundColor:
//                                                       Color(ColorValues.RED),
//                                                   child: Icon(
//                                                     Icons.update_rounded,
//                                                     color: Colors.white,
//                                                   )),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Flexible(
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     GlobalLocalText(
//                                                       text: "Upcoming Events"
//                                                           .toUpperCase(),
//                                                       size: 17,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     ),
//                                                     SizedBox(
//                                                       height: 3,
//                                                     ),
//                                                     GlobalLocalText(
//                                                       text:
//                                                           "Check your daily events here",
//                                                       size: 13.5,
//                                                       textColor: Colors.grey,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Card(
//                                             color: Colors.white60,
//                                             margin: EdgeInsets.zero,
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Icon(
//                                                 Icons.arrow_forward_ios,
//                                                 color: ColorValues.kRedColor,
//                                                 size: 18,
//                                               ),
//                                             ))
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 Divider(),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 15),
//                                   child: InkWell(
//                                     onTap: () {
//                                       Get.toNamed(Routes.ASSIGNMENT);
//                                     },
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Flexible(
//                                           child: Row(
//                                             children: [
//                                               CircleAvatar(
//                                                   backgroundColor:
//                                                       Color(ColorValues.RED),
//                                                   child: Icon(
//                                                     Icons.assessment,
//                                                     color: Colors.white,
//                                                   )),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Flexible(
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     GlobalLocalText(
//                                                       text: "Assignments"
//                                                           .toUpperCase(),
//                                                       size: 17,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     ),
//                                                     SizedBox(
//                                                       height: 3,
//                                                     ),
//                                                     GlobalLocalText(
//                                                       text:
//                                                           "Check your daily assignmets here",
//                                                       size: 13.5,
//                                                       textColor: Colors.grey,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Card(
//                                             color: Colors.white60,
//                                             margin: EdgeInsets.zero,
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Icon(
//                                                 Icons.arrow_forward_ios,
//                                                 color: ColorValues.kRedColor,
//                                                 size: 18,
//                                               ),
//                                             ))
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 Divider(),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 15),
//                                   child: InkWell(
//                                     onTap: () {
//                                       Get.toNamed(Routes.SYLLABUS);
//                                     },
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Flexible(
//                                           child: Row(
//                                             children: [
//                                               CircleAvatar(
//                                                   backgroundColor:
//                                                       Color(ColorValues.RED),
//                                                   child: Icon(
//                                                     Icons.book,
//                                                     color: Colors.white,
//                                                   )),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Flexible(
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     GlobalLocalText(
//                                                       text: "SYLLABUS",
//                                                       size: 17,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     ),
//                                                     SizedBox(
//                                                       height: 3,
//                                                     ),
//                                                     GlobalLocalText(
//                                                       text:
//                                                           "Syllabus for new academic year 2023-24",
//                                                       size: 13.5,
//                                                       textColor: Colors.grey,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Card(
//                                             color: Colors.white60,
//                                             margin: EdgeInsets.zero,
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Icon(
//                                                 Icons.arrow_forward_ios,
//                                                 color: ColorValues.kRedColor,
//                                                 size: 18,
//                                               ),
//                                             ))
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 Divider(),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 15),
//                                   child: InkWell(
//                                     onTap: () {
//                                       Get.toNamed("/accedmic-content");
//                                     },
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Flexible(
//                                           child: Row(
//                                             children: [
//                                               CircleAvatar(
//                                                   backgroundColor:
//                                                       Color(ColorValues.RED),
//                                                   child: Icon(
//                                                     Icons
//                                                         .theater_comedy_outlined,
//                                                     color: Colors.white,
//                                                   )),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Flexible(
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     GlobalLocalText(
//                                                       text: "ACADEMIC CONTENT",
//                                                       size: 17,
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                     ),
//                                                     SizedBox(
//                                                       height: 3,
//                                                     ),
//                                                     GlobalLocalText(
//                                                       text:
//                                                           "Explore and check books online",
//                                                       size: 13.5,
//                                                       textColor: Colors.grey,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Card(
//                                             color: Colors.white60,
//                                             margin: EdgeInsets.zero,
//                                             child: Padding(
//                                               padding:
//                                                   const EdgeInsets.all(8.0),
//                                               child: Icon(
//                                                 Icons.arrow_forward_ios,
//                                                 color: ColorValues.kRedColor,
//                                                 size: 18,
//                                               ),
//                                             ))
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                                 Divider(),
//                                 SizedBox(
//                                   height: 8,
//                                 ),
//                               ],
//                             ),
//                           ),*/
//
//                         /* InkWell(
//                                   onTap: () {
//                                     var data = {"title": "Time Table"};
//                                     Get.toNamed("/time-table-screen");
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 15),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment
//                                           .spaceBetween,
//                                       children: [
//                                         Flexible(
//                                           child: Row(
//                                             children: [
//                                               CircleAvatar(
//                                                   backgroundColor: Color(
//                                                       ColorValues.RED),
//                                                   child: Icon(
//                                                     Icons
//                                                         .theater_comedy_outlined,
//                                                     color: Colors.white,
//                                                   )),
//                                               SizedBox(
//                                                 width: 10,
//                                               ),
//                                               Flexible(
//                                                 child: Column(
//                                                   crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                                   children: [
//                                                     GlobalLocalText(
//                                                       text: "TIME TABLE",
//                                                       size: 17,
//                                                       fontWeight: FontWeight
//                                                           .w500,
//                                                     ),
//                                                     SizedBox(
//                                                       height: 3,
//                                                     ),
//                                                     GlobalLocalText(
//                                                       text: "Time table for year 2023-24",
//                                                       size: 13.5,
//                                                       textColor: Colors.grey,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                         ),
//                                         Card(
//                                             color: Colors.white60,
//                                             margin: EdgeInsets.zero,
//                                             child: Padding(
//                                               padding: const EdgeInsets.all(
//                                                   8.0),
//                                               child: Icon(
//                                                 Icons.arrow_forward_ios,
//                                                 color: ColorValues.kRedColor,
//                                                 size: 18,
//                                               ),
//                                             ))
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                //  SizedBox(
//                                //    height: 8,
//                                //  ),*/
//                         /* Padding(
//                                   padding: const EdgeInsets.only(left: 4.0,right: 4.0),
//                                   child: ImageSlideshow(
//                                     height: MediaQuery.of(context).size.height/2,
//                                     indicatorRadius: 4.0,
//                                     indicatorColor: Colors.white,
//                                     onPageChanged: (value) {
//                                       debugPrint('Page changed: $value');
//                                     },
//                                     autoPlayInterval: 2000,
//                                     isLoop: true,
//                                     children: [
//                                       Stack(
//                                         alignment: Alignment.bottomCenter,
//                                         children: [
//                                           Image.asset(
//                                             'assets/Slider/1.png',
//                                             fit: BoxFit.cover,
//                                           ),
//                                           Positioned(
//                                             bottom: 40.0,
//                                             child: Column(
//                                               children: [
//                                                 Text_widget(
//                                                     fontWeight: FontWeight.bold,
//                                                     maxLines: 10,
//                                                     Simpletext:"Pool Party",
//                                                     fontSize:
//                                                     30.0,
//                                                     color: Color(
//                                                         ColorValues
//                                                             .WHITE)),
//                                                 Padding(
//                                                   padding: const EdgeInsets
//                                                       .only(
//                                                       left: 00,
//                                                       bottom: 00),
//                                                   child: ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         backgroundColor:
//                                                         Color(ColorValues
//                                                             .RED),
//                                                       ),
//                                                       onPressed: () {
//                                                       },
//                                                       child: GlobalLocalText(
//                                                         textColor: Colors
//                                                             .white,
//                                                         text: "Explore More",
//                                                       )),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Stack(
//                                         alignment: Alignment.bottomCenter,
//                                         children: [
//                                           Image.asset(
//                                             'assets/Slider/2.png',
//                                             fit: BoxFit.cover,
//                                           ),
//                                           Positioned(
//                                             bottom: 40.0,
//                                             child: Column(
//                                               children: [
//                                                 Text_widget(
//                                                     fontWeight: FontWeight.bold,
//                                                     maxLines: 10,
//                                                     Simpletext:"Games",
//                                                     fontSize:
//                                                     30.0,
//                                                     color: Color(
//                                                         ColorValues
//                                                             .WHITE)),
//                                                 Padding(
//                                                   padding: const EdgeInsets
//                                                       .only(
//                                                       left: 00,
//                                                       bottom: 00),
//                                                   child: ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         backgroundColor:
//                                                         Color(ColorValues
//                                                             .RED),
//                                                       ),
//                                                       onPressed: () {
//                                                       },
//                                                       child: GlobalLocalText(
//                                                         textColor: Colors
//                                                             .white,
//                                                         text: "Explore More",
//                                                       )),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                       Stack(
//                                         alignment: Alignment.bottomCenter,
//                                         children: [
//                                           Image.asset(
//                                             'assets/Slider/3.png',
//                                             fit: BoxFit.cover,
//                                           ),
//                                           Positioned(
//                                             bottom: 40.0,
//                                             child: Column(
//                                               children: [
//                                                 Text_widget(
//                                                     fontWeight: FontWeight.bold,
//                                                     maxLines: 10,
//                                                     Simpletext:"Winners",
//                                                     fontSize:
//                                                     30.0,
//                                                     color: Color(
//                                                         ColorValues
//                                                             .WHITE)),
//                                                 Padding(
//                                                   padding: const EdgeInsets
//                                                       .only(
//                                                       left: 00,
//                                                       bottom: 00),
//                                                   child: ElevatedButton(
//                                                       style: ElevatedButton
//                                                           .styleFrom(
//                                                         backgroundColor:
//                                                         Color(ColorValues
//                                                             .RED),
//                                                       ),
//                                                       onPressed: () {
//                                                       },
//                                                       child: GlobalLocalText(
//                                                         textColor: Colors
//                                                             .white,
//                                                         text: "Explore More",
//                                                       )),
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   ),
//                                 ),*/
//                         /* CarouselSlider(
//                                     items: controller.imgList
//                                         .map((item) => Container(
//                                       child: Stack(
//                                         children: <Widget>[
//                                           Image.network(item, fit: BoxFit.fill, width: 1400),
//                                           Positioned(
//                                             bottom: 0.0,
//                                             left: 0.0,
//                                             right: 0.0,
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                 gradient: LinearGradient(
//                                                   colors: [
//                                                     Color.fromARGB(200, 0, 0, 0),
//                                                     Color.fromARGB(0, 0, 0, 0)
//                                                   ],
//                                                   begin: Alignment.bottomCenter,
//                                                   end: Alignment.topCenter,
//                                                 ),
//                                               ),
//                                               padding: EdgeInsets.symmetric(
//                                                   vertical: 10.0, horizontal: 20.0),
//                                               child: Text(
//                                                 'No. ${controller.imgList.indexOf(item)} image',
//                                                 style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 20.0,
//                                                   fontWeight: FontWeight.bold,
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ))
//                                         .toList(),
//                                     carouselController: controller
//                                         .slidercontroller,
//                                     options: CarouselOptions(
//                                         autoPlay: true,
//                                         enlargeCenterPage: true,
//                                         aspectRatio: 2.0,
//                                         onPageChanged: (index, reason) {
//                                           // setState(() {
//                                           controller.current = index;
//                                           // });
//                                         }),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: controller.imgList
//                                         .asMap()
//                                         .entries
//                                         .map((entry) {
//                                       return GestureDetector(
//                                         onTap: () => controller.slidercontroller
//                                             .animateToPage(entry.key),
//                                         child: Container(
//                                           width: 12.0,
//                                           height: 12.0,
//                                           margin: EdgeInsets.symmetric(
//                                               vertical: 8.0, horizontal: 4.0),
//                                           decoration: BoxDecoration(
//                                               shape: BoxShape.circle,
//                                               color: (Theme
//                                                   .of(context)
//                                                   .brightness == Brightness.dark
//                                                   ? Colors.white
//                                                   : Colors.black)
//                                                   .withOpacity(
//                                                   controller.current ==
//                                                       entry.key ? 0.9 : 0.4)),
//                                         ),
//                                       );
//                                     }).toList(),
//                                   ),*/
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//           ],
//         ),
//             physics: BouncingScrollPhysics(),
//             footer: ClassicFooter(
//           loadStyle: LoadStyle.HideAlways,
//           completeDuration: Duration(milliseconds: 500),
//         ),
//             onRefresh: () async {
//           await controller.refrshApi();
//           await Future.delayed(Duration(milliseconds: 1000));
//
//           if (true) controller.refreshController.refreshCompleted();
//         },
//           )
//       );
//       // }
//     });
//   }
//
//   List<Widget> _getImageSlider() {
//     final List<Widget> imageSliders = controller.imgListSlider.map((imgListSlider) => _buildImageView(imgListSlider)).toList();
//
//     return imageSliders;
//   }
//
//   Widget _buildImageView(String imageUrl) {
//     return Container(
//       height: 250,
//       // margin: EdgeInsets.symmetric(horizontal: 20),
//       decoration: BoxDecoration(
//         // borderRadius: BorderRadius.circular(12),
//         image: DecorationImage(
//             image: NetworkImage(imageUrl),
//             fit: BoxFit.fill),
//       ),
//     );
//   }
//
//
// }

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
