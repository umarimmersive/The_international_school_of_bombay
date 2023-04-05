import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_international_school_of_bombay/app/routes/app_pages.dart';
import 'package:the_international_school_of_bombay/app/utils/constants/hint_text.dart';
import '../../../utils/constants/ColorValues.dart';
import '../../../utils/global_widgets/Text_widget.dart';
import '../../../utils/global_widgets/buttons.dart';
import '../../../utils/global_widgets/globle_var.dart';
import '../../../utils/global_widgets/textfield_ui.dart';
import '../../HomeScreen/views/home_screen_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Scaffold(
         key: scaffoldKey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: MediaQuery.of(context).size.height/10,
                  ),
                  Center(
                    child: Container(
                      child: Image.asset(
                        "${controller.Image.value}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text_widget(
                      color: ColorValues.BLACK_TEXT,
                      fontSize: 14.0,
                      Simpletext: 'STUDENT ID',
                      height: 1.0,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 00,
                        horizontal: MediaQuery.of(context).size.height * 0.00),
                    child: TextFieldDesigned(
                      maxLines: 2,
                      fontSize: 14,
                      maxLength: 50,
                      minLines: 1,
                      hintText: "${hint_text().EMAIL_HINT}",
                      hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      readOnly: false,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 80,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text_widget(
                      color: ColorValues.BLACK_TEXT,
                      fontSize: 14.0,
                      Simpletext: 'Password'.toUpperCase(),
                      height: 1.0,
                      fontWeight:  FontWeight.w500,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 00, vertical: 00),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(() => Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: TextFieldDesigned(
                            obscureText: controller.obscureNewPass.value,
                            fontSize: 14,
                            maxLength: 50,
                            hintText: "${hint_text().PASSWORD_HINT}",
                            hintStyle: ColorValues.DIVIDER_COLOR_ONE,
                            autovalidateMode:
                            AutovalidateMode.onUserInteraction,
                            readOnly: false,
                            keyboardType: TextInputType.text,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  controller.obscureNewPass.value = !controller.obscureNewPass.value;
                                  print("-----------${controller.obscureNewPass.value}");
                                },
                                icon: Icon(controller.obscureNewPass.value
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                          ),
                        )),
                      ],
                    ),
                  ),

                 SizedBox(
                   height: MediaQuery.of(context).size.height/17,
                 ),
               /*   Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          Get.toNamed("/forgot-password");
                        },
                        child:
                        Text_widget(
                          color: ColorValues.BLACK,
                          fontSize: 13.0,
                          Simpletext: 'Forgot Password?',
                          height: 1.0,
                          fontWeight:  FontWeight.w500,
                          fontFamily: 'Roboto',
                        ),
                      )),*/

                  RoundedFilledButton(
                    label: 'Log In',
                    color: Color(ColorValues.RED),
                    height: 45,
                    width: double.infinity,
                    fontSize: 14,
                    ontap: (){
                     // Get.to(DeshboardScreenView());
                      Get.toNamed(Routes.DESHBOARD_SCREEN);
                    },
                  )



              ],),
            ),
          ),
        )
      ),
    );
  }
}
