import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/buttons.dart';
import '../../../utils/global_widgets/textfield_ui.dart';
import '../controllers/leaves_screen_controller.dart';

class LeavesScreenView extends GetView<LeavesScreenController> {
  LeavesScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,

            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Apply Leave",
                    style:
                        TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Leave Status",
                    style:
                        TextStyle(fontSize: 15, overflow: TextOverflow.ellipsis),
                  ),
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
                Flexible(
                  child: Text(
                    "Leave ( Apply Leave and Leave Status )",
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ],
            ),
            // title: const Text('Internal Refer Program'),
            backgroundColor: ColorValues.kRedColor,
          ),
          body: TabBarView(
            // physics: BouncingScrollPhysics(),

            //dragStartBehavior: DragStartBehavior.down,

            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),

                      Text_widget(
                        fontSize: 14.0,
                        Simpletext: 'Student Name',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 70,
                      ),

                      TextFieldDesigned(
                        controller: controller.name,
                        maxLines: 2,
                        fontSize: 14,
                        maxLength: 50,
                        minLines: 1,
                        hintText: "Enter your Full Name",
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
                        Simpletext: 'Father Name',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),

                      TextFieldDesigned(
                        controller: controller.fathername,
                        maxLines: 2,
                        fontSize: 14,
                        maxLength: 50,
                        minLines: 1,
                        hintText: "Enter your Father name",
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
                        Simpletext: 'Class & Section Name',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),

                      TextFieldDesigned(
                        controller: controller.Class,
                        maxLines: 2,
                        fontSize: 14,
                        maxLength: 50,
                        minLines: 1,
                        hintText: "Enter your Class & Section Name",
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
                        Simpletext: 'Select Your Leave Start & End Date',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),

                      Obx(() => Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () => controller.dateString(context),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: ColorValues.kRedColor)),
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          controller.startDate.value.isEmpty
                                              ? Text(
                                                  "Start Date",
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                )
                                              : Text(
                                                  controller.startDate.value),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () => controller.dateStringg(context),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: ColorValues.kRedColor)),
                                    height: 50,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        children: [
                                          controller.endDate.value.isEmpty
                                              ? Text(
                                                  "End Date",
                                                  style: TextStyle(
                                                      fontFamily: "robo",
                                                      color: Colors.grey),
                                                )
                                              : Text(controller.endDate.value),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),

                      Text_widget(
                        fontSize: 14.0,
                        Simpletext: 'Reason For Leave',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ColorValues.kRedColor)),
                        child: RadioListTile(
                          activeColor: Colors.red,
                          // tileColor: Colors.red[100],
                          title: Text("Sick Leave"),
                          value: "Sick Leave",
                          groupValue: controller.gender.value,
                          onChanged: (value) {
                            controller.gender.value = value.toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ColorValues.kRedColor)),
                        child: RadioListTile(
                          activeColor: Colors.red,
                          // tileColor: Colors.red[100],
                          title: Text("Emergency Leave"),
                          value: "Emergency Leave",
                          groupValue: controller.gender.value,
                          onChanged: (value) {
                            controller.gender.value = value.toString();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ColorValues.kRedColor)),
                        child: RadioListTile(
                          // tileColor: Colors.red[100],
                          activeColor: Colors.red,
                          title: Text("Other"),
                          value: "other",
                          groupValue: controller.gender.value,
                          onChanged: (value) {
                            controller.gender.value = value.toString();
                          },
                        ),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),
                      Text_widget(
                        fontSize: 14.0,
                        Simpletext: 'Enter Other Reason For Leave',
                        height: 1.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),

                      TextFormField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                left: 20, top: 20, bottom: 10, right: 5),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorValues.kRedColor)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: ColorValues.kRedColor)),
                            hintText: "Enter Your Leave Reason",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: ColorValues.DIVIDER_COLOR_ONE,
                                fontSize: 14),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                    width: 2, color: ColorValues.kRedColor))),
                      ),

                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),

                      //for reffer details------------------------------------

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
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                    ],
                  ),
                ),
              ),

              // Leave status=============================================================//
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
                            return Obx(() => controller.fordetails.value !=
                                    false
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
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 14.0,
                                                      Simpletext: 'Class & Sec',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 14.0,
                                                      Simpletext:
                                                          'Class I (Section B)',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
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
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 14.0,
                                                      Simpletext: 'Father Name',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 14.0,
                                                      Simpletext: 'Mohan Singh',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
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
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 14.0,
                                                      Simpletext:
                                                          'Leave Start Date',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 14.0,
                                                      Simpletext: '25/04/2023',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
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
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 14.0,
                                                      Simpletext:
                                                          'Leave End Date',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 14.0,
                                                      Simpletext: '29/04/2023',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
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
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 14.0,
                                                      Simpletext:
                                                          'Reason For Leave',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 14.0,
                                                      Simpletext: 'Sick Leave',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                color: Colors.red,
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 15.0,
                                                      Simpletext:
                                                          'Leave Status',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Roboto',
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 15.0,
                                                      Simpletext: 'Approved',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Roboto',
                                                    ),
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
                                                  Flexible(
                                                    child: Text_widget(
                                                      fontSize: 16.0,
                                                      Simpletext:
                                                          'Rakesh Singh',
                                                      height: 1.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Roboto',
                                                    ),
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
      ),
    );
  }
}
