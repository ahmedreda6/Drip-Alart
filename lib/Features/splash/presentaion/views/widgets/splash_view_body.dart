import 'package:brain_box/Features/splash/presentaion/views/widgets/sliding_text.dart';
import 'package:brain_box/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    nivagateToHome();
    animationController =
        AnimationController(vsync: this, duration: Durations.extralong4);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 150,
        ),
        Lottie.asset(
          controller: animationController,
          'assets/animation/Animation - 1718856600916.json',
        ),
        const ProjectName(),
      ],
    );
  }

  void nivagateToHome() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Welcomeview(),
            ));
      },
    );
  }
}
