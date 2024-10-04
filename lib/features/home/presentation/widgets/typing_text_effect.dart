import 'dart:async';

import 'package:flutter/material.dart';

class TypingTextEffect extends StatefulWidget {
  final List<String> texts;
  final Duration typingSpeed;
  final Duration delayBetweenTexts;

  const TypingTextEffect({
    super.key,
    required this.texts,
    this.typingSpeed = const Duration(milliseconds: 100),
    this.delayBetweenTexts = const Duration(seconds: 2),
  });

  @override
  TypingTextEffectState createState() => TypingTextEffectState();
}

class TypingTextEffectState extends State<TypingTextEffect> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _characterCount;
  int _currentTextIndex = 0;
  //bool _isDeleting = false;
  Timer? _delayTimer;

  @override
  void initState() {
    super.initState();

    // Initialize the controller with a longer duration for typing and deleting
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: widget.texts[_currentTextIndex].length * widget.typingSpeed.inMilliseconds,
      ),
    );

    // Animation that controls the typing effect
    _characterCount = StepTween(begin: 0, end: widget.texts[_currentTextIndex].length).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    // Start the typing animation
    _startTyping();
  }

  @override
  void dispose() {
    _controller.dispose();
    _delayTimer?.cancel();
    super.dispose();
  }

  // Start typing animation
  void _startTyping() {
    _controller.forward().then((_) {
      // Delay between typing and deleting
      _delayTimer = Timer(widget.delayBetweenTexts, () {
        setState(() {
          //_isDeleting = true; // Start deleting after typing
        });
        _controller.reverse().then((_) {
          // Move to the next text after deleting
          setState(() {
            _currentTextIndex = (_currentTextIndex + 1) % widget.texts.length;
            //_isDeleting = false; // Reset deleting flag
          });
          _controller.duration = Duration(
            milliseconds: widget.texts[_currentTextIndex].length * widget.typingSpeed.inMilliseconds,
          );
          _characterCount = StepTween(begin: 0, end: widget.texts[_currentTextIndex].length).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

          // Recursively loop through texts
          _startTyping();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        String currentText = widget.texts[_currentTextIndex].substring(0, _characterCount.value);
        return Text(
          currentText,
          style: const TextStyle(fontSize: 25, color: Colors.amber, fontWeight: FontWeight.bold
              //fontFamily: 'Courier',
              //letterSpacing: 2,
              ),
        );
      },
    );
  }
}
