import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/theme.dart';
import '../models/animation_controllers.dart';
import '../models/animations_model.dart';
import 'typing_text_effect.dart';

Widget buildMobileBody(
  BuildContext context,
  AnimationModels aAnimationModels,
  AnimationControllers animationControllers,
  bool hideloader,
  bool showText,
) {
  List<bool> isIconsHover = [false, false, false];
  void onMouseEnter(bool isMouseEnter) {
    if (isMouseEnter) {
      animationControllers.flipController.forward(); // Start flipping on mouse enter
    } else {
      animationControllers.flipController.reverse(); // Reverse flip on mouse exit
    }
  }

  void onTap() {
    // On tap, toggle the flip state
    if (animationControllers.flipController.isCompleted || animationControllers.flipController.velocity > 0) {
      animationControllers.flipController.reverse();
    } else {
      animationControllers.flipController.forward();
    }
  }

  Future<void> urlLauncher(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
    }
  }

  return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SlideTransition(
            position: aAnimationModels.upwardMoveAnimation, // Use the upward move animation
            child: SlideTransition(
              position: aAnimationModels.moveAnimation, // Use the move animation for vertical movement
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Radial gradient and Lottie animations
                  if (!hideloader)
                    Opacity(
                      opacity: 0.05,
                      child: Lottie.asset(
                        'assets/animations/animation_1727694415537.json',
                        controller: animationControllers.loadingController, // Attach the Lottie controller
                        width: 340,
                        height: 340,
                        fit: BoxFit.cover,
                        onLoaded: (composition) {
                          animationControllers.loadingController.duration = const Duration(seconds: 5);
                        },
                      ),
                    ),

                  // Fade-in image and Lottie animation together
                  FadeTransition(
                    opacity: aAnimationModels.fadeAnimation,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 240,
                          height: 240,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.transparent,
                                Colors.amber.withOpacity(0.9),
                              ],
                              stops: const [0.8, 1],
                            ),
                          ),
                        ),
                        Opacity(
                          opacity: 0.3,
                          child: Lottie.asset(
                            'assets/animations/animation_1727632377489.json',
                            controller: animationControllers.lottieController, // Attach the Lottie controller
                            width: 290,
                            height: 290,
                            fit: BoxFit.cover,
                            onLoaded: (composition) {
                              animationControllers.lottieController.duration = composition.duration;
                            },
                          ),
                        ),
                        MouseRegion(
                          onEnter: (_) => onMouseEnter(true), // Detect mouse enter
                          onExit: (_) => onMouseEnter(false), // Detect mouse exit
                          child: GestureDetector(
                            onTap: onTap, // Detect click to toggle flip
                            child: AnimatedBuilder(
                              animation: animationControllers.flipController,
                              builder: (context, child) {
                                // Calculate the rotation value for the flip effect
                                final angle = aAnimationModels.flipAnimation.value * pi;
                                final isFront = angle < pi / 2;

                                return Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001) // Perspective to give the flip depth
                                    ..rotateY(angle), // Rotate along Y-axis
                                  alignment: Alignment.center,
                                  child: isFront
                                      ? Image.asset(
                                          'assets/images/profile_pic_flip.png',
                                          width: 230,
                                          height: 230,
                                          fit: BoxFit.cover,
                                        )
                                      : Transform(
                                          transform: Matrix4.identity()..rotateY(pi),
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/profile_pic.png',
                                            width: 230,
                                            height: 230,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showText)
            FadeTransition(
              opacity: aAnimationModels.textFadeAnimation,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 250),
                  const Text("Hello, This is", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text("IRAKLI KIKVADZE", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  const TypingTextEffect(
                    texts: ['Mobile Developer', 'Embedded Developer', 'PCB Designer'],
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () => urlLauncher(Uri.parse('https://github.com/Kikvano')),
                          onHover: (value) => setState(() {
                            isIconsHover[0] = value;
                          }),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image.asset(
                            'assets/images/github_icon_128.png',
                            width: 80,
                            height: 80,
                            color: isIconsHover[0] ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context),
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          onTap: () => urlLauncher(Uri.parse('https://linkedin.com/in/irakli-kikvadze-a79151314')),
                          onHover: (value) => setState(() {
                            isIconsHover[1] = value;
                          }),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image.asset(
                            'assets/images/linkedin_icon_128.png',
                            width: 80,
                            height: 80,
                            color: isIconsHover[1] ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context),
                            fit: BoxFit.cover,
                          ),
                        ),
                        InkWell(
                          onTap: () => urlLauncher(Uri(scheme: 'mailto', path: 'kikvano@gmail.com')),
                          onHover: (value) => setState(() {
                            isIconsHover[2] = value;
                          }),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Image.asset(
                            'assets/images/email_icon_128.png',
                            width: 80,
                            height: 80,
                            color: isIconsHover[2] ? AppTheme.primaryActionColor(context) : AppTheme.primaryTextColor(context),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  });
}
