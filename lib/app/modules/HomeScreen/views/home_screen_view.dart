import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                          SizedBox(
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
                                    text: "Anand",
                                    textColor: Colors.white,
                                    size: 15,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              GlobalLocalText(
                                text: "Class 8, Shift Morning",
                                textColor: Colors.white,
                                fontWeight: FontWeight.w300,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
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
                                Icons.search_rounded,
                                color: Colors.white,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add_alert,
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
                    fontWeight: FontWeight.w400,
                    size: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 125,
                    child: ListView.builder(
                        itemCount: 3,
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
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  //height: 70,
                                  width: 130,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.red,
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        GlobalLocalText(
                                          text: "School\nNotice",
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 20, bottom: 20),
                  child: Container(
                    height: 200,
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
                                text: "Assignment",
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
                SizedBox(
                  height: 8,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                _tabSection(context),
                Padding(
                  padding: const EdgeInsets.only(left: 15,),
                  child: GlobalLocalText(
                    text: "EVENTS & EXTRA CURRICULAR ACTIVITIES",
                    textColor: Colors.black,
                    fontWeight: FontWeight.w400,
                    size: 16,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                        itemCount: 6,
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
                                    image: DecorationImage(image: AssetImage("assets/kungfu.jpeg"),fit: BoxFit.cover),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                      GlobalLocalText(text: "2019",textColor: Colors.white,),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            GlobalLocalText(text: "Sport Event",size: 16,textColor: Colors.white,),
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
          Container(
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
              Container()
            ]),
          ),
        ],
      ),
    );
  }
}
