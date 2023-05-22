import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_widget/image_picker_widget.dart';
import 'package:the_international_school_of_bombay/app/utils/global_widgets/appBar.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/constants/hint_text.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/buttons.dart';
import '../../../utils/global_widgets/textfield_ui.dart';
import '../controllers/change_pass_controller.dart';

class ChangePassView extends GetView<ChangePassController> {
  const ChangePassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbar(title: 'Change Password'),
        body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 00),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 75,
                ),

                // Old Password
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text_widget(
                    fontSize: 14.0,
                    Simpletext: 'Old Password'.toUpperCase(),
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 00, vertical: 00),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: TextFieldDesigned(
                          controller: controller.oldPassController,
                          obscureText:
                          controller.obscureOldPass.value,
                          fontSize: 16,
                          maxLength: 20,
                          hintText: "${hint_text().OLD_PASS}",
                          hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          readOnly: false,
                          keyboardType: TextInputType.text,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.obscureOldPass.value =
                              !controller.obscureOldPass.value;
                              print("-----------${controller.obscureOldPass.value}");
                            },
                            icon: Icon(controller.obscureOldPass.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: ColorValues.kRedColor,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),

                // New Password
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text_widget(
                    fontSize: 14.0,
                    Simpletext: 'New Password'.toUpperCase(),
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 00, vertical: 00),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: TextFieldDesigned(
                          controller: controller.NewPassController,
                          obscureText:
                          controller.obscureNewPass.value,
                          fontSize: 16,
                          maxLength: 20,
                          hintText: "${hint_text().NEW_PASS}",
                          hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          readOnly: false,
                          keyboardType: TextInputType.text,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.obscureNewPass.value =
                              !controller.obscureNewPass.value;
                              print("-----------${controller.obscureNewPass.value}");
                            },
                            icon: Icon(controller.obscureNewPass.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: ColorValues.kRedColor,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),

                // Confirm Password
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text_widget(
                    fontSize: 14.0,
                    Simpletext: 'Confirm Password'.toUpperCase(),
                    height: 1.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 00, vertical: 00),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() => Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: TextFieldDesigned(
                          controller: controller.ConfirmPassController,
                          obscureText:
                          controller.obscureConfirmPass.value,
                          fontSize: 16,
                          maxLength: 20,
                          hintText: "${hint_text().CONFIRM_PASS}",
                          hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                          autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                          readOnly: false,
                          keyboardType: TextInputType.text,
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.obscureConfirmPass.value =
                              !controller.obscureConfirmPass.value;
                              print("-----------${controller.obscureConfirmPass.value}");
                            },
                            icon: Icon(controller.obscureConfirmPass.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: ColorValues.kRedColor,
                          ),
                        ),
                      )),
                    ],
                  ),
                ),


                SizedBox(height: MediaQuery.of(context).size.height / 25),

                Row(children: [],),

                RoundedFilledButton(
                  label: 'Change Password',
                  color: Color(ColorValues.RED),
                  height: 45,
                  width: double.infinity,
                  fontSize: 14,
                  ontap: () {
                    // Get.to(DeshboardScreenView());
                    //s Get.toNamed(Routes.DESHBOARD_SCREEN);
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ));
  }
}
