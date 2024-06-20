import 'package:flutter/material.dart';

class ProjectName extends StatelessWidget {
  const ProjectName({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
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
    );
  }
}
