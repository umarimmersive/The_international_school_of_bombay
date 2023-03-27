import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/Text.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/textEnter.dart';
import '../controllers/events_controller.dart';


class EventsView extends GetView<EventsController> {
  const EventsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(()=>
           SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Appbaar(
                  screen_name: controller.screen_name.toUpperCase(),
                  Search_ontap: (){

                  },
                  Back_ontap: (){
                    Get.back(

                    );

                  },

                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(width: 300,);
                        });
                  },
                  child: Obx(()=>
                     Container(
                      height: MediaQuery.of(context).size.height/16,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: (){
                              if(controller.is_bool[i]==false){
                                controller.is_bool[i]=true;
                              }

                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 00.0,vertical: 00),
                              child:
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TextFieldShowCOLOR(
                                      color: controller.is_bool[i]==false? ColorValues.MIDIUM_LITE_TEXT: Color(ColorValues.RED),
                                      fontsize: 16.0,
                                      text: '${controller.data[i]['date']}',
                                      height: 1.0,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0,top: 04),
                                    child: TextFieldShowCOLOR(
                                      color:controller.is_bool[i]==false? ColorValues.MIDIUM_LITE_TEXT: Color(ColorValues.RED),
                                      fontsize: 16.0,
                                      text: '${controller.data[i]['title']}',
                                      height: 1.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10),
                  child: Divider(color: ColorValues.DIVIDER_COLOR_ONE),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,bottom: 05,top: 00),
                  child: Text_widget(
                    color: ColorValues.BLACK_TEXT,
                    fontSize: 14.0,
                    Simpletext: '35 Photos',
                    height: 1.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Roboto',
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    physics: ScrollPhysics(),
                     scrollDirection: Axis.vertical,
                     crossAxisCount: 2,
                     crossAxisSpacing: 10.0,
                     mainAxisSpacing: 10.0,
                     shrinkWrap: true,
                     children: List.generate(20, (index) {
                        return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/gallery.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                    BorderRadius.all(Radius.circular(20.0),),
                  ),
              ),
            );
          },),
      ),
                ),


              ],),
          ),
        )
    );
  }
}
