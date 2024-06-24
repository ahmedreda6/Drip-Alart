import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SensorAnimation extends StatefulWidget {
  const SensorAnimation({super.key});

  @override
  State<SensorAnimation> createState() => _SensorAnimationState();
}

class _SensorAnimationState extends State<SensorAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      height: 75,
      width: 75,
      controller: animationController,
      'assets/animation/Animation - 1719185845619.json',
    );
  }
}
