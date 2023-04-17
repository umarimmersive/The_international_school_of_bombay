import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/Text_widget.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../controllers/hoppiness_controller.dart';

class HoppinessView extends GetView<HoppinessController> {
  const HoppinessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Happenings',icon_button: false),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.sport_image_data.length,
                  itemBuilder: (BuildContext, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                              'assets/only_logo.png'),
                                        ),
                                        radius: 20,
                                        backgroundColor: ColorValues.BLACK,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text_widget(
                                              fontSize: 14.0,
                                              Simpletext:
                                                  'The International School Of Bombay',
                                              height: 1.0,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto',
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text_widget(
                                                fontSize: 14.0,
                                                Simpletext: '12-jan-2023',
                                                height: 1.0,
                                                fontWeight: FontWeight.w300,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.more_vert_rounded))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red,
                            height: MediaQuery.of(context).size.height / 3,
                            child: Image.asset(
                              "${controller.sport_image_data[index]}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 3.5),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Image.asset(
                                    'assets/love.png',
                                    height: 25,
                                    width: 25,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text_widget(
                                      Simpletext: '1',
                                      fontSize: 20.0,
                                      color: ColorValues.BLACK),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.mode_comment_outlined))
                              ],
                            ),
                          ),
                          Divider(
                            color: ColorValues.DIVIDER_COLOR_ONE,
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
