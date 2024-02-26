import 'package:flutter/material.dart';
import 'package:village/constant/app_colors.dart';
import 'package:village/constant/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function onTap;
  final Color? color;
  const CustomButton(
      {Key? key, required this.buttonText, required this.onTap, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColor.themeColor,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          onTap();
        },
        child: Container(
          constraints: const BoxConstraints(maxHeight: 50),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
          child: Center(
              child: Text(
            buttonText,
            style: AppTextStyle.textStyleBold16
                .copyWith(color: AppColor.whiteColor),
          )),
        ),
      ),
    );
  }
}
