import 'package:flutter/material.dart';
import 'package:village/constant/app_colors.dart';

class VacnacyList extends StatefulWidget {
  const VacnacyList({Key? key}) : super(key: key);

  @override
  State<VacnacyList> createState() => _VacnacyListState();
}

class _VacnacyListState extends State<VacnacyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColor.themeColor,
        title: const Text("ખાલી જગ્યા ની યાદી"),
      ),
    );
  }
}
