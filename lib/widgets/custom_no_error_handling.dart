import 'package:brain_box/widgets/sensor_animation.dart';
import 'package:flutter/material.dart';

class CustomNoSensoorHandling extends StatelessWidget {
  const CustomNoSensoorHandling({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 300,
        ),
        Center(
          child: Text(
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              // fontWeight: FontWeight.w400,
              fontFamily: 'Poppins',
            ),
            'No sensor found , Try Add one!',
          ),
        ),
        SensorAnimation(),
      ],
    );
  }
}
