import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../controllers/pdf_view_controller.dart';

class PdfViewView extends GetView<PdfViewController> {
  const PdfViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Mathematics'),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
               Expanded(
                child: SfPdfViewer.asset("assets/images/Mathematics_Sec_2020-21.pdf",canShowHyperlinkDialog: true,canShowScrollStatus: true,canShowScrollHead: true,canShowPasswordDialog: true,canShowPaginationDialog: true,enableDocumentLinkAnnotation: true,enableDoubleTapZooming: true,enableHyperlinkNavigation: true,enableTextSelection: true),
              )
            ],
          ),
        )
    );
  }
}
