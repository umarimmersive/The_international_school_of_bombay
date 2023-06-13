import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/api_service.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../controllers/syllabus_controller.dart';

class SyllabusView extends GetView<SyllabusController> {
  const SyllabusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: appbar(title: 'Syllabus'),
        body: Obx(() {
          if(controller.isLoading_Syllabus.isTrue) {
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.red,
                  size: 40,
                ));
          }else{
            print("syllabus pdf ${ApiService.IMAGE_URL +
                controller.syllabus_Data.value[0].syllabus.toString()}");
            return SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // SizedBox(
                    //   height: 20,
                    // ),
                    controller.syllabus_Data.isNotEmpty
                    ?Expanded(
                      child: controller.syllabus_Data.value.length!=0
                      ?SfPdfViewer.network(
                          ApiService.IMAGE_URL +
                          controller.syllabus_Data.value[0].syllabus.toString(),
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
                        child: Text("No Syllabus Found",
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
