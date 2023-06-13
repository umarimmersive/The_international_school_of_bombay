import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../utils/constants/ColorValues.dart';
import '../../../utils/constants/api_service.dart';
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
      child: Obx(() {
        if (controller.isLoading.isTrue) {
          return Scaffold(
            body: Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                )),
          );
        } else{
          return Scaffold(
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
                    child: Obx(()=> Column(
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
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(40),
                          ],
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
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(40),
                          ],
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
                          Simpletext: 'Class ',
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
                          inputFormatters: [
                            new LengthLimitingTextInputFormatter(10),
                          ],
                          fontSize: 14,
                          maxLength: 50,
                          minLines: 1,
                          hintText: "Enter your Class ",
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


                        InkWell(
                          onTap: (){
                            controller.isSelect.value = "Sick Leave";
                            controller.isotherReason.value = false;
                            controller.reasonforleave.text = controller.isSelect.value;
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: ColorValues.kRedColor)),
                              child: Row(
                                children: [
                                  controller.isSelect.value == "Sick Leave"
                                      ?Icon(
                                    Icons.radio_button_checked,
                                    color: Colors.red,
                                  )
                                      :Icon(
                                    Icons.radio_button_off,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10,),
                                  Text_widget(
                                    fontSize: 16.0,
                                    Simpletext: 'Sick Leave',
                                    height: 1.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                  ),
                                ],
                              )
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            controller.isSelect.value = "Emergency Leave";
                            controller.isotherReason.value = false;
                            controller.reasonforleave.text = controller.isSelect.value;
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: ColorValues.kRedColor)),
                              child: Row(
                                children: [
                                  controller.isSelect.value == "Emergency Leave"
                                      ?Icon(
                                    Icons.radio_button_checked,
                                    color: Colors.red,
                                  )
                                      :Icon(
                                    Icons.radio_button_off,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10,),
                                  Text_widget(
                                    fontSize: 16.0,
                                    Simpletext: 'Emergency Leave',
                                    height: 1.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                  ),
                                ],
                              )
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            controller.isSelect.value = "Other";
                            controller.isotherReason.value = true;
                            controller.reasonforleave.clear();
                          },
                          child: Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: ColorValues.kRedColor)),
                              child: Row(
                                children: [
                                  controller.isSelect.value == "Other"
                                      ?Icon(
                                    Icons.radio_button_checked,
                                    color: Colors.red,
                                  )
                                      :Icon(
                                    Icons.radio_button_off,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 10,),
                                  Text_widget(
                                    fontSize: 16.0,
                                    Simpletext: 'Other',
                                    height: 1.0,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                  ),
                                ],
                              )
                          ),
                        ),


                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),
                        controller.isotherReason.value == true
                            ?Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                              controller: controller.reasonforleave,
                              maxLines: 5,
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(200),
                              ],
                              cursorColor: ColorValues.BG_BT2,
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
                              height: 20,
                            ),
                          ],
                        )
                            :SizedBox(),
                        SizedBox(
                          height: 0,
                        ),

                        Text_widget(
                          fontSize: 14.0,
                          Simpletext: 'Attach File',
                          height: 1.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto',
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 60,
                        ),

                        // atteched file
                        InkWell(
                          onTap: () {
                            controller.getFile();
                          },
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
                                  Icon(Icons.attachment_outlined,color: ColorValues.BG_BT2,),
                                  SizedBox(width: 20,),
                                  controller.docfilename.isEmpty
                                      ? Text(
                                    "Attach file",
                                    style: TextStyle(
                                        color: Colors.grey),
                                  )
                                      : Text(
                                    controller.docfilename
                                        .toString(),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            showModalBottomSheet(
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                                backgroundColor: Colors.white,
                                context: context,
                                builder: (context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 8, bottom: 20),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text_widget(Simpletext: "LEAVE APPLICATIONS RULES -", fontSize: 16.0, color: Color(ColorValues.RED)),
                                              IconButton(
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                  icon: Icon(Icons.cancel_outlined)),
                                            ],
                                          ),

                                          SizedBox(
                                            height: 8,
                                          ),
                                          Text_widget(maxLines: 10, Simpletext: '${
                                              "Parents, please consider carefully the effect on learning and the consequences of asking for leave"
                                                  "during school time. The process of applying for leave is for parents/guardians to write to the"
                                                  "Principal or Mother Teacher well in advance, notifying dates and the reason for absence. A doctor's"
                                                  "certificate is required for absence due to illness for three or more days.\n"
                                                  "\n1. No leaves will be permitted during exams."}', fontSize: 16.0, color: Color(ColorValues.DIVIDER_COL)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text_widget(maxLines: 10, Simpletext: '${
                                              "2. No yearly dispersal will be allowed."}', fontSize: 16.0, color: Color(ColorValues.DIVIDER_COL)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            children: [
                              Text_widget(
                                fontSize: 16.0,
                                Simpletext: 'Leave Application Rules',
                                height: 1.0,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                                color: ColorValues.BG_BT2,
                              ),
                              SizedBox(width: 3,),
                              // Icon(Icons.arrow_forward,color: ColorValues.BG_BT2,size: 18,)
                            ],
                          ),
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
                            controller.OnSubmit();
                            // Get.to(DeshboardScreenView());
                            //Get.toNamed(Routes.DESHBOARD_SCREEN);
                          },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                      ],
                    )),
                  ),
                ),
                // Leave status=============================================================//
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 50,
                    ),
                    controller.LeaveStatusList.length == 0
                        ?Container(
                      height: MediaQuery.of(context).size.height/1.3,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text("No Leaves Apply",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Lato',
                          ),),
                      ),
                    )
                        :Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.LeaveStatusList.length,
                          itemBuilder: (BuildContext, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: InkWell(
                                onTap: () {
                                  // controller.fordetails.value = false;
                                },
                                child: Container(

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0, // soften the shadow
                                        spreadRadius: 1.0, //extend the shadow
                                        offset: Offset(
                                          2.0, // Move to right 5  horizontally
                                          2.0, // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              // Text_widget(
                                              //   fontSize: 16.0,
                                              //   Simpletext: "Name",
                                              //   height: 1.0,
                                              //   fontWeight: FontWeight.w500,
                                              //   fontFamily: 'Roboto',
                                              // ),
                                              Text_widget(
                                                fontSize: 18.0,
                                                Simpletext: controller.LeaveStatusList[index].studentName,
                                                height: 1.0,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Roboto',
                                              ),
                                              controller.LeaveStatusList[index].application == "-"
                                                  ?Text("")
                                                  :InkWell(
                                                  onTap: (){
                                                    showGeneralDialog(
                                                      context: context,
                                                      barrierColor: Colors.black12.withOpacity(0.6), // Background color
                                                      barrierDismissible: true,
                                                      barrierLabel: 'Dialog',
                                                      transitionDuration: Duration(milliseconds: 400),
                                                      pageBuilder: (context, __, ___) {
                                                        return Container(
                                                          color: Colors.black,
                                                          height: MediaQuery.of(context).size.height,
                                                          width: MediaQuery.of(context).size.width,
                                                          child: Stack(
                                                            children: [
                                                              if(controller.LeaveStatusList[index].extension.toString() == "pdf")
                                                                Align(
                                                                  alignment: Alignment.center,
                                                                  child: SfPdfViewer.network(
                                                                      ApiService.IMAGE_URL + controller.LeaveStatusList[index].application.toString(),
                                                                      canShowHyperlinkDialog: true,
                                                                      canShowScrollStatus: true,
                                                                      canShowScrollHead: true,
                                                                      canShowPasswordDialog: true,
                                                                      canShowPaginationDialog: true,
                                                                      enableDocumentLinkAnnotation: true,
                                                                      enableDoubleTapZooming: true,
                                                                      enableHyperlinkNavigation: true,
                                                                      enableTextSelection: true),
                                                                )
                                                              else
                                                                Align(
                                                                    alignment:Alignment.center,
                                                                    child: Image.network(ApiService.IMAGE_URL+controller.LeaveStatusList[index].application.toString())),

                                                              Positioned(
                                                                top: 40,
                                                                right: 20,
                                                                child: Material(
                                                                  color: Colors.transparent,
                                                                  child: InkWell(
                                                                    onTap: (){
                                                                      Get.back();
                                                                      SystemChrome.setPreferredOrientations([
                                                                        DeviceOrientation.portraitUp,
                                                                        DeviceOrientation.portraitDown,
                                                                      ]);
                                                                    },
                                                                    child: Container(
                                                                        height: 50,
                                                                        width: 50,
                                                                        decoration: BoxDecoration(
                                                                            shape:BoxShape.circle
                                                                        ),
                                                                        child: Icon(Icons.close,size: 30,color:
                                                                        controller.LeaveStatusList[index].extension.toString() == "pdf"
                                                                          ?Colors.black
                                                                        :Colors.white,
                                                                        )),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                    );

                                                  },
                                                  child: Icon(Icons.remove_red_eye,color: ColorValues.BG_BT2,)
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.red,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
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
                                                  FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Flexible(
                                                child: Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext:
                                                  controller.LeaveStatusList[index].classId,
                                                  height: 1.0,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
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
                                                  FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Flexible(
                                                child: Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext:controller.LeaveStatusList[index].fatherName,
                                                  height: 1.0,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
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
                                                  FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Flexible(
                                                child: Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: controller.LeaveStatusList[index].startDate,
                                                  height: 1.0,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
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
                                                  FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Flexible(
                                                child: Text_widget(
                                                  fontSize: 14.0,
                                                  Simpletext: controller.LeaveStatusList[index].endDate,
                                                  height: 1.0,
                                                  fontWeight:
                                                  FontWeight.w400,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
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
                                                  FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Flexible(
                                                child: InkWell(
                                                  onTap: (){
                                                    showModalBottomSheet(
                                                        shape:
                                                        RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                                                        backgroundColor: Colors.white,
                                                        context: context,
                                                        builder: (context) {
                                                          return Padding(
                                                            padding: const EdgeInsets.only(left: 20, right: 8, bottom: 20),
                                                            child: SingleChildScrollView(
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisSize: MainAxisSize.min,
                                                                children: [
                                                                  Align(
                                                                    alignment: Alignment.topRight,
                                                                    child: IconButton(
                                                                        onPressed: () {
                                                                          Get.back();
                                                                        },
                                                                        icon: Icon(Icons.cancel_outlined)),
                                                                  ),
                                                                  Text_widget(Simpletext: 'Reason For Leave', fontSize: 16.0, color: Color(ColorValues.RED)),
                                                                  SizedBox(
                                                                    height: 8,
                                                                  ),
                                                                  Text_widget(maxLines: 10, Simpletext: '${controller.LeaveStatusList[index].otherReason!.replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ')}', fontSize: 16.0, color: Color(ColorValues.DIVIDER_COL)),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        });
                                                  },
                                                  child: Text_widget(
                                                    fontSize: 14.0,
                                                    Simpletext: "View Reason",
                                                    height: 1.0,
                                                    fontWeight:
                                                    FontWeight.w600,
                                                    fontFamily: 'Roboto',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: ColorValues.BG_BT2,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text_widget(
                                                  fontSize: 16.0,
                                                  Simpletext:
                                                  'Status',
                                                  height: 1.0,
                                                  fontWeight:
                                                  FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                ),
                                              ),
                                              Flexible(
                                                child: Text_widget(
                                                  fontSize: 17.0,
                                                  Simpletext:
                                                  controller.LeaveStatusList[index].status == 0
                                                      ? 'Pending'
                                                      :controller.LeaveStatusList[index].status == 1
                                                      ?'Approved'
                                                      : 'Unapproved',
                                                  height: 1.0, fontWeight:
                                                FontWeight.w500,
                                                  fontFamily: 'Roboto',
                                                  color: controller.LeaveStatusList[index].status == 0
                                                      ?Colors.orange
                                                      :controller.LeaveStatusList[index].status == 1
                                                      ?Colors.green
                                                      :Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        }
      }
      ),
    );
  }
}
