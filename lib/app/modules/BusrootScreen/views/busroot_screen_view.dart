import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:the_international_school_of_bombay/app/routes/app_pages.dart';

import '../../../utils/constants/api_service.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/busroot_screen_controller.dart';

class BusrootScreenView extends GetView<BusrootScreenController> {
  const BusrootScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Bus Routes'),
        body: Obx(() {
          if(controller.isLoading_busRoute.isTrue) {
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          }else{
            // print("busRoute pdf ${ApiService.IMAGE_URL +
            //     controller.busRoute_Data.value[0].file.toString()}");
            return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(
                    //   height: 20,
                    // ),
                    controller.busRoute_Data.isNotEmpty
                        ?Expanded(
                      child: controller.busRoute_Data.value.length!=0
                          ?SfPdfViewer.network(ApiService.IMAGE_URL +
                          controller.busRoute_Data.value[0].file.toString(),
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
                        child: Text("No Bus Routes Found",
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
        })
    );
  }
}
