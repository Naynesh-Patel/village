import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:village/constant/app_colors.dart';
import 'package:village/constant/vars.dart';
import 'package:village/controller/language_controller.dart';

class LocalLanguage extends StatefulWidget {
  const LocalLanguage({Key? key}) : super(key: key);

  @override
  State<LocalLanguage> createState() => _LocalLanguageState();
}

class _LocalLanguageState extends State<LocalLanguage> {
  LanguageController controller = Get.find();
  // final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              backgroundColor: AppColor.themeColor,
              title: Text("language"),
            )),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.languageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(() => InkWell(
                    onTap: () {
                      Get.back(result: controller.languageList[index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        children: [
                          Icon(controller.languageList[index].languageCode ==
                                  languageCode
                              ? Icons.check_circle
                              : Icons.check_circle_outline_outlined),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              child: Text(
                                  controller.languageList[index].languageName))
                        ],
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
