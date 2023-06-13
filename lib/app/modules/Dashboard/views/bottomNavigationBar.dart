
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../controllers/dashboard_controller.dart';

class bottomNavigationBar extends GetView<DashboardController> {
  const bottomNavigationBar({Key? key}) : super(key: key);


  static bool isDark(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    var color = (isDark(context) ? Color(0xFF414040) : Colors.white).obs;
    var color1 = (isDark(context) ? Colors.white : Colors.red).obs;
    return  Card(
      elevation: 5,
      margin: EdgeInsets.zero,
      child: StylishBottomBar(

        hasNotch: true,
        currentIndex: controller.tabIndex.value,
        onTap: controller.tabIndex,
        elevation: 5,
        backgroundColor: color.value,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0), topRight: Radius.circular(0)),
        items: [
          BottomBarItem(
              icon: Image.asset(
                "assets/home.png",
                height: 30,
                color: Theme.of(Get.context!).iconTheme.color,
              ),
              selectedIcon: Image.asset(
                "assets/home (1).png",
                height: 30,
                color: Colors.red,
              ),
              selectedColor: color1.value,
              //unSelectedColor: color.value,
              backgroundColor: Colors.tealAccent,
              title: Text(
                "Home",
                style: TextStyle(fontSize: 12),
              )),
          BottomBarItem(
              icon: Image.asset(
                "assets/square.png",
                height: 30,
                color: Theme.of(Get.context!).iconTheme.color,
              ),
              selectedIcon: Image.asset(
                "assets/square (1).png",
                height: 30,
               // color: Theme.of(Get.context!).iconTheme.color,
                color: Colors.red,
              ),
              selectedColor: color1.value,
             // unSelectedColor: color.value,
              backgroundColor: Colors.tealAccent,
              title: Text(
                "Happenings",
                style: TextStyle(fontSize: 11),
              )),
          BottomBarItem(
              icon: Image.asset(
                "assets/home.png",
                height: 30,
                color: Theme.of(Get.context!).iconTheme.color,
              ),
              selectedIcon: Image.asset(
                "assets/home (1).png",
                height: 30,
                color: Colors.red,
              ),
              selectedColor: color1.value,
              //unSelectedColor: color.value,
              backgroundColor: Colors.tealAccent,
              title: Text(
                "Home",
                style: TextStyle(fontSize: 12),
              )),
          BottomBarItem(
              icon: Image.asset(
                "assets/info.png",
                height: 30,
                color: Theme.of(Get.context!).iconTheme.color,
              ),
              selectedIcon: Image.asset(
                "assets/info (1).png",
                height: 30,
                color: Colors.red,
              ),
              selectedColor: color1.value,
              //unSelectedColor: color.value,
              backgroundColor: Colors.tealAccent,
              title: Text(
                "About",
                style: TextStyle(fontSize: 11),
              )
          ),
          BottomBarItem(
              icon: Image.asset(
                "assets/menu.png",
                height: 30,
                color: Theme.of(Get.context!).iconTheme.color,
              ),
              selectedIcon: Image.asset(
                "assets/menu (1).png",
                height: 30,
                color: Colors.red,
               // color: Theme.of(Get.context!).iconTheme.color,
              ),
              selectedColor: color1.value,
             // unSelectedColor: color.value,
              backgroundColor: Colors.tealAccent,
              title: Text(
                "Menu",
                style: TextStyle(fontSize: 11),
              )),
        ],
        option: AnimatedBarOptions(
          // iconSize: 32,
          barAnimation: BarAnimation.transform3D,
          iconStyle: IconStyle.Default,
          // opacity: 0.3,
        ),
      ),
    );
  }
}
