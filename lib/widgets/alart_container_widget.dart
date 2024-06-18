import 'package:brain_box/widgets/custom_ditals_sensor_card.dart';
import 'package:flutter/material.dart';

class AlertContainerWidget extends StatelessWidget {
  const AlertContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffF1F1F1),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                Icon(
                  Icons.error,
                  color: Colors.red,
                  size: 40,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You have a new alert',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Some of your sensors detect a dangours level of humidity ',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'tha means thers is a water leak you have to ',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Text(
                      'take an action before the water damage the infected place ',
                      style: TextStyle(
                        fontSize: 11,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomDitalsSensorCard(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Temperature : 13 c',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xffA76A6A),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Humidity level : 78 %',
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xff577285),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
