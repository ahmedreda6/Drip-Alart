import 'package:brain_box/core/utils/app_router.dart';
import 'package:brain_box/core/widgets/project_name.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push(AppRouter.kBottonNavBar);
      },
    );
  }
}
