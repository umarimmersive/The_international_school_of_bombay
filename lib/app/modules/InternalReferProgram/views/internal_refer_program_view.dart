import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../../../utils/global_widgets/buttons.dart';
import '../../../utils/global_widgets/textfield_ui.dart';
import '../controllers/internal_refer_program_controller.dart';

class InternalReferProgramView extends GetView<InternalReferProgramController> {
  InternalReferProgramView({Key? key}) : super(key: key);
  TabController? _tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,

          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Text(
                "Internal Referral",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "My Refer",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15),
              )
              // Add Tabs here
            ],
          ),
          title: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back)),
              Text(
                "Internal Referral Program",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lato',
                ),
              ),
            ],
          ),
          // title: const Text('Internal Refer Program'),
          backgroundColor: ColorValues.kRedColor,
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),

          //dragStartBehavior: DragStartBehavior.down,

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Text_widget(
                        fontSize: 17.0,
                        Simpletext: 'My Details',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: 'Full Name',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Enter your full name",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: "Father's Name",
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Enter your father name",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: 'Class Name',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Enter your class name",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: 'Mobile Number',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Enter your mobile number",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),

                    //for reffer details------------------------------------

                    Text_widget(
                      fontSize: 17.0,
                      Simpletext: 'Referrer Details',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: 'Name of referral student',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 70,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Enter your friend's name",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: "Father's Name",
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Enter your father's name",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: "Mother's Name",
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Enter your mother's name",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: 'Class to which admission to sought',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Class to which admission to sought",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: 'Mobile Number 1',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Enter your friend's mobile number 1",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: 'Mobile Number 2',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Enter your friend's mobile number 2",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    Text_widget(
                      fontSize: 14.0,
                      Simpletext: 'Address',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),

                    TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "Your friend's address",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),

                    RoundedFilledButton(
                      label: 'Submit',
                      color: Color(ColorValues.RED),
                      height: 45,
                      width: double.infinity,
                      fontSize: 14,
                      ontap: () {
                        // Get.to(DeshboardScreenView());
                        //Get.toNamed(Routes.DESHBOARD_SCREEN);
                      },
                    ),
                  ],
                ),
              ),
            ),

            // my refer=============================================================//
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext, index) {
                          return Obx(() => controller.fordetails.value != false
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: InkWell(
                                    onTap: () {
                                      controller.fordetails.value = false;
                                    },
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 18,
                                            bottom: 18),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 16.0,
                                                  Simpletext: "Name",
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 16.0,
                                                  Simpletext: 'Rakesh Singh',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.red,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Referral ID.',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: '6658985478',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Class',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Class I',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Father Name',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Mohan Singh',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Student Mobile',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: '9691854585',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              color: Colors.red,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Referrer Name',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Rohit Sharma',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Referrer Class',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Class IV',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext:
                                                      'Referrer Father Name',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Ajay Sharma',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext:
                                                      'Referrer Mother Name',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: 'Rinki Sharma',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext:
                                                      'Referrer Mobile Number 1',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: '8296458795',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext:
                                                      'Referrer Mobile Number 2',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: '7284789645',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: InkWell(
                                    onTap: () {
                                      controller.fordetails.value = true;
                                    },
                                    child: Card(
                                      margin: EdgeInsets.zero,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8,
                                            right: 8,
                                            top: 18,
                                            bottom: 18),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text_widget(
                                                  fontSize: 16.0,
                                                  Simpletext: "Name",
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                ),
                                                Text_widget(
                                                  fontSize: 16.0,
                                                  Simpletext: 'Rakesh Singh',
                                                  height: 1.0,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ));
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
