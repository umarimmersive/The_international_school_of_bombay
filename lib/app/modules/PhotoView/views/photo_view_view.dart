import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../../PhotoGallary/views/photo_gallary_view.dart';


class PhotoViewView extends GetView<PhotoViewController> {
  final List<Imagepath>? photos;
  final int? index;
  const PhotoViewView({Key? key,this.photos, this.index}) : super(key: key);
  void saveimage(index) async {
    await GallerySaver.saveImage(photos![index!].path);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appbar(title: 'PhotoView'),
     /* appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),*/
      body:  PhotoViewGallery.builder(
        builder: (BuildContext context, int index) =>
            PhotoViewGalleryPageOptions.customChild(
                minScale: PhotoViewComputedScale.covered,
                heroAttributes: PhotoViewHeroAttributes(tag: photos![index]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: CachedNetworkImage(
                              imageUrl: photos![index].path,
                              placeholder: (context, url) => Container(
                                color: Colors.grey,
                              ),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.red.shade400,
                              ),
                            ),
                          ),
                        ),
                        Obx(() =>     Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        photos![index].isSelected.value = true;
                                      },
                                      child:  CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: photos![index].isSelected.value
                                            ? InkWell(
                                            onTap: () {
                                              photos![index]
                                                  .isSelected.value  = false;
                                            },
                                            child: CircleAvatar(
                                              backgroundColor:
                                              Colors.white,
                                              child: Image.asset(
                                                'assets/heart(1).png',
                                                height: 35,
                                              ),
                                            ))
                                            : Image.asset(
                                          "assets/heart.png",
                                          height: 35,
                                        ),
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.red[100],
                                    child: IconButton(
                                      onPressed: () {
                                        saveimage(index);
                                        Get.snackbar(
                                          'picture downloded',
                                          "Please Chack your Phone Gallery",
                                          icon: Icon(Icons.photo,
                                              color: Colors.black),
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                      },
                                      icon: Icon(Icons.download),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        ) ],
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
