import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/time_table_screen_controller.dart';

class TimeTableScreenView extends GetView<TimeTableScreenController> {
  const TimeTableScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: 'Time Table',icon_button: false),
      body: Column(children: [
        Expanded(
          child: SfPdfViewer.asset("assets/images/Time Table_compressed.pdf",canShowHyperlinkDialog: true,canShowScrollStatus: true,canShowScrollHead: true,canShowPasswordDialog: true,canShowPaginationDialog: true,enableDocumentLinkAnnotation: true,enableDoubleTapZooming: true,enableHyperlinkNavigation: true,enableTextSelection: true),
        )

      ],)
    );
  }
}
