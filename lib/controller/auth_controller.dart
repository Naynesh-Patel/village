import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController jobIdTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController mobileTextEditingController = TextEditingController();
  TextEditingController countryCodeTextEditingController =
      TextEditingController(text: "+91");
  TextEditingController companyTextEditingController = TextEditingController();
  TextEditingController designationTextEditingController =
      TextEditingController();

  RxString selectedCountryCode = "+91".obs;
  RxString languageId = "0".obs;
  RxString currencyId = "0".obs;

  RxBool isLostPhoneNumber = false.obs;
  RxBool isLostEmail = false.obs;
  RxBool terms = true.obs;
  RxBool verifyEmail = false.obs;

  String currentEmailMail = "";

  String verificationId = "";
  String otp = "";

  RxBool isLoading = false.obs;
  RxBool isVerifyLoading = false.obs;
  RxBool isCurrencyLoading = false.obs;
}
