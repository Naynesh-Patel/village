import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:village/constant/vars.dart';
import 'package:village/model/model_app_language.dart';

class LanguageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  RxList<ModelAppLanguage> languageList = <ModelAppLanguage>[].obs;

  RxString selectLanguage = "English".obs;
  var locale = const Locale('it', 'IT');
  int selectLang = 0;

  void getData() {
    languageList.add(ModelAppLanguage(
        languageName: "English",
        languageCode: "en",
        countryCode: "US",
        isSelected: languageCode == "en" ? true.obs : false.obs));
    languageList.add(ModelAppLanguage(
        languageName: "Gujarati",
        languageCode: "gu",
        countryCode: "IN",
        isSelected: languageCode == "gu" ? true.obs : false.obs));
  }

  ModelAppLanguage? modelLanguage;
}
