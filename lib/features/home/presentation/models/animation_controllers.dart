import 'package:flutter/material.dart';

class AnimationControllers {
  final AnimationController loadingController; // Controller for radial gradient zoom-in
  final AnimationController fadeController; // Controller for fade-in of image and Lottie
  final AnimationController textFadeController; // Controller for fade-in text
  final AnimationController lottieController; // Controller for Lottie animation (repeat)
  final AnimationController moveController; // Controller for the up and down movement (repeat)
  final AnimationController upwardMoveController; // Controller for the upward move animation
  final AnimationController flipController; // Controller for the flip animation

  AnimationControllers({
    required this.loadingController,
    required this.fadeController,
    required this.textFadeController,
    required this.lottieController,
    required this.moveController,
    required this.upwardMoveController,
    required this.flipController,
  });
}
