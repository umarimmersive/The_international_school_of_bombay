import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker_widget/image_picker_widget.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/buttons.dart';
import '../../../utils/global_widgets/textfield_ui.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: appbar('Edit Profile'),
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 00),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: ImagePickerWidget(
                          diameter: 100,
                          iconAlignment: Alignment.bottomRight,
                          isEditable: true,
                          initialImage: "https://freepngimg.com/thumb/man/22654-6-man-thumb.png",
                        )),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text_widget(
                      color: ColorValues.BLACK_TEXT,
                      fontSize: 14.0,
                      Simpletext: 'First Name'.toUpperCase(),
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
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Enter Your First Name",
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
                      color: ColorValues.BLACK_TEXT,
                      fontSize: 14.0,
                      Simpletext: 'Last Name'.toUpperCase(),
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
                            fontSize: 14,
                            maxLength: 50,
                            hintText: "Enter Your Last Name",
                            hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            readOnly: false,
                            keyboardType: TextInputType.text,
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
                      color: ColorValues.BLACK_TEXT,
                      fontSize: 14.0,
                      Simpletext: 'Class'.toUpperCase(),
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
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text_widget(
                      color: ColorValues.BLACK_TEXT,
                      fontSize: 14.0,
                      Simpletext: 'Phone Number'.toUpperCase(),
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
                            fontSize: 14,
                            maxLength: 50,
                            hintText: "Enter Your Phone Number",
                            hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            readOnly: false,
                            keyboardType: TextInputType.text,
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
                      color: ColorValues.BLACK_TEXT,
                      fontSize: 14.0,
                      Simpletext: 'Date Of Birth'.toUpperCase(),
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
                            fontSize: 14,
                            maxLength: 50,
                            hintText: "Enter Your DOB",
                            hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            readOnly: false,
                            keyboardType: TextInputType.text,
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
                      color: ColorValues.BLACK_TEXT,
                      fontSize: 14.0,
                      Simpletext: 'Father Name'.toUpperCase(),
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
                            fontSize: 14,
                            maxLength: 50,
                            hintText: "Enter Your Father Name",
                            hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            readOnly: false,
                            keyboardType: TextInputType.text,
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
                      color: ColorValues.BLACK_TEXT,
                      fontSize: 14.0,
                      Simpletext: 'mother name'.toUpperCase(),
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
                            fontSize: 14,
                            maxLength: 50,
                            hintText: "Enter Your Mother Name",
                            hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            readOnly: false,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/25),
                  RoundedFilledButton(
                    label: 'Submit',
                    color: Color(ColorValues.RED),
                    height: 45,
                    width: double.infinity,
                    fontSize: 14,
                    ontap: (){
                      // Get.to(DeshboardScreenView());
                     //s Get.toNamed(Routes.DESHBOARD_SCREEN);
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          )
      );
    }
  }

