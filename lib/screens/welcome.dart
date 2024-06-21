import 'package:brain_box/core/utils/app_router.dart';
import 'package:brain_box/widgets/welcome_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Welcomeview extends StatelessWidget {
  const Welcomeview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 125,
          ),
          Center(
            child: Image.asset(
              'assets/drip 1.png',
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          const Text(
            'Welcome to',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              fontFamily: 'Urbanist',
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Drip',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Urbanist',
                ),
              ),
              Text(
                'Alart',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Urbanist',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 63,
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kLoginView);
            },
            child: WelcomeCustomButton(
              title: 'Login',
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSignUpView);
            },
            child: WelcomeCustomButton(
              title: 'Sign Up',
              color: const Color(0xffE3E3E3),
            ),
          ),
        ],
      ),
    );
  }
}
