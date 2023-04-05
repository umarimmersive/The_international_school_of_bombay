import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/appBar.dart';
import '../../../utils/global_widgets/textEnter.dart';
import '../controllers/home_slider_details_controller.dart';

class HomeSliderDetailsView extends GetView<HomeSliderDetailsController> {
  const HomeSliderDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: appbar('Details'),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: TextFieldShowCOLOR(
                        textAlign: TextAlign.justify,
                        maxLines: 100,
                        color: ColorValues.BLACK,
                        fontsize: 16.0,
                        text: '"${controller.maintittle.value}"',
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                '${controller.images.value}',
                                fit: BoxFit.cover,
                              )))),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
                    child: TextFieldShowCOLOR(
                      textAlign: TextAlign.justify,
                      maxLines: 100,
                      color: ColorValues.BLACK,
                      fontsize: 16.0,
                      text: '${controller.title.value}',
                      height: 1.5,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
