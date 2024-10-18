import 'dart:math';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/screensize.dart';
import '../../../../core/widgets/desktop_menu.dart';
import '../../domain/entities/projects_entity.dart';

Widget buildDesktopBody(
  BuildContext context,
  List<ProjectEntity> projectList,
  List<bool> isVisible,
  List<AnimationController> flipController,
  List<Animation> flipAnimation,
) {
  final List<int> delays = List.generate(projectList.length, (index) => index * 100); // Staggered delays

  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AnimatedOpacity(
                opacity: isVisible[0] ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: SizedBox(
                  width: ScreenSize.width(context) * 3 / 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      for (int a = 0; a < buildDesktopMenu(context, 3).length; a++) buildDesktopMenu(context, 3)[a],
                      const SizedBox(width: 12),
                    ],
                  ),
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
          child: Center(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ScreenSize.width(context) > 1200 ? 3 : 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
              itemCount: projectList.length,
              itemBuilder: (context, index) {
                return VisibilityDetector(
                  key: Key(index.toString()),
                  onVisibilityChanged: (visibilityInfo) {
                    if (visibilityInfo.visibleFraction > 0.5 && !isVisible[index]) {
                      Future.delayed(Duration(milliseconds: delays[index]), () {
                        setState(() {
                          isVisible[index] = true;
                        });
                      });
                    }
                  },
                  child: AnimatedOpacity(
                    opacity: isVisible[index] ? 1.0 : 0.0,
                    duration: const Duration(seconds: 1),
                    child: projectCards(context, projectList, index, flipController, flipAnimation),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  });
}

Widget projectCards(
  BuildContext context,
  List<ProjectEntity> projectList,
  int index,
  List<AnimationController> flipController,
  List<Animation> flipAnimation,
) {
  Future<void> urlLauncher(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  void onTap() {
    // On tap, toggle the flip state
    if (flipController[index].isCompleted || flipController[index].velocity > 0) {
      flipController[index].reverse();
    } else {
      flipController[index].forward();
    }
  }

  double containerSizeDraft = ScreenSize.width(context) > 1200 ? (ScreenSize.width(context) - 20) / 3.1 : (ScreenSize.width(context) - 20) / 2.05;
  double titleFontSize() => ScreenSize.width(context) > 1200 ? ScreenSize.width(context) / 80 : ScreenSize.width(context) / 50;

  return MouseRegion(
    onEnter: (_) {}, //=> onMouseEnter(true), // Detect mouse enter
    onExit: (_) {}, // => onMouseEnter(false), // Detect mouse exit
    child: GestureDetector(
      onTap: onTap, // Detect click to toggle flip
      child: AnimatedBuilder(
          animation: flipController[index],
          builder: (context, child) {
            // Calculate the rotation value for the flip effect
            final angle = flipAnimation[index].value * pi;
            final isFront = angle < pi / 2;

            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001) // Perspective to give the flip depth
                ..rotateY(angle), // Rotate along Y-axis
              alignment: Alignment.center,
              child: isFront
                  ? Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 0.0, right: 0, top: 0, bottom: 0),
                          width: containerSizeDraft,
                          height: containerSizeDraft,
                          decoration: BoxDecoration(
                            color: AppTheme.appBackgroundColor(context),
                            borderRadius: BorderRadius.circular(16), // Rounded corners
                            border: Border.all(width: 1, color: AppTheme.primaryTextColor(context).withAlpha(30)),
                            boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(0, 3))],
                          ),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                                child: SizedBox(
                                  height: (containerSizeDraft - 2) * 3 / 4,
                                  //width: double.infinity,
                                  child: Image.asset(projectList[index].imgUrl, fit: BoxFit.cover),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: (containerSizeDraft - 2) * 1 / 4,
                                  color: AppTheme.primaryTextColor(context).withAlpha(50),
                                  //color: AppTheme.primaryTextColor(context).withAlpha(50),
                                  child: Center(
                                    child: AutoSizeText(
                                      projectList[index].projectDescription,
                                      style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: titleFontSize()),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Transform(
                      transform: Matrix4.identity()..rotateY(pi),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(left: 0.0, right: 0, top: 0, bottom: 0),
                              width: containerSizeDraft,
                              height: containerSizeDraft,
                              decoration: BoxDecoration(
                                color: AppTheme.appBackgroundColor(context),
                                borderRadius: BorderRadius.circular(16), // Rounded corners
                                border: Border.all(width: 1, color: AppTheme.primaryTextColor(context).withAlpha(30)),
                                boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 5, offset: Offset(0, 3))],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    height: (containerSizeDraft - 2) * 3 / 4,
                                    child: Center(
                                      child: AutoSizeText(
                                        projectList[index].projectFullDescription,
                                        style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 20),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  ClipRRect(
                                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: AppTheme.primaryTextColor(context).withAlpha(50),
                                        //border: const Border(top: BorderSide(color: Colors.amber, width: 1.0)),
                                      ),
                                      height: (containerSizeDraft - 2) * 1 / 4,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            if (projectList[index].appStoreUrl != '')
                                              InkWell(
                                                onTap: () => urlLauncher(Uri.parse(projectList[index].appStoreUrl)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10), // Rounded corners
                                                    border: Border.all(width: 1, color: AppTheme.appBackgroundColor(context)),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                    child: Image.asset(
                                                      'assets/images/appstore_button.png',
                                                      fit: BoxFit.cover,
                                                      width: containerSizeDraft * 0.3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (projectList[index].playStoreUrl != '')
                                              InkWell(
                                                onTap: () => urlLauncher(Uri.parse(projectList[index].playStoreUrl)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10), // Rounded corners
                                                    border: Border.all(width: 1, color: AppTheme.appBackgroundColor(context)),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                    child: Image.asset(
                                                      'assets/images/playstore_button.png',
                                                      fit: BoxFit.cover,
                                                      width: containerSizeDraft * 0.3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (projectList[index].githubUrl != '')
                                              InkWell(
                                                onTap: () => urlLauncher(Uri.parse(projectList[index].githubUrl)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10), // Rounded corners
                                                    border: Border.all(width: 1, color: AppTheme.appBackgroundColor(context)),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                    child: Image.asset(
                                                      'assets/images/github_button.png',
                                                      fit: BoxFit.cover,
                                                      width: containerSizeDraft * 0.3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (projectList[index].liveDemoUrl != '')
                                              InkWell(
                                                onTap: () => urlLauncher(Uri.parse(projectList[index].liveDemoUrl)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10), // Rounded corners
                                                    border: Border.all(width: 1, color: AppTheme.appBackgroundColor(context)),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                    child: Image.asset(
                                                      'assets/images/web_button.png',
                                                      fit: BoxFit.cover,
                                                      width: containerSizeDraft * 0.3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (projectList[index].apkUrl != '')
                                              InkWell(
                                                onTap: () => urlLauncher(Uri.parse(projectList[index].apkUrl)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10), // Rounded corners
                                                    border: Border.all(width: 1, color: AppTheme.appBackgroundColor(context)),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                    child: Image.asset(
                                                      'assets/images/getapk_button.png',
                                                      fit: BoxFit.cover,
                                                      width: containerSizeDraft * 0.3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            if (projectList[index].ipaUrl != '')
                                              InkWell(
                                                onTap: () => urlLauncher(Uri.parse(projectList[index].ipaUrl)),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10), // Rounded corners
                                                    border: Border.all(width: 1, color: AppTheme.appBackgroundColor(context)),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                    child: Image.asset(
                                                      'assets/images/testflight_button.png',
                                                      fit: BoxFit.cover,
                                                      width: containerSizeDraft * 0.3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
            );
          }),
    ),
  );
}
