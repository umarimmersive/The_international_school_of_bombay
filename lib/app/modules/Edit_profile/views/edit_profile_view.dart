import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_widget/image_picker_widget.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/buttons.dart';
import '../../../utils/global_widgets/globle_var.dart';
import '../../../utils/global_widgets/textfield_ui.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'My Profile'),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 00),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 2,
                                offset: Offset(0.5, 0.5))
                          ],
                        ),
                        child: ClipOval(
                          child:  Center(
                            child: Text_widget(
                              Simpletext: userData!.full_name
                                  .toString()
                                  .substring(0, 1) +
                                  userData!.lastname
                                      .toString()
                                      .substring(0, 1),
                              fontSize: 18.0,
                              maxLines: 1,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    //     ImagePickerWidget(
                    //     diameter: 100,
                    //     iconAlignment: Alignment.bottomRight,
                    //     isEditable: true,
                    //     initialImage: "https://freepngimg.com/thumb/man/22654-6-man-thumb.png",
                    // )
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text_widget(
                    fontSize: 15.0,
                    Simpletext: 'First Name',
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
                    controller: controller.firstName,
                    maxLines: 2,
                    fontSize: 14,
                    maxLength: 50,
                    minLines: 1,
                    hintText: "Enter Your First Name",
                    hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    readOnly: true,
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text_widget(
                    fontSize: 15.0,
                    Simpletext: 'Last Name',
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
                          controller: controller.lastName,
                          fontSize: 14,
                          maxLength: 50,
                          hintText: "Enter Your Last Name",
                          hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
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
                    fontSize: 15.0,
                    Simpletext: 'Class',
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
                          controller: controller.classController,
                          fontSize: 14,
                          maxLength: 50,
                          hintText: "Enter Your Class",
                          hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
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
                          controller: controller.phone,
                          fontSize: 14,
                          maxLength: 50,
                          hintText: "Enter Your Phone Number",
                          hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
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

                    fontSize: 14.0,
                    Simpletext: 'Date Of Birth',
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
                          controller: controller.dob,
                          fontSize: 14,
                          maxLength: 50,
                          hintText: "Enter Your DOB",
                          hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
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
                    fontSize: 14.0,
                    Simpletext: "Father's Name",
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
                          controller: controller.fatherName,
                          fontSize: 14,
                          maxLength: 50,
                          hintText: "Enter Your Father Name",
                          hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
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
                    fontSize: 14.0,
                    Simpletext: "Mother's Name",
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
                          controller: controller.motherName,
                          fontSize: 14,
                          maxLength: 50,
                          hintText: "Enter Your Mother Name",
                          hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          readOnly: true,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 25),

                Row(children: [],),

                // RoundedFilledButton(
                //   label: 'Save',
                //   color: Color(ColorValues.RED),
                //   height: 45,
                //   width: double.infinity,
                //   fontSize: 14,
                //   ontap: () {
                //     // Get.to(DeshboardScreenView());
                //     //s Get.toNamed(Routes.DESHBOARD_SCREEN);
                //   },
                // ),
                SizedBox(height: 10),
                // RoundedFilledButton(
                //   label: 'Change Password',
                //   color: Colors.transparent,
                //   height: 45,
                //   width: double.infinity,
                //   labelColor: Color(ColorValues.RED),
                //   fontSize: 14,
                //   ontap: () {
                //      Get.toNamed(Routes.CHANGE_PASSWORD);
                //   },
                // ),
              ],
            ),
          ),
        ));
  }
}
