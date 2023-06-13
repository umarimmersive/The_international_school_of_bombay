import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/api_service.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../models/Photo_Gallery_Model.dart';
import '../../PhotoView/views/photo_view_view.dart';
import '../controllers/photo_gallary_controller.dart';

class PhotoGallaryView extends GetView<PhotoGallaryController>  {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: controller.title.value),
        body:
        Obx(() {
          if (controller.isLoading.isTrue) {
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          } else {
            return
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.posts.length + (controller.isLastPage.value ? 0 : 1),
                      itemBuilder: (context, index) {

                        if (index == controller.posts.length - controller.nextPageTrigger.value) {
                          print('--------------------------------print');
                          //controller.Update();
                         /* Future.delayed(Duration.zero, () async {
                            controller.Get_PhotoVideoGallery();
                          });*/
                          controller.Get_PhotoVideoGallery();
                        }

                        if (index == controller.posts.length) {
                          if (controller.error.value) {
                            return Center(
                                child: Container()
                            );
                          } else {
                            return const Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CircularProgressIndicator(),
                                ));
                          }
                        }

                        if (index == controller.posts.length) {
                          if (controller.error.value) {
                            return Center(
                                child: Container(
                                  child: Text('errore'),
                                )
                            );
                          } else {
                            return Container(
                              color: Colors.white,
                              child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    // child: CircularProgressIndicator(),
                                  )),
                            );
                          }
                        }
                        return InkWell(
                            onTap: () {
                              print('-------------app');
                              Get.to(
                                  PhotoViewView(
                                    photos: controller.posts.value,
                                    index: index,
                                  ),
                                  transition: Transition.zoom);
                            },
                            child: CachedNetworkImage(
                              imageUrl:
                              ApiService.IMAGE_URL+controller.posts[index].itemValue,
                              fit: BoxFit.cover,
                            ));
                        //.... the reminder of your code
                      },
                      gridDelegate: SliverQuiltedGridDelegate(
                        crossAxisCount: 4,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                        repeatPattern: QuiltedGridRepeatPattern.inverted,
                        pattern: const [
                          QuiltedGridTile(1, 2),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 1),
                          QuiltedGridTile(1, 2),
                        ],
                      ),
                      /*  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),*/
                    ),
                  ),
                ],
              );
          }
        })






    );
  }
}



/*class PhotoGallaryView extends GetView<PhotoGallaryController> {
  const PhotoGallaryView({Key? key}) : super(key: key);

}*/
// class Imagepath {
//   String path;
//   dynamic isSelected;
//
//   Imagepath({
//     required this.path,
//     required this.isSelected,
//   });
// }
