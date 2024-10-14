import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/screensize.dart';

Widget buildMobileBody(BuildContext context) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Skills", style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 25)),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 15),
                width: ScreenSize.width(context) - 20,
                decoration: BoxDecoration(
                  color: AppTheme.appBackgroundColor(context),
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                  border: Border.all(width: 1, color: AppTheme.primaryTextColor(context).withAlpha(30)),
                  boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(0, 1))],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text("Programming Languages:", style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 20)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/icons/dart_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/c++_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/javascript_96.png', fit: BoxFit.cover),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/icons/html_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/css_96.png', fit: BoxFit.cover),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 15),
                width: ScreenSize.width(context) - 20,
                decoration: BoxDecoration(
                  color: AppTheme.appBackgroundColor(context),
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                  border: Border.all(width: 1, color: AppTheme.primaryTextColor(context).withAlpha(30)),
                  boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(0, 1))],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Development Tools:",
                      style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/icons/vscode_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/github_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/githubactions_96.png', fit: BoxFit.cover),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/icons/platformio_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/arduino_ide_96.png', fit: BoxFit.cover),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 15),
                width: ScreenSize.width(context) - 20,
                //height: ScreenSize.width(context) - 20,
                decoration: BoxDecoration(
                  color: AppTheme.appBackgroundColor(context),
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                  border: Border.all(width: 1, color: AppTheme.primaryTextColor(context).withAlpha(30)),
                  boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(0, 1))],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Frameworks and Libraries:",
                      style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/icons/flutter_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/firebase_96.png', fit: BoxFit.cover),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 15),
                width: ScreenSize.width(context) - 20,
                //height: ScreenSize.width(context) - 20,
                decoration: BoxDecoration(
                  color: AppTheme.appBackgroundColor(context),
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                  border: Border.all(width: 1, color: AppTheme.primaryTextColor(context).withAlpha(30)),
                  boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(0, 1))],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Hardware and IoT:",
                      style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/icons/espressif_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/arduino_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/stm_96.png', fit: BoxFit.cover),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 15),
                width: ScreenSize.width(context) - 20,
                //height: ScreenSize.width(context) - 20,
                decoration: BoxDecoration(
                  color: AppTheme.appBackgroundColor(context),
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                  border: Border.all(width: 1, color: AppTheme.primaryTextColor(context).withAlpha(30)),
                  boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(0, 1))],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Database Management:",
                      style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/icons/mysql_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/sqlite_96.png', fit: BoxFit.cover),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 15),
                width: ScreenSize.width(context) - 20,
                decoration: BoxDecoration(
                  color: AppTheme.appBackgroundColor(context),
                  borderRadius: BorderRadius.circular(16), // Rounded corners
                  border: Border.all(width: 1, color: AppTheme.primaryTextColor(context).withAlpha(30)),
                  boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(0, 1))],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Design Tools:",
                      style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/icons/figma_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/photoshop_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/xd_96.png', fit: BoxFit.cover),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/icons/ai_96.png', fit: BoxFit.cover),
                        Image.asset('assets/images/icons/sketchup_96.png', fit: BoxFit.cover),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
