import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:village/constant/app_colors.dart';
import 'package:village/page/home/local_language.dart';
import 'package:village/page/home/vacnacy_list.dart';
import 'package:village/policy/privacy_policy.dart';
import 'package:village/policy/terms_conditions.dart';
import 'package:village/widget/custom_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? dropDownValue;
  String? dropDownValue1;
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key, // Assign the key to Scaffold.
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset("assets/images/splash.png"),
            ),
            ListTile(
              title: const Text('Languages'),
              onTap: () {
                Get.to(const LocalLanguage());
              },
            ),
            ListTile(
              title: const Text('privacy policy'),
              onTap: () {
                Get.to(const PrivacyPolicy());
              },
            ),
            ListTile(
              title: const Text('Terms Conditions'),
              onTap: () {
                Get.to(const TermsConditions());
              },
            ),
            ListTile(
              title: const Text('LogOut'),
              onTap: () {},
            ),
          ],
        ),
      ),
      drawerEnableOpenDragGesture: false, // Prevent user sliding open
      appBar: AppBar(
        leading: Builder(
          builder: (context) => // Ensure Scaffold is in context
              IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () => Scaffold.of(context).openDrawer()),
        ),
        backgroundColor: AppColor.themeColor,
        title: const Text("તમારી માહિતી નાખો"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          information("નામ દાખલ કરો"),
          information("મોબાઇલ નંબર દાખલ કરો"),
          information("સરનામું દાખલ કરો"),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.black, width: 2)),
              child: DropdownButton(
                underline: const SizedBox(),
                hint: dropDownValue == null
                    ? const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('વર્ગ'),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          dropDownValue!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                style: const TextStyle(color: Colors.black),
                items: [
                  'પુરૂષ',
                  'સ્ત્રી',
                ].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      dropDownValue = val as String?;
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: Colors.black, width: 2)),
              child: DropdownButton(
                underline: const SizedBox(),
                hint: dropDownValue1 == null
                    ? const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('શ્રેણી'),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          dropDownValue1!,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                isExpanded: true,
                iconSize: 30.0,
                style: const TextStyle(color: Colors.black),
                items: [
                  'વિદ્યાર્થી ',
                  'જુવાન પુખ્ત',
                  'મધ્યમ વયસ્કો',
                  'જૂના પુખ્ત',
                ].map(
                  (val) {
                    return DropdownMenuItem<String>(
                      value: val,
                      child: Text(val),
                    );
                  },
                ).toList(),
                onChanged: (val) {
                  setState(
                    () {
                      dropDownValue1 = val as String?;
                    },
                  );
                },
              ),
            ),
          ),
          information("હોદ્દો"),
        ],
      ),
      bottomNavigationBar: CustomButton(
          buttonText: ' આગર વધો',
          onTap: () async {
            Get.to(const VacnacyList());
          }),
    );
  }

  information(hintText) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        // obscureText: true,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2)),
          hintText: hintText,
        ),
      ),
    );
  }
}
