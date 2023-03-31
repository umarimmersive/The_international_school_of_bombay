import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/appBar.dart';
class MenuView extends GetView<MenuController> {
  const MenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: appbar('Menu'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height/3.2,
                  color: Color(ColorValues.RED),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     /* Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Appbaar(
                          screen_name: 'Menu'.toUpperCase(),
                          Back_ontap: (){
                            Get.back();
                          },
                        ),
                      ),*/
                      SizedBox(
                        height: 10,
                      ),
                    /*  userData!.profileImage!="null"?
                      //FileImage(File(path))
                      imageFile==null?*/
                     /* Padding(
                        padding: const EdgeInsets.only(bottom: 50, left: 14, top: 10),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[100],
                          child:  CircleAvatar(
                            radius: 55,
                            backgroundImage: NetworkImage(
                                'https://ndn.manageprojects.in/'+userData!.profileImage),
                          ),
                        ),
                      ):
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50, left: 14),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Colors.grey[100],
                          child:  CircleAvatar(
                            radius: 55,
                            backgroundImage: FileImage(imageFile!),
                          ),
                        ),
                      )
                          :*/
                      Padding(
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
                      ),

                     /* Edit_profile_Switch==true?
                      Positioned(
                        bottom: 60,
                        left: 100,
                        child: Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: IconButton(
                              onPressed: () {
                                //getFromGallery();
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.black,
                              )),
                        ),
                      ):
                      SizedBox(),*/


                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text_widget(Simpletext: 'Umar Mansuri', fontSize: 16.0, color: ColorValues.WHITE_COLORE,fontWeight: FontWeight.bold),
                            Container(height: 3),
                            Text_widget(Simpletext: 'Mansuriumar89@gmail.com', fontSize: 14.0, color: ColorValues.WHITE_COLORE),


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
                        fit: BoxFit.cover, image: NetworkImage('Path to your image')),
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(top: 190),
                 child: Column(
                   children: [
                     Row(
                       children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
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
                                         child: Image.asset('assets/images/user.png',height: 20,width: 20,color: Colors.red,)
                                     ),
                                     Expanded(
                                         flex: 2,
                                         child: Text_widget(Simpletext: 'Edit Profile', fontSize: 14.0,color: Colors.black,)
                                     ),
                                   ],
                                 )
                               ),
                             ),
                         ),
                          ),
                         ),
                         Expanded(
                           child: GestureDetector(
                             onTap: (){
                               //Get.toNamed(Routes.PHOTO_GALLARY);
                               Get.toNamed(Routes.ALBUM);
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
                                             child: Image.asset('assets/images/image.png',height: 20,width: 20,color: Colors.red,)
                                         ),
                                         Expanded(
                                             flex: 2,
                                             child: Text_widget(Simpletext: 'Images', fontSize: 14.0,color: Colors.black,)
                                         ),
                                       ],
                                     )
                                 ),
                               ),
                             ),
                           ),
                         ),
                         Expanded(
                           child: GestureDetector(
                             onTap: (){
                               Get.toNamed(Routes.VIDEO_GALLARY);
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
                                             child: Image.asset('assets/images/videocamera.png',height: 20,width: 20,color: Colors.red,)
                                         ),
                                         Expanded(
                                             flex: 2,
                                             child: Text_widget(Simpletext: 'Videos', fontSize: 14.0,color: Colors.black,)
                                         ),
                                       ],
                                     )
                                 ),
                               ),
                             ),
                           ),
                         ),
                     ],),
                     Row(
                       children: <Widget>[
                         Expanded(
                           child: GestureDetector(
                             onTap: (){
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
                                             child: Image.asset('assets/images/campus.png',height: 20,width: 20,color: Colors.red,)
                                         ),
                                         Expanded(
                                             flex: 2,
                                             child: Text_widget(Simpletext: 'Our Campus', fontSize: 14.0,color: Colors.black,)
                                         ),
                                       ],
                                     )
                                 ),
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
                                           child: Image.asset('assets/images/light-bulb.png',height: 20,width: 20,color: Colors.red,)
                                       ),
                                       Expanded(
                                           flex: 2,
                                           child: Text_widget(Simpletext: 'Our Philosypher', fontSize: 14.0,color: Colors.black,)
                                       ),
                                     ],
                                   )
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
                                           child: Image.asset('assets/images/rating.png',height: 20,width: 20,color: Colors.red,)
                                       ),
                                       Expanded(
                                           flex: 2,
                                           child: Text_widget(Simpletext: 'Rate Us', fontSize: 14.0,color: Colors.black,)
                                       ),
                                     ],
                                   )
                               ),
                             ),
                           ),
                         ),
                       ],),
                     Row(
                       children: <Widget>[
                         Expanded(
                           child: GestureDetector(
                             onTap: (){
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
                                             child: Image.asset('assets/refer.png',height: 20,width: 20,color: Colors.red,)
                                         ),
                                         Expanded(
                                             flex: 2,
                                             child: Text_widget(Simpletext: 'Refer', fontSize: 14.0,color: Colors.black,)
                                         ),
                                       ],
                                     )
                                 ),
                               ),
                             ),
                           ),
                         ),
                         Expanded(
                           child: GestureDetector(
                             onTap: (){
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
                                             child: Image.asset('assets/images/phone.png',height: 20,width: 20,color: Colors.red,)
                                         ),
                                         Expanded(
                                             flex: 2,
                                             child: Text_widget(Simpletext: 'Contect Us', fontSize: 14.0,color: Colors.black,)
                                         ),
                                       ],
                                     )
                                 ),
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
                                           child: Image.asset('assets/images/power-off.png',height: 20,width: 20,color: Colors.red,)
                                       ),
                                       Expanded(
                                           flex: 2,
                                           child: Text_widget(Simpletext: 'Logout', fontSize: 14.0,color: Colors.black,)
                                       ),
                                     ],
                                   )
                               ),
                             ),
                           ),
                         ),
                       ],),

                   ],
                 ),
                 // color: Colors.black,
                )
              ],),
          ),
        )
    );
  }
}
