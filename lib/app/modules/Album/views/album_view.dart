import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/Text_widget.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/album_controller.dart';

class AlbumView extends GetView<AlbumController> {
  const AlbumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar('Image Gallery'),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GridView.builder(
                    itemCount: controller.sport_image_data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3.9 / 3.5,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 00,
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 0, bottom: 3),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PHOTO_GALLARY);
                          },
                          child: Container(
                            height: 140,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 120,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(2),
                                      child: Image.asset(
                                        "${controller.sport_image_data[index]}",
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(controller.albamname[index],
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w300))
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ));
  }
}
