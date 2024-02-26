import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:village/constant/app_text_style.dart';
import 'package:village/controller/auth_controller.dart';
import 'package:village/page/home/home.dart';
import 'package:village/widget/custom_button.dart';

class OTP extends GetView<AuthController> {
  final String? emailPhone;
  final bool? isColsePage;

  const OTP({Key? key, this.emailPhone, this.isColsePage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Material(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Icon(Icons.arrow_back_ios_rounded),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "verification code".tr,
                      style: AppTextStyle.textStyleBold16,
                    ),
                    Text("We have sent verification code to".tr,
                        style: AppTextStyle.textStyleLight14),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(emailPhone ?? "",
                            style: AppTextStyle.textStyleBold16),
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "change",
                              style: AppTextStyle.textStyleBold12
                                  .copyWith(color: Colors.red),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: OTPTextField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          length: 6,
                          onChanged: (value) {
                            controller.otp = value.toString();
                          },
                        ))
                      ],
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                        buttonText: 'Verify  Otp'.tr,
                        onTap: () async {
                          Get.to(const Home());
                        }),
                    const SizedBox(height: 25),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
