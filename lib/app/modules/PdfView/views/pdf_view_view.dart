import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../utils/global_widgets/Appbaar.dart';
import '../controllers/pdf_view_controller.dart';

class PdfViewView extends GetView<PdfViewController> {
  const PdfViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Appbaar(
                screen_name: '${controller.title.value.toString()}'.toUpperCase(),
                Back_ontap: (){
                  Get.back();
                },
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SfPdfViewer.network('https://www.africau.edu/images/default/sample.pdf',canShowHyperlinkDialog: true,canShowScrollStatus: true,canShowScrollHead: true,canShowPasswordDialog: true,canShowPaginationDialog: true,enableDocumentLinkAnnotation: true,enableDoubleTapZooming: true,enableHyperlinkNavigation: true,enableTextSelection: true),
              )
            ],
          ),
        )
    );
  }
}
