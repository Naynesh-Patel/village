import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:village/constant/vars.dart';
import 'package:village/controller/binding_controller.dart';
import 'package:village/page/home/splash.dart';

import 'page/home/app_languages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingController(),
      home: const Splash(),
      locale: Locale(languageCode, languageCode.toUpperCase()),
      fallbackLocale: const Locale("en", "US"),
      translations: AppLanguages(),
    );
  }
}
