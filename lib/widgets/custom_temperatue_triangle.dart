import 'package:flutter/material.dart';

class CustomTemperatureTriangle extends StatelessWidget {
  const CustomTemperatureTriangle({
    super.key,
    required this.temperature,
  });
  final dynamic temperature;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset('assets/Polygon 2.png'),
      Positioned.fill(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            '$temperature%',
            style: const TextStyle(
                fontSize: 35,
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            'Temperature',
            style: TextStyle(
                fontSize: 22,
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
        ],
      ))
    ]);
  }
}
