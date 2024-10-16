import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../../../../core/utils/rsponsive.dart';
import '../models/animation_controllers.dart';
import '../models/animations_model.dart';
import '../widgets/appbar.dart';
import '../widgets/desktop_body.dart';
import '../widgets/mobile_body.dart';
import '../../../../core/widgets/mobile_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationControllers animationControllers;
  late AnimationModels aAnimationModels;
  bool hideloader = false;
  bool showText = false;

  void _initializeAnimations() {
    // Set animationControllers
    animationControllers = AnimationControllers(
      loadingController: AnimationController(vsync: this, duration: const Duration(milliseconds: 1500)),
      fadeController: AnimationController(vsync: this, duration: const Duration(milliseconds: 2000)),
      textFadeController: AnimationController(vsync: this, duration: const Duration(milliseconds: 2000)),
      lottieController: AnimationController(vsync: this),
      moveController: AnimationController(vsync: this, duration: const Duration(seconds: 2))..repeat(reverse: true),
      upwardMoveController: AnimationController(vsync: this, duration: const Duration(seconds: 2)),
      flipController: AnimationController(duration: const Duration(milliseconds: 600), vsync: this),
    );

    // Set aAnimationModels
    aAnimationModels = AnimationModels(
      fadeAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(animationControllers.fadeController),
      textFadeAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(animationControllers.textFadeController),
      moveAnimation: Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -0.01)).animate(
        CurvedAnimation(parent: animationControllers.moveController, curve: Curves.easeInOut),
      ),
      upwardMoveAnimation: Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, -0.6)).animate(
        CurvedAnimation(parent: animationControllers.upwardMoveController, curve: Curves.easeInOut),
      ),
      sideMoveAnimation: Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.6, 0)).animate(
        CurvedAnimation(parent: animationControllers.upwardMoveController, curve: Curves.easeInOut),
      ),
      flipAnimation: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: animationControllers.flipController, curve: Curves.easeInOut),
      ),
    );

    // Start the Loading animation
    animationControllers.loadingController.forward();
    // When the Loading completes, start the fade in for both image and Lottie
    animationControllers.loadingController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) animationControllers.fadeController.forward();
    });
    // When the fade in completes, start the _upwardMoveController
    animationControllers.fadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationControllers.upwardMoveController.forward();
        setState(() => hideloader = true); //hide loader lottie
      }
    });
    // When the profile moves up
    animationControllers.upwardMoveController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationControllers.textFadeController.forward();
        setState(() => showText = true);
        if (animationControllers.flipController.isCompleted || animationControllers.flipController.velocity > 0) {
          animationControllers.flipController.reverse();
        } else {
          animationControllers.flipController.forward();
        }
      }
    });

    // Start Lottie repeating
    animationControllers.lottieController.repeat(period: const Duration(milliseconds: 10000));
  }

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.appBackgroundColor(context),
      appBar: Responsive.isMobile(context) ? appBar(context, showText) : null,
      drawer: Responsive.isMobile(context) ? buildMobileMenu(context, 0) : null,
      body: Responsive.isMobile(context)
          ? buildMobileBody(
              context,
              aAnimationModels,
              animationControllers,
              hideloader,
              showText,
            )
          : buildDesktopBody(
              context,
              aAnimationModels,
              animationControllers,
              hideloader,
              showText,
            ),
      //: Container(),
    );
  }

  @override
  void dispose() {
    animationControllers.loadingController.dispose();
    animationControllers.fadeController.dispose();
    animationControllers.lottieController.dispose();
    animationControllers.moveController.dispose();
    animationControllers.upwardMoveController.dispose();
    animationControllers.flipController.dispose();
    super.dispose();
  }
}
