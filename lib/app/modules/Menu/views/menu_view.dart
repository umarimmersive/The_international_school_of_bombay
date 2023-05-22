import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/my_local_service.dart';
import 'package:the_international_school_of_bombay/app/utils/shared_prefrence/shared_prefrences_constant.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/constants/api_service.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../../../utils/global_widgets/globle_var.dart';
import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuuController> {
  const MenuView({Key? key}) : super(key: key);
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    var color = (isDark(context) ? Color(0xFF414040) : Colors.white).obs;
    var color1 = (isDark(context) ? Colors.white : Colors.black).obs;
    return Scaffold(
        appBar: appbar(title: 'Menu', icon_button: false),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.2,
                color: Color(ColorValues.RED),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    userData!.profile_image.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5)),
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  "${ApiService.IMAGE_URL + userData!.profile_image}",
                                  fit: BoxFit.cover,
                                )),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            height: 80,
                            width: 80,
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
                    /* Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 14),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.grey[100],
                        child: CircleAvatar(
                          radius: 33,
                          backgroundImage: AssetImage('assets/images/s1.jpg'),
                        ),
                      ),
                    ),*/
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text_widget(
                              Simpletext: '${userData!.full_name}',
                              fontSize: 16.0,
                              color: ColorValues.WHITE_COLORE,
                              fontWeight: FontWeight.bold),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text_widget(
                                  color: ColorValues.WHITE_COLORE,
                                  Simpletext: 'Mode',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700),
                              Obx(() => Transform.scale(
                                    scale: 1.1,
                                    child: Switch(
                                      value: controller.isSwitched.value,
                                      onChanged: (value) {
                                        controller.isSwitched.value = value;
                                        print(controller.isSwitched);
                                        Get.changeThemeMode(
                                          controller.isSwitched.value
                                              ? ThemeMode.dark
                                              : ThemeMode.light,
                                        );

                                        controller.preferences.setString(
                                            SDConstant.isDark,
                                            controller.isSwitched.value
                                                .toString());
                                        print(
                                            "SharedPreferencesValueProfile ${controller.preferences.getString(SDConstant.isDark)}");
                                      },
                                      activeTrackColor: Color(0xffD9D9D9),
                                      activeColor: Colors.blue,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 05,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('Path to your image')),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    color: color.value),
                margin: EdgeInsets.only(top: 160),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.EDIT_PROFILE);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                elevation: 05,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              'assets/images/user.png',
                                              height: 20,
                                              width: 20,
                                              color: Colors.red,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text_widget(
                                              Simpletext: 'Edit Profile',
                                              fontSize: 14.0,
                                            )),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              //Get.toNamed(Routes.PHOTO_GALLARY);
                              Get.toNamed(Routes.PHOTOS_VIDIOS_GALLERY);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                elevation: 05,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              'assets/images/image.png',
                                              height: 20,
                                              width: 20,
                                              color: Colors.red,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text_widget(
                                              Simpletext: 'Gallery',
                                              fontSize: 14.0,
                                            )),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.CAMPUS);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(05.0),
                              child: Card(
                                elevation: 05,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              'assets/images/campus.png',
                                              height: 20,
                                              width: 20,
                                              color: Colors.red,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text_widget(
                                              Simpletext: 'Our Campuses',
                                              fontSize: 14.0,
                                            )),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(05.0),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.OUR_PHILOSYPHER);
                              },
                              child: Card(
                                elevation: 05,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              'assets/images/light-bulb.png',
                                              height: 20,
                                              width: 20,
                                              color: Colors.red,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text_widget(
                                              Simpletext: 'Our Philosopher',
                                              fontSize: 14.0,
                                            )),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(05.0),
                            child: Card(
                              elevation: 05,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Container(
                                  height: 90,
                                  width: 90,
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Image.asset(
                                            'assets/images/rating.png',
                                            height: 20,
                                            width: 20,
                                            color: Colors.red,
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Text_widget(
                                            Simpletext: 'Rate Us',
                                            fontSize: 14.0,
                                          )),
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('---------------');
                              Get.toNamed(Routes.INTERNAL_REFER_PROGRAM);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(05.0),
                              child: Card(
                                elevation: 05,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              'assets/refer.png',
                                              height: 20,
                                              width: 20,
                                              color: Colors.red,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text_widget(
                                              Simpletext: 'Refer',
                                              fontSize: 14.0,
                                            )),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              print('---------------');
                              Get.toNamed("/about");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(05.0),
                              child: Card(
                                elevation: 05,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 4,
                                            child: Icon(
                                              Icons.error_outline,
                                              color: ColorValues.kRedColor,
                                            )),
                                        Expanded(
                                            flex: 4,
                                            child: Text_widget(
                                              Simpletext: 'About',
                                              fontSize: 14.0,
                                            )),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.CONTECT_US);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(05.0),
                              child: Card(
                                elevation: 05,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              'assets/images/phone.png',
                                              height: 20,
                                              width: 20,
                                              color: Colors.red,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text_widget(
                                              Simpletext: 'Contact us',
                                              fontSize: 14.0,
                                            )),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(05.0),
                            child: GestureDetector(
                              onTap: () {
                                my_local_service.logout();
                              },
                              child: Card(
                                elevation: 05,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              'assets/images/power-off.png',
                                              height: 20,
                                              width: 20,
                                              color: Colors.red,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text_widget(
                                              Simpletext: 'Logout',
                                              fontSize: 14.0,
                                            )),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(05.0),
                            child: GestureDetector(
                              onTap: () {
                                // my_local_service.logout();
                              },
                              child: Card(
                                elevation: 05,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 2,
                                            child: Image.asset(
                                              'assets/images/delete_user.png',
                                              height: 20,
                                              width: 20,
                                              color: Colors.red,
                                            )),
                                        Expanded(
                                            flex: 2,
                                            child: Text_widget(
                                              Simpletext: 'Account Delete',
                                              fontSize: 14.0,
                                            )),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: GestureDetector(
                            onTap: () {
                              print('---------------');
                              // Get.toNamed(Routes.INTERNAL_REFER_PROGRAM);
                              Get.toNamed("/other-activities");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(05.0),
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Container(
                                    height: 90,
                                    width: 90,
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 6,
                                            child: Icon(
                                              Icons.arrow_right_alt,
                                              color: ColorValues.kRedColor,
                                              size: 40,
                                            )),
                                        Expanded(
                                            flex: 6,
                                            child: Text_widget(
                                              textAlign: TextAlign.center,
                                              Simpletext: 'Other\nActivities',
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){},
                                child: Image.asset(
                                  "assets/images/icons8-facebook-250.png",
                                  height: 30,
                                ),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              InkWell(
                                onTap: (){},
                                child: Image.asset(
                                  "assets/images/icons8-instagram-logo-96.png",
                                  height: 23,
                                ),
                              ),
                              SizedBox(
                                width: 18,
                              ),
                              InkWell(
                                onTap: (){},
                                child: Image.asset(
                                  "assets/images/icons8-youtube-250.png",
                                  height: 32,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: InkWell(
                              onTap: () {
                                Get.toNamed("/termand-condition");
                              },
                              child: Text(
                                'Terms and conditions',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300,
                                    color: ColorValues.kRedColor,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Version 1.0.0",
                              style: TextStyle(
                                  fontSize: 12.5,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                // color: Colors.black,
              ),
            ],
          ),
        ));
  }
}
