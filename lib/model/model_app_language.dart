import 'package:get/get.dart';

class ModelAppLanguage {
  final String languageName;
  final String languageCode;
  final String countryCode;
  RxBool isSelected = false.obs;

  ModelAppLanguage({
    required this.languageName,
    required this.languageCode,
    required this.countryCode,
    required this.isSelected
});

}