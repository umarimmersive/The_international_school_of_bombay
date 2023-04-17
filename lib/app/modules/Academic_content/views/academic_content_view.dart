import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/academic_content_controller.dart';

class AcademicContentView extends GetView<AcademicContentController> {
  const AcademicContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Academic content'),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
             /* Appbaar(
                screen_name: 'Academic content'.toUpperCase(),
                 Back_ontap: (){
                  Get.back();
                },
              ),*/
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SfPdfViewer.network('https://www.africau.edu/images/default/sample.pdf',canShowHyperlinkDialog: true,canShowScrollStatus: true,canShowScrollHead: true,canShowPasswordDialog: true,canShowPaginationDialog: true,enableDocumentLinkAnnotation: true,enableDoubleTapZooming: true,enableHyperlinkNavigation: true,enableTextSelection: true),
              )
            ],),
        )
    );
  }
}
