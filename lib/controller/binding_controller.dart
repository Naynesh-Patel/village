import 'package:get/get.dart';
import 'package:village/controller/auth_controller.dart';
import 'package:village/controller/language_controller.dart';

class BindingController with Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<LanguageController>(() => LanguageController(), fenix: true);
  }
}
