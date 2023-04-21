import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_international_school_of_bombay/app/modules/About/views/about_view.dart';
import 'package:the_international_school_of_bombay/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:the_international_school_of_bombay/app/modules/Menu/views/menu_view.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/api_service.dart';
import '../../Hoppiness/views/hoppiness_view.dart';
import '../../ScheduleScreen/views/schedule_screen_view.dart';
import '../../TimeTableScreen/views/time_table_screen_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);
  final keyIsFirstLoaded = 'is_first_loaded';

  Future<bool?> _onBackPressed(context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 10,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            backgroundColor: Color(ColorValues.RED),
            title: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Center(
                child: Text(
                  'Do You Want To Exit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Lato',
                  ),
                ),

                //Text('Do you want to exit ',),
              ),
            ),

            /* content:
             Text(''),*/
            actionsAlignment: MainAxisAlignment.spaceEvenly,
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    child: Text(
                      'NO',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextButton(
                    child: Text(
                      'YES',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      SystemNavigator.pop();
                    },
                  ),
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    if(controller.count==0){
      Future.delayed(const Duration(seconds: 2), () {
        showDialogIfFirstLoaded(context);
// Here you can write your code
      });
      controller.count.value++;

      print('count--------------${controller.count.value}');
    }

    return WillPopScope(
      child: Obx(() => Scaffold(
            body: PageStorage(
              child: controller.currentScreen,
              bucket: controller.bucket,
            ),
            /* floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/only_logo.png'),
            ),
            onPressed: () {},
          ),*/
            //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 10,
              child: Container(
                height: 60,
                child: Row(
                   children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.currentScreen =
                              HomeScreenView(); // if user taps on this dashboard tab will be active
                          controller.currentTab.value = 0;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              size: 25,
                              Icons.home_outlined,
                              color: controller.currentTab.value == 0
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 11,
                                color: controller.currentTab.value == 0
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          controller.currentScreen =
                              HoppinessView(); // if user taps on this dashboard tab will be active
                          controller.currentTab.value = 1;
                        },

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              size: 25,
                              Icons.dashboard_outlined,
                              color: controller.currentTab.value == 1
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            Text(
                              'Happenings',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,

                                fontSize: 11,
                                color: controller.currentTab.value == 1
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.currentScreen =
                              ScheduleScreenView(); // if user taps on this dashboard tab will be active
                          controller.currentTab.value = 2;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              size: 25,
                              Icons.calendar_month,
                              color: controller.currentTab.value == 2
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            Text(
                              'Schedule',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,

                                fontSize: 11,
                                color: controller.currentTab.value == 2
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.currentScreen =
                              TimeTableScreenView(); // if user taps on this dashboard tab will be active
                          controller.currentTab.value = 3;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              size: 25,
                              Icons.timer,
                              color: controller.currentTab.value == 3
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            Text(
                              'Time Table',
                              style: TextStyle(

                                overflow: TextOverflow.ellipsis,
                                fontSize: 11,
                                color: controller.currentTab.value == 3
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          controller.currentScreen =
                              MenuView(); // if user taps on this dashboard tab will be active
                          controller.currentTab.value = 4;
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              size: 25,
                              Icons.menu,
                              color: controller.currentTab.value == 4
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            Text(
                              'Menu',
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 11,
                                color: controller.currentTab.value == 4
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
      onWillPop: () async {
        bool? result = await _onBackPressed(context);
        if (result == null) {
          result = false;
        }
        return result;
      },
    );
  }
  showDialogIfFirstLoaded(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20))),
          backgroundColor: Colors.white,
          context: context,
          builder: (context) {
            return Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.network(
                    '${ApiService.IMAGE_URL+controller.BottomSheetImage.value}',
                    fit: BoxFit.fill,
                  ),
                  /*   ConfettiWidget(
                                            confettiController:
                                                controller.controllerTopCenter,
                                            blastDirectionality: BlastDirectionality
                                                .explosive, // don't specify a direction, blast randomly
                                            shouldLoop: false, //
                                            // start again as soon as the animation is finished
                                            colors: const [
                                              Colors.green,
                                              Colors.blue,
                                              Colors.pink,
                                              Colors.orange,
                                              Colors.purple,
                                              Colors.amber,
                                              Colors.red
                                            ], // manually specify the colors to be used
                                            createParticlePath:
                                                drawStar, // define a custom shape/path.
                                          ),*/
                ],
              ),
            );
          });
    }
  }

}
