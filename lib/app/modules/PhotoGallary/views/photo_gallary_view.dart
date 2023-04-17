import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../routes/app_pages.dart';
import '../../PhotoView/views/photo_view_view.dart';
import '../controllers/photo_gallary_controller.dart';

class PhotoGallaryView extends GetView<PhotoGallaryController> {
  const PhotoGallaryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Events'),
        body: Scaffold(
          extendBody: true,
          body: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Scrollbar(
                      child: GridView.custom(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15.0, bottom: 5.0),
                        gridDelegate: SliverQuiltedGridDelegate(
                          crossAxisCount: 4,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          repeatPattern: QuiltedGridRepeatPattern.inverted,
                          pattern: const [
                            QuiltedGridTile(2, 2),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 1),
                            QuiltedGridTile(1, 2),
                          ],
                        ),
                        childrenDelegate: SliverChildBuilderDelegate(
                            childCount: controller.images.length,
                            (context, index) {
                          int itemCount = controller.images.length;
                          int reversedIndex = itemCount - 1 - index;
                          return InkWell(
                              onTap: () {
                                Get.to(
                                    PhotoViewView(
                                      photos: controller.images,
                                      index: index,
                                    ),
                                    transition: Transition.zoom);
                              },
                              child: Image.asset(
                                controller.images[index],
                                fit: BoxFit.cover,
                              ));
                        }),
                      ),
                    ),
                  ),
                ],
              ),
              // ValueListenableBuilder<bool>(
              //   valueListenable: loader,
              //   builder: (_, bool loading, __) {
              //     return Visibility(
              //       visible: loading,
              //       child: const Align(
              //         alignment: Alignment.center,
              //         child: Loading(),
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        ));
  }
}
// class Imagepath {
//   String path;
//   dynamic isSelected;
//
//   Imagepath({
//     required this.path,
//     required this.isSelected,
//   });
// }
