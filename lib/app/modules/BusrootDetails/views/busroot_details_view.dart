import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/busroot_details_controller.dart';

class BusrootDetailsView extends GetView<BusrootDetailsController> {
  const BusrootDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: 'Bus Route'),
      body: Center(
       ),
    );
  }
}
