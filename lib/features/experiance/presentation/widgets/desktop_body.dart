import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/screensize.dart';
import '../../../../core/widgets/desktop_menu.dart';

Widget buildDesktopBody(BuildContext context) {
  final TextStyle cardTitleStyle = TextStyle(color: AppTheme.appBackgroundColor(context), fontSize: 25, fontWeight: FontWeight.bold);
  final BoxDecoration iconDecoration = BoxDecoration(
    color: AppTheme.appBackgroundColor(context),
    borderRadius: BorderRadius.circular(16),
    boxShadow: [BoxShadow(color: AppTheme.appBackgroundColor(context), blurRadius: 10, offset: Offset(0, 0))],
  );
  final BoxDecoration cardDecoration = BoxDecoration(
    color: AppTheme.primaryTextColor(context).withAlpha(150),
    borderRadius: BorderRadius.circular(16), // Rounded corners
    border: Border.all(width: 1, color: AppTheme.primaryTextColor(context).withAlpha(30)),
    boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2, offset: Offset(0, 1))],
  );
  double fontSize() => ScreenSize.width(context) / 2 < 700 ? ScreenSize.width(context) / 2 : 700;
  double iconSize() => ScreenSize.width(context) / 40 + 60 > 128 ? 128 : ScreenSize.width(context) / 40 + 60;
//print(iconSize());
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setState) {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: ScreenSize.width(context) * 3 / 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (int a = 0; a < buildDesktopMenu(context, 2).length; a++) buildDesktopMenu(context, 2)[a],
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: ScreenSize.width(context) > 1200
                    ? 70
                    : ScreenSize.width(context) > 1000
                        ? 65
                        : 55,
                left: 10,
                right: 10),
            child: SingleChildScrollView(
              child: ScreenSize.width(context) < 1600
                  ? Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10.0, right: 5, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Programming Languages", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/dart_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/c++_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/javascript_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/html_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/css_96.png', fit: BoxFit.fitWidth)),
                                        SizedBox(width: iconSize(), height: iconSize())
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10.0, right: 5, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Development Tools", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/vscode_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/github_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/githubactions_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/platformio_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/arduino_ide_96.png', fit: BoxFit.fitWidth)),
                                        SizedBox(width: iconSize(), height: iconSize())
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10.0, right: 5, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                //height: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Database Management", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/mysql_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/sqlite_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5.0, right: 10, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                //height: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Frameworks and Platforms", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/flutter_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/firebase_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/supabase_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5.0, right: 10, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                //height: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Hardware and IoT", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/espressif_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/arduino_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/stm_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/wifi_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/bluetooth_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/lora_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5.0, right: 10, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Design Tools", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/figma_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/photoshop_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/xd_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/ai_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/sketchup_96.png', fit: BoxFit.fitWidth)),
                                        SizedBox(width: iconSize(), height: iconSize())
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10.0, right: 5, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Programming Languages", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/dart_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/c++_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/javascript_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/html_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/css_96.png', fit: BoxFit.fitWidth)),
                                        SizedBox(width: iconSize(), height: iconSize())
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5.0, right: 10, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                //height: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Hardware and IoT", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/espressif_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/arduino_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/stm_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/wifi_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/bluetooth_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/lora_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10.0, right: 5, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Development Tools", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/vscode_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/github_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/githubactions_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/platformio_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/arduino_ide_96.png', fit: BoxFit.fitWidth)),
                                        SizedBox(width: iconSize(), height: iconSize())
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10.0, right: 5, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                //height: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Database Management", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/mysql_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/sqlite_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5.0, right: 10, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                //height: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Frameworks and Platforms", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/flutter_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/firebase_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/supabase_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 5.0, right: 10, top: 0, bottom: 10),
                                width: ScreenSize.width(context) - 20,
                                decoration: cardDecoration,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    Text("Design Tools", style: cardTitleStyle),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/figma_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/photoshop_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/xd_96.png', fit: BoxFit.fitWidth)),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/ai_96.png', fit: BoxFit.fitWidth)),
                                        Container(width: iconSize(), decoration: iconDecoration, child: Image.asset('assets/images/icons/sketchup_96.png', fit: BoxFit.fitWidth)),
                                        SizedBox(width: iconSize(), height: iconSize())
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      );
    },
  );
}
