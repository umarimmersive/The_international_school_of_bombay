import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/rate_us_controller.dart';

class RateUsView extends GetView<RateUsController> {
  const RateUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(title: 'RateUs'),
      body: const Center(
        child: Text(
          'RateUsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
