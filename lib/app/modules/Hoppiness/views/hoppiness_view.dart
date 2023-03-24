import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/hoppiness_controller.dart';

class HoppinessView extends GetView<HoppinessController> {
  const HoppinessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HoppinessView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HoppinessView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
