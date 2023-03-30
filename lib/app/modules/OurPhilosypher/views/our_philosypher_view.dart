import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/our_philosypher_controller.dart';

class OurPhilosypherView extends GetView<OurPhilosypherController> {
  const OurPhilosypherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OurPhilosypherView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'OurPhilosypherView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
