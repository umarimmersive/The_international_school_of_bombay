import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../../PhotoGallary/views/photo_gallary_view.dart';

class PhotoViewView extends GetView<PhotoViewController> {
  final List? photos;
  final int? index;
  const PhotoViewView({Key? key, this.photos, this.index}) : super(key: key);
  // void saveimage(index) async {
  //  // await GallerySaver.saveImage(photos![index!].path);
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: PhotoViewGallery.builder(
        builder: (BuildContext context, int index) =>
            PhotoViewGalleryPageOptions.customChild(
                minScale: PhotoViewComputedScale.covered,
                heroAttributes: PhotoViewHeroAttributes(tag: photos![index]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height/2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Image.asset(
                          photos![index],
                        ),
                      ),

                    ),
                  ],
                )),
        pageController: PageController(initialPage: index!),
        enableRotation: false,
        itemCount: photos!.length,
      ),
    );
  }
}
