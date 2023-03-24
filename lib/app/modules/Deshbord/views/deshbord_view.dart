import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/deshbord_controller.dart';

class DeshbordView extends GetView<DeshbordController> {
  const DeshbordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeshbordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DeshbordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
