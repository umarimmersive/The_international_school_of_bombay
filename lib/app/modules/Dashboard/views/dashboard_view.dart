import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/modules/About/views/about_view.dart';
import 'package:the_international_school_of_bombay/app/modules/Home/views/home_view.dart';
import 'package:the_international_school_of_bombay/app/modules/HomeScreen/views/home_screen_view.dart';
import 'package:the_international_school_of_bombay/app/modules/Menu/views/menu_view.dart';
import '../../Hoppiness/views/hoppiness_view.dart';
import '../controllers/dashboard_controller.dart';
import 'bottomNavigationBar.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.grey,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex.value,
              children: [
                HomeScreenView(),
                HoppinessView(),
                AboutView(),
                MenuView(),
              ],
            ),
          ),
          bottomNavigationBar:
             bottomNavigationBar(),
         /* ):
          bottomNavigationBar()*/

      ),
    ));
  }
}
