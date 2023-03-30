import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/our_campus_controller.dart';

class OurCampusView extends GetView<OurCampusController> {
  const OurCampusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OurCampusView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OurCampusView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
