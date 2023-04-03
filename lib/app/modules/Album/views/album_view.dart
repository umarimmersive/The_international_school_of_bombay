import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/ColorValues.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/album_controller.dart';

class AlbumView extends GetView<AlbumController> {
  const AlbumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar('Gallery'),
        body: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: GridView.builder(
                  itemCount: controller.sport_image_data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 00, crossAxisCount: 2
                  ), itemBuilder: (BuildContext, index){

                return Padding(
                  padding: const EdgeInsets.only(top:15,bottom: 3),
                  child: InkWell(
                    onTap: (){
                      Get.toNamed(Routes.PHOTO_GALLARY);
                    },
                    child: Container(
                      //height: 140,
                      child: Column(
                         mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(1),
                              child: Image.asset("${controller.sport_image_data[index]}",fit: BoxFit.fill,)),
                          SizedBox(height: 5,),
                          Text(controller.albamname[index],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                );


              }),
            ),
          )

        ],)
    );
  }
}
