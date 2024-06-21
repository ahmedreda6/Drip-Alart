import 'package:flutter/material.dart';

class WelcomeCustomButton extends StatelessWidget {
  const WelcomeCustomButton(
      {super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Urbanist',
            ),
          ),
        ),
      ),
    );
  }
}
