import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/accedmic_content_controller.dart';

class AccedmicContentView extends GetView<AccedmicContentController> {
  const AccedmicContentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Accedmic Content'),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /* Appbaar(
                screen_name: 'syllabus'.toUpperCase(),
                Back_ontap: (){
                  Get.back();
                },
              ),*/
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SfPdfViewer.asset("assets/images/Academic Content_compressed.pdf",canShowHyperlinkDialog: true,canShowScrollStatus: true,canShowScrollHead: true,canShowPasswordDialog: true,canShowPaginationDialog: true,enableDocumentLinkAnnotation: true,enableDoubleTapZooming: true,enableHyperlinkNavigation: true,enableTextSelection: true),
              )

            ],),
        )
    );
  }
}
