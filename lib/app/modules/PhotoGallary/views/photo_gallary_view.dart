import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text.dart';
import '../../PhotoView/views/photo_view_view.dart';
import '../controllers/photo_gallary_controller.dart';

class PhotoGallaryView extends GetView<PhotoGallaryController> {
  const PhotoGallaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Wallpapers'),
      /*  appBar: AppBar(
          title: const GlobalLocalText(
            text: 'wallpapers',
          ),
          centerTitle: false,
        ),*/
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: MasonryGridView.builder(
                    clipBehavior: Clip.hardEdge,
                    addSemanticIndexes: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.photos.length,
                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(0.5),
                        child: InkWell(
                          onTap: () {
                          /*  var data={
                              "photo":controller.photos.toString(),
                              "index": index.toString()
                            };

                            Get.toNamed(Routes.PHOTO_VIEW,parameters: data);*/

                             Get.to(
                                 PhotoViewView(
                                  photos: controller.photos,
                                  index: index,
                                ),
                                transition: Transition.zoom);

                          },
                          child: Hero(
                            tag: controller.photos[index].path,
                            child: CachedNetworkImage(
                              imageUrl: controller.photos[index].path,
                              fit: BoxFit.cover,
                              placeholder: ((context, url) => Container(
                                color: Colors.grey,
                              )),
                              errorWidget: ((context, url, error) => Container(
                                color: Colors.red.shade400,
                              )),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }

}
class Imagepath {
  String path;
  dynamic isSelected;

  Imagepath({
    required this.path,
    required this.isSelected,
  });
}