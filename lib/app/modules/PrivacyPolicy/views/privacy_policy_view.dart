import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: const Text('PrivacyPolicyView'),
        centerTitle: true,
      ),*/
      appBar: appbar(title: 'PrivacyPolicy'),
      body: const Center(
        child: Text(
          'PrivacyPolicyView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
