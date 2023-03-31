import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/modules/About/views/about_view.dart';
import 'package:the_international_school_of_bombay/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:the_international_school_of_bombay/app/modules/Menu/views/menu_view.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';
import '../../Hoppiness/views/hoppiness_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
   DashboardView({Key? key}) : super(key: key);


   Future<bool?> _onBackPressed(context) async {
     return showDialog(
         context: context,
         builder: (BuildContext context) {
           return AlertDialog(
             elevation: 10,
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.all(Radius.circular(10.0))),
             backgroundColor: Color(ColorValues.RED),
             title:
             Padding(padding: EdgeInsets.only(top: 20),child:  Center(
               child:
               Text('Do You Want To Exit',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 18,
                   fontWeight: FontWeight.w500,
                   fontFamily: 'Lato',
                 ),
               ),

               //Text('Do you want to exit ',),
             ),),


            /* content:
             Text(''),*/
             actionsAlignment: MainAxisAlignment.spaceEvenly,

             actions: <Widget>[
               Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
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
               ),),
               Padding(padding: EdgeInsets.only(bottom: 20),child: Container(
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
               ),),


             ],
           );
         });
   }
  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
        child: Obx(() =>  Scaffold(
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
              //  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {

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
                                color:  controller.currentTab.value == 0 ? Colors.red : Colors.grey,
                              ),
                              Text(
                                'Home',
                                style: TextStyle(
                                  color:  controller.currentTab.value == 0 ? Colors.red : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {

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
                                color:  controller.currentTab.value == 1 ? Colors.red : Colors.grey,
                              ),
                              Text(
                                'Happenings',
                                style: TextStyle(
                                  color:  controller.currentTab.value == 1 ? Colors.red : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  // Right Tab bar icons

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {

                            controller.currentScreen =
                                AboutView(); // if user taps on this dashboard tab will be active
                            controller.currentTab.value = 2;

                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                size: 25,
                                Icons.error_outline,
                                color:  controller.currentTab.value == 2 ? Colors.red : Colors.grey,
                              ),
                              Text(
                                'About',
                                style: TextStyle(
                                  color:  controller.currentTab.value == 2 ? Colors.red : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            controller.currentScreen =
                                MenuView(); // if user taps on this dashboard tab will be active
                            controller.currentTab.value = 3;

                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                size: 25,
                                Icons.menu,
                                color:  controller.currentTab.value == 3 ? Colors.red : Colors.grey,
                              ),
                              Text(
                                'Menu',
                                style: TextStyle(
                                  color:  controller.currentTab.value == 3 ? Colors.red : Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        )),
        onWillPop: () async {
          bool? result= await _onBackPressed(context);
          if(result == null){
            result = false;
          }
          return result;
        },

      );

  }
}
