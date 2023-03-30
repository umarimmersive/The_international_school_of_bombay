import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/checkbox_list_tile/gf_checkbox_list_tile.dart';
import 'package:getwidget/components/radio_list_tile/gf_radio_list_tile.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:getwidget/types/gf_radio_type.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/Text_widget.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text.dart';
import '../../../utils/global_widgets/buttons.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  TabController? _tabController;

  HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Obx(()=>
       /* Scaffold(
        body:  Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Stack(
                  children: [
                    Image.asset("${controller.Image}"),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 80,
                                    width: 70,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.asset(
                                          "assets/profileimages.jpeg",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          GlobalLocalText(
                                            text: "Hello,",
                                            textColor: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          GlobalLocalText(
                                            text: "Anand!",
                                            textColor: Colors.white,
                                            size: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      const GlobalLocalText(
                                        text: "Class 8, Shift Morning",
                                        textColor: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          _showSimpleDialog(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                GlobalLocalText(
                                                  text: "Switch Profile",
                                                  textColor: Colors.white,
                                                  size: 12,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        size: 24,
                                        Icons.search_rounded,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 25),
                          child: GlobalLocalText(
                            text: "EXPLORE",
                            textColor: Colors.white,
                            fontWeight: FontWeight.bold,
                            size: 20,
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
                                    onTap: (){
                                      if(index==0){

                                      }else if(index==1){
                                        Get.toNamed(Routes.NOTICE_BOARD);
                                      }else if(index==2) {
                                        Get.toNamed(Routes.NOTICE_BOARD);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 15,bottom: 05),
                                      child: Card(
                                          elevation: 03,
                                          margin: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5)),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(5)),
                                            // height: 70,
                                            //width: 120,
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: CircleAvatar(
                                                      backgroundColor: Colors.red,
                                                      child: Icon(
                                                        controller.icons[index],
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: GlobalLocalText(
                                                      text: controller.title[index],
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
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20, bottom: 20),
                          child: Container(
                            height: MediaQuery.of(context).size.height/3,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/school_prayer.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18, bottom: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GlobalLocalText(
                                    text:
                                    "Art and craft gives the children yet anouther\nvenue to broaden their horizans",
                                    textColor: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.red),
                                      onPressed: () {

                                      },
                                      child: GlobalLocalText(
                                        textColor: Colors.white,
                                        text: "Read More",
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                ),


                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: (){
                      Get.toNamed(Routes.UPCOMING_EVENT);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.update_rounded,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalLocalText(
                                  text: "Upcoming Event".toUpperCase(),
                                  size: 17.5,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                GlobalLocalText(
                                  text: "Chack your daily assignmet here",
                                  size: 13.5,
                                  textColor: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                        Card(
                            color: Colors.white60,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
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
                    onTap: (){
                      Get.toNamed(Routes.ASSIGNMENT);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.assessment,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalLocalText(
                                  text: "Assignment".toUpperCase(),
                                  size: 17.5,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                GlobalLocalText(
                                  text: "Chack your daily assignmet here",
                                  size: 13.5,
                                  textColor: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                        Card(
                            color: Colors.white60,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
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
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.SYLLABUS);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.book,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalLocalText(
                                  text: "SYLLABUS",
                                  size: 17.5,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                GlobalLocalText(
                                  text: "syllabus for new academic year 2020-21",
                                  size: 13.5,
                                  textColor: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                        Card(
                            color: Colors.white60,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.theater_comedy_outlined,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GlobalLocalText(
                                text: "ACADEMIC CONTENT",
                                size: 17.5,
                                fontWeight: FontWeight.w500,
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              GlobalLocalText(
                                text: "Explore and check books online",
                                size: 13.5,
                                textColor: Colors.grey,
                              ),
                            ],
                          )
                        ],
                      ),
                      Card(
                          color: Colors.white60,
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                              size: 18,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(Routes.PDF_VIEW);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Icon(
                                  Icons.theater_comedy_outlined,
                                  color: Colors.white,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalLocalText(
                                  text: "TIME TABLE",
                                  size: 17.5,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                GlobalLocalText(
                                  text: "Time table for year 2020-21",
                                  size: 13.5,
                                  textColor: Colors.grey,
                                ),
                              ],
                            )
                          ],
                        ),
                        Card(
                            color: Colors.white60,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
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
                  height: 20,
                ),
                _tabSection(context),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                  child: GlobalLocalText(
                    text: "EVENTS & EXTRA CURRICULAR ACTIVITIES",
                    textColor: Colors.black,
                    fontWeight: FontWeight.bold,
                    size: 16,
                  ),
                ),

                InkWell(
                  onTap: (){
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
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage("assets/img.jpeg"),fit: BoxFit.cover),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding:  EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          GlobalLocalText(text: "${controller.data[index]['date']}",textColor: Colors.white,fontWeight: FontWeight.w400),
                                          SizedBox(height: 5,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              GlobalLocalText(text: "${controller.data[index]['title']}",size: 16,textColor: Colors.white,fontWeight: FontWeight.bold,),
                                              Icon(Icons.arrow_forward_ios,color: Colors.white,size: 18,)
                                            ],
                                          )

                                        ],),
                                    ),
                                    //height: 70,
                                    width: 200,
                                  )),
                            );
                          }),
                    ),
                  ),
                ),
                SizedBox(height: 10,),

              ],
            ),
          ),
        )
      ),*/
    SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          //clipBehavior: Clip.antiAlias,
          children: [
            Container(
              color: Color(ColorValues.RED),
              height: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  height: 50,
                                  width: 50,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.asset(
                                        "${controller.profile_image}",
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 45.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          GlobalLocalText(
                                            text: "Hello,",
                                            textColor: Colors.white,
                                            fontWeight: FontWeight.w300,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          GlobalLocalText(
                                            text: "Anand!",
                                            textColor: Colors.white,
                                            size: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      const GlobalLocalText(
                                        text: "Class 8, Shift Morning",
                                        textColor: Colors.white,
                                        fontWeight: FontWeight.w300,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                   /*   GestureDetector(
                                        onTap: (){
                                          _showSimpleDialog(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.2),
                                              borderRadius: BorderRadius.circular(5)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.person,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  width: 2,
                                                ),
                                                GlobalLocalText(
                                                  text: "Switch Profile",
                                                  textColor: Colors.white,
                                                  size: 12,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )*/
                                    ],
                                  ),
                                )
                              ],
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
                    Expanded(
                        flex: 1,
                        child:SizedBox()),
                ],
              ),
            ),
            Container(
             // margin: EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        child:
          Stack(
            alignment: Alignment.center,
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.transparent,
                  height: MediaQuery.of(context).size.height,
                ),
                Container(
                  margin: EdgeInsets.only(top: 120),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                     /* Center(
                        child: Container(
                          height: 50,
                          child: Image.asset('assets/images/logo.png'),
                        ),
                      ),*/

                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Center(
                          child: Container(
                            height: 25,
                            child: Text_widget(
                              Simpletext: 'The International School of Bombay',fontSize: 16.0,
                              color: ColorValues.BLACK,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),

                      Divider(
                        height: 1,
                      ),

                      SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.image_data.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext, index) {
                              return Padding(
                                padding: const EdgeInsets.all(03.0),
                                child: Card(
                                  elevation: 05,
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                    height: 80,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage('${controller.image_data[index]}'),
                                            fit: BoxFit.fill)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20, left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Bombay",
                                            style: TextStyle(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.white),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "The International School of Bombay on Facebook",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight:
                                                FontWeight.bold,
                                                color:
                                                Color(ColorValues.RED)),
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
                        padding: const EdgeInsets.only(left: 15, top: 10),
                        child: GlobalLocalText(
                          text: "Explore More",
                          textColor: Colors.black,
                          fontWeight: FontWeight.w400,
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
                                  onTap: (){
                                    if(index==0){

                                    }else if(index==1){
                                      Get.toNamed(Routes.NOTICE_BOARD);
                                    }else if(index==2) {
                                      Get.toNamed(Routes.NOTICE_BOARD);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,bottom: 05),
                                    child: Card(
                                        elevation: 03,
                                        margin: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(5)),
                                          // height: 70,
                                          //width: 120,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: CircleAvatar(
                                                    backgroundColor:Color(ColorValues.RED),
                                                    child: Icon(
                                                      controller.icons[index],
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),

                                                Expanded(
                                                  flex: 1,
                                                  child: GlobalLocalText(
                                                    text: controller.title[index],
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
                          text: "Latest Event",
                          textColor: Colors.black,
                          fontWeight: FontWeight.w400,
                          size: 16,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 20, bottom: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height/3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/school_prayer.jpg"),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.blue),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GlobalLocalText(
                                  text:
                                  "Art and craft gives the children yet anouther\nvenue to broaden their horizans",
                                  textColor: Colors.white,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:Color(ColorValues.RED),),
                                    onPressed: () {

                                    },
                                    child: GlobalLocalText(
                                      textColor: Colors.white,
                                      text: "Read More",
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(
                          onTap: (){
                            Get.toNamed(Routes.UPCOMING_EVENT);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor:Color(ColorValues.RED),
                                      child: Icon(
                                        Icons.update_rounded,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GlobalLocalText(
                                        text: "Upcoming Event".toUpperCase(),
                                        size: 17.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      GlobalLocalText(
                                        text: "Chack your daily assignmet here",
                                        size: 13.5,
                                        textColor: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Card(
                                  color: Colors.white60,
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
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
                          onTap: (){
                            Get.toNamed(Routes.ASSIGNMENT);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
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
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GlobalLocalText(
                                        text: "Assignment".toUpperCase(),
                                        size: 17.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      GlobalLocalText(
                                        text: "Chack your daily assignmet here",
                                        size: 13.5,
                                        textColor: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Card(
                                  color: Colors.white60,
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
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
                        child: GestureDetector(
                          onTap: (){
                            Get.toNamed(Routes.SYLLABUS);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                      backgroundColor:Color(ColorValues.RED),
                                      child: Icon(
                                        Icons.book,
                                        color: Colors.white,
                                      )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GlobalLocalText(
                                        text: "SYLLABUS",
                                        size: 17.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      GlobalLocalText(
                                        text: "syllabus for new academic year 2020-21",
                                        size: 13.5,
                                        textColor: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Card(
                                  color: Colors.white60,
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor:Color(ColorValues.RED),
                                    child: Icon(
                                      Icons.theater_comedy_outlined,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GlobalLocalText(
                                      text: "ACADEMIC CONTENT",
                                      size: 17.5,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    GlobalLocalText(
                                      text: "Explore and check books online",
                                      size: 13.5,
                                      textColor: Colors.grey,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Card(
                                color: Colors.white60,
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: (){
                          Get.toNamed(Routes.PDF_VIEW);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
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
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GlobalLocalText(
                                        text: "TIME TABLE",
                                        size: 17.5,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      GlobalLocalText(
                                        text: "Time table for year 2020-21",
                                        size: 13.5,
                                        textColor: Colors.grey,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Card(
                                  color: Colors.white60,
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
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
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                        child: GlobalLocalText(
                          text: "Knowledge Base",
                          textColor: Colors.black,
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ),

                      InkWell(
                        onTap: (){
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
                                            borderRadius: BorderRadius.circular(5)),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(image: AssetImage("assets/img.jpeg"),fit: BoxFit.cover),
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10)),
                                          child: Padding(
                                            padding:  EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                GlobalLocalText(text: "${controller.data[index]['date']}",textColor: Colors.white,fontWeight: FontWeight.w400),
                                                SizedBox(height: 5,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    GlobalLocalText(text: "${controller.data[index]['title']}",size: 16,textColor: Colors.white,fontWeight: FontWeight.bold,),
                                                    Icon(Icons.arrow_forward_ios,color: Colors.white,size: 18,)
                                                  ],
                                                )

                                              ],),
                                          ),
                                          //height: 70,
                                          width: 200,
                                        )),
                                  );
                                }),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                        child: GlobalLocalText(
                          text: "Announcements",
                          textColor: Colors.black,
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: SizedBox(
                          height: 160,
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
                                        borderRadius:
                                        BorderRadius.circular(8)),
                                    margin: EdgeInsets.zero,
                                    elevation: 3,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: ColorValues.WHITE_COLORE,
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
                                            Text_widget(Simpletext: 'The Internatinal School of Bombay',
                                                fontSize: 18.0,
                                                color: Color(ColorValues.RED),
                                                    fontWeight:FontWeight.bold
                                            ),

                                            SizedBox(
                                              height: 8,
                                            ),
                                            Text_widget(
                                                 maxLines: 5,
                                                Simpletext: '${controller.Annoucment[index]}',
                                                fontSize: 14.0,
                                                color: Color(ColorValues.DIVIDER_COL)
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
                                                                topRight:
                                                                Radius.circular(
                                                                    20),
                                                                topLeft: Radius
                                                                    .circular(
                                                                    20))),
                                                        backgroundColor:
                                                        Colors.white,
                                                        context: context,
                                                        builder:
                                                            (context) {
                                                          return Padding(
                                                            padding: const EdgeInsets
                                                                .only(
                                                                left: 20,
                                                                right: 8,
                                                                bottom:
                                                                20),
                                                            child:
                                                            SingleChildScrollView(
                                                              child:
                                                              Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                    Alignment.topRight,
                                                                    child: IconButton(
                                                                        onPressed: () {
                                                                          Get.back();
                                                                        },
                                                                        icon: Icon(Icons.cancel_outlined)),
                                                                  ),
                                                                  Text_widget(Simpletext: 'The International School of Bombay',
                                                                      fontSize: 16.0,
                                                                      color: Color(ColorValues.RED)),
                                                                  SizedBox(
                                                                    height:
                                                                    8,
                                                                  ),
                                                                  Text_widget(
                                                                      maxLines: 10,
                                                                      Simpletext: '${controller.Annoucment[index]}',
                                                                      fontSize: 14.0,
                                                                      color: Color(ColorValues.DIVIDER_COL)),

                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          color:  Color(ColorValues.RED),
                                                          borderRadius: BorderRadius.circular(12),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: Text_widget(Simpletext: 'Read More',
                                                              fontSize: 14.0,
                                                              color: Color(ColorValues.WHITE_COLOR)),
                                                        ),
                                                      ),
                                                    /*  LocaleText(
                                                        'readmore',
                                                        style: TextStyle(
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            color: Colors
                                                                .red,
                                                            decoration:
                                                            TextDecoration
                                                                .underline),
                                                      ),*/
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
                ),
              ],
            ),
            Positioned(
              top: 100,
              child: Container(
                   height: 50,
                    width: 50,
                  decoration: BoxDecoration(
                    color: ColorValues.WHITE_COLORE,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset('assets/only_logo.png'),
                  )
              ),
            ),
          ],
        )


      ),
            )
          ],
        ),
      //  floatingActionButton: MyFloatingActionButton()
       /* FloatingActionButton(
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/only_logo.png'),
          ),
          onPressed: () {

          },
        ),*/


        //floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
    )
    );
  }
 /* Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            child: TabBar(
                indicatorPadding:
                    EdgeInsets.only(bottom: -20, left: 15, right: 15),
                indicatorColor: Colors.red,
                tabs: [
                  GlobalLocalText(
                    text: "KNOWLEDGE BASE",
                    textColor: Colors.black,
                  ),
                  GlobalLocalText(
                    text: "UPCOMING EVENTS",
                    textColor: Colors.black,
                  )
                ]),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: LimitedBox(
              maxHeight: 120,
              child: TabBarView(
                  children: [
                    for(int i=0;i<5;i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 3),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: 90,
                                    width: 80,
                                    color: Colors.black,
                                    child: Image.asset(
                                      "assets/practise.jpeg",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                Expanded(
                                  flex: 8,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: GlobalLocalText(
                                          maxLines: 5,
                                          text:
                                          "The programme is run by the acchivment programe dipartment and offers a range of activities",
                                          size: 13,
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0,top: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.red[100],
                                              borderRadius: BorderRadius.circular(3)),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 7, vertical: 3),
                                            child: GlobalLocalText(
                                              text: "20 March,2022",
                                              textColor: Colors.red,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider()
                        ],
                      ),
                    )

              ]),
            ),
          ),
        ],
      ),
    );
  }*/

  Future<void> _showSimpleDialog(context) async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog( // <-- SEE HERE
            title: Center(child: const Text('Select Student')),
            children: <Widget>[
              for(int i=0;i<3;i++)
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

              Obx(() =>
                  GFCheckboxListTile(
                    titleText: '${controller.Studentdata[i]['titleText']}',
                    subTitleText: '${controller.Studentdata[i]['subTitleText']}',
                    avatar: GFAvatar(
                      backgroundImage: AssetImage('assets/profileimages.jpeg'),
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
                      for (int i =0;i<controller.isChecked.length;i++) {
                        controller.isChecked[i] = false;
                      }
                      controller.isChecked[i] = value;
                    },
                    value:  controller.isChecked[i],
                    inactiveIcon: null,
                  ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10),
                child: RoundedFilledButton(
                  label: 'SWITCH PROFILE',
                  color: Color(ColorValues.RED),
                  height: 40,
                  width: double.infinity,
                  fontSize: 12,
                  ontap: (){
                    // Get.to(DeshboardScreenView())
                    Get.back();
                  },
                ),
              ),

              GestureDetector(
                onTap: (){
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
