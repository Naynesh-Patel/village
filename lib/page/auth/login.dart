import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:village/constant/app_colors.dart';
import 'package:village/constant/app_text_style.dart';
import 'package:village/controller/auth_controller.dart';
import 'package:village/page/auth/otp.dart';
import 'package:village/widget/custom_button.dart';
import 'package:village/widget/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AuthController controller = Get.find();
  bool visibility = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                widgetAppLogoName(context),
                Obx(() => !controller.isLostPhoneNumber.value
                    ? CustomTextField(
                        hintText: 'Enter your mobile number',
                        textEditingController:
                            controller.mobileTextEditingController,
                        textInputType: TextInputType.phone,
                        preFixWidget: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("+91"),
                        ),
                        prefixIconConstraints:
                            const BoxConstraints(maxWidth: 90, minWidth: 40),
                        maxLength: 12,
                        style: AppTextStyle.textStyleRegular14,
                        paddingHorizontal: 0,
                      )
                    : CustomTextField(
                        hintText: 'Enter Your Email',
                        textEditingController:
                            controller.emailTextEditingController,
                        textInputType: TextInputType.emailAddress,
                      )),
                Obx(() => Align(
                      alignment: Alignment.centerRight,
                      child: controller.isLostPhoneNumber.value
                          ? TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Continue with phone number",
                                style: TextStyle(
                                  color: AppColor.themeColor,
                                ),
                              ))
                          : TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Lost your phone number",
                                style: TextStyle(
                                  color: AppColor.themeColor,
                                ),
                              )),
                    )),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Checkbox(
                            value: controller.terms.value,
                            fillColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (!states.contains(MaterialState.selected)) {
                                return Colors.black;
                              }
                              return null;
                            }),
                            checkColor: Colors.black,
                            onChanged: (value) {
                              controller.terms.value = value!;
                            }),
                      ),
                      Expanded(
                        child: Text.rich(TextSpan(
                            text: 'By continuing, you agree to our ',
                            style: const TextStyle(
                                fontSize: 12, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Terms of Service',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // code to open / launch terms of service link here
                                    }),
                              TextSpan(
                                  text: ' and ',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Privacy Policy',
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            decoration:
                                                TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {})
                                  ])
                            ])),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    buttonText: 'Get Otp'.tr,
                    onTap: () async {
                      Get.to(const OTP());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget orLine(context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          height: 1,
          color: Theme.of(context).focusColor,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        )),
        const Text("OR"),
        Expanded(
            child: Container(
          height: 1,
          color: Theme.of(context).focusColor,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        )),
      ],
    );
  }

  Widget widgetAppLogoName(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/splash.png",
            width: Get.width * 0.80,
            height: Get.height * 0.20,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
