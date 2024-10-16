import 'dart:math';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/screensize.dart';
import '../../domain/entities/projects_entity.dart';

Widget buildMobileBody(
  BuildContext context,
  List<ProjectEntity> projectList,
  List<bool> isVisible,
  List<AnimationController> flipController,
  List<Animation> flipAnimation,
) {
  final List<int> delays = List.generate(projectList.length, (index) => index * 100); // Staggered delays

  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Center(
      child: ListView.builder(
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
  void onTap() {
    // On tap, toggle the flip state
    if (flipController[index].isCompleted || flipController[index].velocity > 0) {
      flipController[index].reverse();
    } else {
      flipController[index].forward();
    }
  }

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
                  ? Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 15),
                      width: ScreenSize.width(context) - 20,
                      height: ScreenSize.width(context) - 20,
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
                              height: (ScreenSize.width(context) - 22) * 3 / 4,
                              //width: double.infinity,
                              child: Image.asset(projectList[index].imgUrl, fit: BoxFit.cover),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              height: (ScreenSize.width(context) - 22) * 1 / 4,
                              color: AppTheme.primaryTextColor(context).withAlpha(50),
                              //color: AppTheme.primaryTextColor(context).withAlpha(50),
                              child: Center(
                                child: AutoSizeText(
                                  projectList[index].projectDescription,
                                  style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 18, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Transform(
                      transform: Matrix4.identity()..rotateY(pi),
                      alignment: Alignment.center,
                      child: Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 15),
                          width: ScreenSize.width(context) - 20,
                          height: ScreenSize.width(context) - 20,
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
                                height: (ScreenSize.width(context) - 22) * 3 / 4,
                                child: Center(
                                  child: AutoSizeText(
                                    projectList[index].projectFullDescription,
                                    style: TextStyle(color: AppTheme.primaryTextColor(context), fontSize: 16, fontWeight: FontWeight.bold),
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
                                  height: (ScreenSize.width(context) - 22) * 1 / 4,
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        if (projectList[index].appStoreUrl != '')
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10), // Rounded corners
                                              border: Border.all(width: 1, color: AppTheme.appBackgroundColor(context)),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              child: Image.asset(
                                                'assets/images/appstore_button.png',
                                                fit: BoxFit.cover,
                                                width: (ScreenSize.width(context) - 20) * 0.3,
                                              ),
                                            ),
                                          ),
                                        if (projectList[index].playStoreUrl != '')
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10), // Rounded corners
                                              border: Border.all(width: 1, color: AppTheme.appBackgroundColor(context)),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              child: Image.asset(
                                                'assets/images/playstore_button.png',
                                                fit: BoxFit.cover,
                                                width: (ScreenSize.width(context) - 20) * 0.3,
                                              ),
                                            ),
                                          ),
                                        if (projectList[index].githubUrl != '')
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10), // Rounded corners
                                              border: Border.all(width: 1, color: AppTheme.appBackgroundColor(context)),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              child: Image.asset(
                                                'assets/images/github_button.png',
                                                fit: BoxFit.cover,
                                                width: (ScreenSize.width(context) - 20) * 0.3,
                                              ),
                                            ),
                                          ),
                                        if (projectList[index].liveDemoUrl != '')
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10), // Rounded corners
                                              border: Border.all(width: 1, color: AppTheme.appBackgroundColor(context)),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              child: Image.asset(
                                                'assets/images/web_button.png',
                                                fit: BoxFit.cover,
                                                width: (ScreenSize.width(context) - 20) * 0.3,
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
                    ),
            );
          }),
    ),
  );
}
