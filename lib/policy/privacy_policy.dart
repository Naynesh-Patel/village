import 'package:flutter/material.dart';
import 'package:village/constant/app_colors.dart';
import 'package:village/constant/app_text_style.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return Privacy();
  }
}

class Privacy extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.themeColor,
        title: Text('Privacy Policy ',
            style: AppTextStyle.appbarTextStyle.copyWith(color: Colors.white)),
      ),
      body: const WebView(
        initialUrl: '',
      ),
    );
  }
}
