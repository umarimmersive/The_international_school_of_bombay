import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:image_picker_widget/image_picker_widget.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/RedBorderDropdown.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../../../utils/global_widgets/buttons.dart';
import '../../../utils/global_widgets/textfield_ui.dart';
import '../controllers/quiry_screen_controller.dart';

class QuiryScreenView extends GetView<QuiryScreenController> {
  const QuiryScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Query'),
        body:
        Obx((){
          if(controller.isLoading.isTrue){
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          }else{
            return  Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 00),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text_widget(
                        fontSize: 14.0,
                        Simpletext: 'Full Name',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 00,
                          horizontal: MediaQuery.of(context).size.height * 0.00),
                      child: TextFieldDesigned(
                        controller: controller.fullname,
                        maxLines: 2,
                        fontSize: 14,
                        maxLength: 50,
                        minLines: 1,
                        hintText: "Enter Your Full Name",
                        hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        readOnly: false,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text_widget(
                        fontSize: 14.0,
                        Simpletext: 'Class',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 00, vertical: 00),
                      child:
                     /* Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFieldDesigned(
                              controller: controller.Class_c,
                              fontSize: 14,
                              maxLength: 50,
                              hintText: "Enter Your Class",
                              hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              readOnly: false,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),*/
                      RedBorderDropdown(
                        items: ['1st', '2nd', '3rd'],
                        hintText: 'Enter Your Class',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text_widget(
                        fontSize: 14.0,
                        Simpletext: 'Phone Number',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 00, vertical: 00),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: TextFieldDesigned(
                              controller: controller.phone_number,
                              fontSize: 14,
                              maxLength: 12,
                              hintText: "Enter Your Phone Number",
                              hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              readOnly: false,
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text_widget(

                        fontSize: 14.0,
                        Simpletext: 'Your Query',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 80,
                    ),
                    TextFormField(
                      controller: controller.query,
                      maxLines: 7,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 20,top: 20),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorValues.kRedColor)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: ColorValues.kRedColor)),
                          hintText: "Enter Your Query",
                          hintStyle: TextStyle(

                              fontWeight: FontWeight.w300,
                              color: ColorValues.DIVIDER_COLOR_ONE, fontSize: 14),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  width: 2, color: ColorValues.kRedColor))),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 25),
                    RoundedFilledButton(
                      label: 'Submit',
                      color: Color(ColorValues.RED),
                      height: 45,
                      width: double.infinity,
                      fontSize: 14,
                      ontap: () {
                        controller.OnSubmit();
                        // Get.to(DeshboardScreenView());
                        //s Get.toNamed(Routes.DESHBOARD_SCREEN);
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            );
          }
        }
        )


    );
  }
}
