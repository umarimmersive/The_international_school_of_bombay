import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/global_widgets/appBar.dart';
import '../controllers/our_philosypher_controller.dart';

class OurPhilosypherView extends GetView<OurPhilosypherController> {
  const OurPhilosypherView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        title: const Text('OurPhilosypherView'),
        centerTitle: true,
      ),*/
      appBar: appbar('OurPhilosypher'),
      body: const Center(
        child: Text(
          'OurPhilosypherView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
