import 'package:flutter/material.dart';

class CustomHumidityTriangle extends StatelessWidget {
  const CustomHumidityTriangle({
    super.key,
    required this.humiditylevel,
  });
  final dynamic humiditylevel;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset('assets/Polygon 3.png'),
      Positioned.fill(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Humidity level",
            style: TextStyle(
                fontSize: 22,
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            '$humiditylevel%',
            style: const TextStyle(
                fontSize: 35,
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ))
    ]);
  }
}
