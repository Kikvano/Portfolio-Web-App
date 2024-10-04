import 'package:flutter/material.dart';

class AnimationModels {
  final Animation<double> fadeAnimation; // Animation for fading in the image and Lottie
  final Animation<double> textFadeAnimation; // Animation for text
  final Animation<Offset> moveAnimation; // Animation for up and down movement
  final Animation<Offset> upwardMoveAnimation; // Animation to move the widget upward and stop
  final Animation<Offset> sideMoveAnimation; // Animation to move the widget upward and stop
  final Animation<double> flipAnimation; // Flip animation

  AnimationModels({
    required this.fadeAnimation,
    required this.textFadeAnimation,
    required this.moveAnimation,
    required this.upwardMoveAnimation,
    required this.sideMoveAnimation,
    required this.flipAnimation,
  });
}
