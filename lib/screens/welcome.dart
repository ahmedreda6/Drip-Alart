import 'package:brain_box/widgets/welcome_custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              Navigator.pushNamed(context, 'loginScreen');
            },
            child: CustomButton.WelcomeCustomButton(
              title: 'Login',
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'signUpScreen');
            },
            child: CustomButton.WelcomeCustomButton(
              title: 'Sign Up',
              color: const Color(0xffE3E3E3),
            ),
          ),
        ],
      ),
    );
  }
}
