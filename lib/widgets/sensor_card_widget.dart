import 'package:brain_box/models/prams.dart';
import 'package:brain_box/screens/sensor_ditals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SensorCardWidget extends StatefulWidget {
  const SensorCardWidget({
    super.key,
  });

  @override
  State<SensorCardWidget> createState() => _SensorCardWidgetState();
}

class _SensorCardWidgetState extends State<SensorCardWidget> {
  final double width = 208;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('sensors').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final data = snapshot.data?.docs ?? [];

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SensorDitalsView(
                        pramsSensor: PramsSensor(
                          uid: data[index]['uid'].toString(),
                          temperature: data[index]['temperature'],
                          index: index.toString(),
                          humiditylevel:
                              int.parse(data[index]['humidity level']),
                          risklevel: data[index]['risklevel'],
                          left: ((width * data[index]['risklevel']) / 100),
                        ),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/Group 682.png'),
                              const SizedBox(
                                width: 15,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Sensor ${index + 1}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                  const Text(
                                    'Humidity level',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 105,
                              ),
                              Text(
                                '${data[index]['humidity level']} %',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Risk Level :',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/Frame 683.png',
                                    height: 75,
                                    width: width,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: ((width * data[index]['risklevel']) /
                                        100),
                                    child: Image.asset(
                                      'assets/Polygon 1.png',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }
}
