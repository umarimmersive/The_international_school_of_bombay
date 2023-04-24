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

class PhotoGallaryView extends StatefulWidget {
  String? gallery_id;
  String? title;
   PhotoGallaryView({Key? key,this.gallery_id,this.title}) : super(key: key);

  @override
  State<PhotoGallaryView> createState() => _PhotoGallaryViewState();
}

class _PhotoGallaryViewState extends State<PhotoGallaryView> {


  final  isLastPage=false.obs;
  final pageNumber=1.obs;
  final error= false.obs;
  final loading=false.obs;
  final numberOfPostsPerRequest = 21.obs;
  final posts= [].obs;
  final nextPageTrigger = 3.obs;

  @override
  void initState() {
    pageNumber.value = 1;
    // posts.value = [];
    isLastPage.value = false;
    loading.value = true;
    error.value = false;



    Get_PhotoVideoGallery();

    // TODO: implement initState
    super.initState();
  }


  final PhotoGalleryDetails = <PhotoGalleryDetailsModel>[].obs;
  final isLoading=false.obs;


  Future Get_PhotoVideoGallery() async {
    try {
      print('--------------------------------${pageNumber.value}');
      print('--------------------------------${widget.gallery_id}');
      //isLoading(true);
      PhotoGalleryDetails.clear();
      var response = await ApiService()
          .Photo_Gallery_details(gallery_id: widget.gallery_id,page: pageNumber.value);
      if (response['status'] == true) {

        print('reponce---------vjvjgv-----------${response}');

        List dataList = response['data'].toList();
        PhotoGalleryDetails.value = dataList.map((json) => PhotoGalleryDetailsModel.fromJson(json)).toList();
        posts.addAll(PhotoGalleryDetails);

        isLastPage.value = PhotoGalleryDetails.length < numberOfPostsPerRequest.value;
        setState(() {
          loading.value = false;
        });
        pageNumber.value = pageNumber.value + 1;

       setState(() {

       });
      } else if (response['status'] == false) {

       // isLoading(false);

      }
    } finally {
     // isLoading(false);

    }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Events'),
        body:
        Obx((){
          if(isLoading.isTrue){
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          }else{
            return  Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: posts.length + (isLastPage.value ? 0 : 1),
                    itemBuilder: (context, index) {

                      if (index == posts.length - nextPageTrigger.value) {
                        print('--------------------------------print');
                        //controller.Update();
                        Future.delayed(Duration.zero, () async {
                          Get_PhotoVideoGallery();
                        });

                      }

                      if (index == posts.length) {
                        if (error.value) {
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

                      if (index == posts.length) {
                        if (error.value) {
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
                                  photos: posts,
                                  index: index,
                                ),
                                transition: Transition.zoom);
                          },
                          child: CachedNetworkImage(
                            imageUrl:
                            ApiService.IMAGE_URL+posts[index].item_value!,
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
                        QuiltedGridTile(2, 1),
                        QuiltedGridTile(1, 1),
                        QuiltedGridTile(1, 2),
                      ],
                    ),
                   /* gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
