import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/global_widgets/Text.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  TabController? _tabController;

  HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
            child: Column(
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
                                children: const [
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
                              Container(
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
                              onPressed: () {},
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
                                print('----------------00');
                              }else if(index==1){
                                Get.toNamed(Routes.NOTICE_BOARD);
                              }else if(index==2) {
                                Get.toNamed(Routes.NOTICE_BOARD);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Card(
                                  margin: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)),
                                    //height: 70,
                                    width: 120,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
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
                              onPressed: () {},
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
                    child: SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: controller.data.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Card(
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
        ),
      ),
    );
  }
  Widget _tabSection(BuildContext context) {
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
            child: Container(
              //Add this to give height
              height: MediaQuery.of(context).size.height / 2.1,
              child: TabBarView(children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 3),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 90,
                                  width: 80,
                                  color: Colors.black,
                                  child: Image.asset(
                                    "assets/practise.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GlobalLocalText(
                                      text:
                                          "The programme is run by the acchivment\nprograme dipartment and offers a range\nof activities",
                                      size: 13,
                                    ),
                                    SizedBox(
                                      height: 22,
                                    ),
                                    Container(
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
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider()
                          ],
                        ),
                      );
                    }),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 3),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 90,
                                  width: 80,
                                  color: Colors.black,
                                  child: Image.asset(
                                    "assets/practise.jpeg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    GlobalLocalText(
                                      text:
                                      "The programme is run by the acchivment\nprograme dipartment and offers a range\nof activities",
                                      size: 13,
                                    ),
                                    SizedBox(
                                      height: 22,
                                    ),
                                    Container(
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
                                    )
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Divider()
                          ],
                        ),
                      );
                    }),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
