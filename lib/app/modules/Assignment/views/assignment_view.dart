import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/routes/app_pages.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../controllers/assignment_controller.dart';

class AssignmentView extends GetView<AssignmentController> {
  const AssignmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: 'Assigment'),
        body:Obx((){
           if(controller.isLoading_assignment.isTrue) {
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          }else{
           return SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                /* Appbaar(
                screen_name: 'Assignment'.toUpperCase(),
                Back_ontap: (){
                  Get.back();
                },
              ),
              SizedBox(
                height: 20,
              ),*/
                SizedBox(
                  height: 20,
                ),
                 controller.assignment_List.length != 0
                ?Expanded(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.assignment_List.length,
                    itemBuilder: (BuildContext , i) {
                      return InkWell(
                        onTap: (){
                          var data={
                            "pdf":controller.assignment_List[i].assignment.toString(),
                            "sub":controller.assignment_List[i].title.toString()
                          };
                          Get.toNamed(Routes.PDF_VIEW,parameters: data);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 00.0,vertical: 05),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [

                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Text_widget(
                                            fontSize: 16.0,
                                            Simpletext: '${controller.assignment_List[i].title}',                                              height: 1.0,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto',
                                          ),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 10.0,top: 8),
                                        //   child: Text_widget(
                                        //      fontSize: 12.0,
                                        //     Simpletext: '${controller.data[i]['date']}',
                                        //     height: 1.0,
                                        //     fontWeight: FontWeight.w300,
                                        //     fontFamily: 'Roboto',
                                        //   ),
                                        // ),

                                      ],
                                    ),
                                  ),

                                  Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: const Color(ColorValues.RED),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                            size: 18.0,
                                            semanticLabel: 'Text to announce in accessibility modes',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Divider(
                                  height: 2,
                                  color: ColorValues.DIVIDER_COLOR_ONE,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
                    :Container(
                  height: MediaQuery.of(context).size.height/1.3,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text("No Assignment Found",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,

                        fontWeight: FontWeight.w500,
                        fontFamily: 'Lato',
                      ),),
                  ),
                )

              ],),
          );}
        })
    );
  }
}
