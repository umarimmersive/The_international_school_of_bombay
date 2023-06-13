import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../utils/constants/api_service.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/time_table_screen_controller.dart';

class TimeTableScreenView extends StatefulWidget {
  const TimeTableScreenView({Key? key}) : super(key: key);

  @override
  State<TimeTableScreenView> createState() => _TimeTableScreenViewState();
}

class _TimeTableScreenViewState extends State<TimeTableScreenView> {

  TimeTableScreenController controller =  Get.put(TimeTableScreenController());

  RefreshController refreshController =
  RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: appbar(title: 'Time Table',icon_button: false),
        body: SmartRefresher(
          controller: refreshController,
          enablePullUp: true,
          // key: controller.refresherKey,
          enablePullDown: true,
          header: MaterialClassicHeader(),
          child: Obx(() {
            if(controller.isLoading_time_table.isTrue) {
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
                      // SizedBox(
                      //   height: 20,
                      // ),
                      controller.time_table_Data.isNotEmpty
                          ?Expanded(
                        child:   controller.time_table_Data.value.length != 0
                            ?SfPdfViewer.network(ApiService.IMAGE_URL +
                            controller.time_table_Data.value[0].timetable.toString(),
                            canShowHyperlinkDialog: true,
                            canShowScrollStatus: true,
                            canShowScrollHead: true,
                            canShowPasswordDialog: true,
                            canShowPaginationDialog: true,
                            enableDocumentLinkAnnotation: true,
                            enableDoubleTapZooming: true,
                            enableHyperlinkNavigation: true,
                            enableTextSelection: true)
                            :SizedBox(),
                      )
                          :Container(
                        height: MediaQuery.of(context).size.height/1.3,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "No Time Table Found",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Lato',
                            ),),
                        ),
                      )
                    ],
                  )
              );
            }
          }),

            physics: BouncingScrollPhysics(),
          footer: ClassicFooter(
            loadStyle: LoadStyle.HideAlways,
            completeDuration: Duration(milliseconds: 500),
          ),
          onRefresh: () async {
            await controller.refrshApi();
            await Future.delayed(Duration(milliseconds: 1000));

            if (true)  refreshController.refreshCompleted();
          },
        )
    );
  }
}

