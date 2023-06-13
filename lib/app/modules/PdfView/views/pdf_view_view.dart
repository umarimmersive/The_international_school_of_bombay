import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:the_international_school_of_bombay/app/modules/Assignment/views/assignment_view.dart';
import 'package:the_international_school_of_bombay/app/routes/app_pages.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/api_service.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/pdf_view_controller.dart';

class PdfViewView extends GetView<PdfViewController> {
  const PdfViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Get.parameters[1].toString() ${Get.parameters['sub']}");
    return Scaffold(
        appBar: appbar(title: Get.parameters['sub'].toString()),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Expanded(
                child: SfPdfViewer.network(
                    ApiService.IMAGE_URL+Get.parameters['pdf'].toString(),canShowHyperlinkDialog: true,canShowScrollStatus: true,canShowScrollHead: true,canShowPasswordDialog: true,canShowPaginationDialog: true,enableDocumentLinkAnnotation: true,enableDoubleTapZooming: true,enableHyperlinkNavigation: true,enableTextSelection: true),
              )
            ],
          ),
        )
    );
  }
}
