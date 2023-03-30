import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/termand_condition_controller.dart';

class TermandConditionView extends GetView<TermandConditionController> {
  const TermandConditionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TermandConditionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TermandConditionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
