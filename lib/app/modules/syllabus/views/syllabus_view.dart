import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../utils/global_widgets/Appbaar.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../controllers/syllabus_controller.dart';

class SyllabusView extends GetView<SyllabusController> {
  const SyllabusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: appbar('Syllabus'),
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
                child: SfPdfViewer.asset('assets/images/Social_Science_Sec_2020-21.pdf',canShowHyperlinkDialog: true,canShowScrollStatus: true,canShowScrollHead: true,canShowPasswordDialog: true,canShowPaginationDialog: true,enableDocumentLinkAnnotation: true,enableDoubleTapZooming: true,enableHyperlinkNavigation: true,enableTextSelection: true),
              )

            ],),
        )
    );
  }
}
