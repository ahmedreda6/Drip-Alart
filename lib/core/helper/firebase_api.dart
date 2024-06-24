import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class RealTimeSensorData extends StatelessWidget {
  RealTimeSensorData({super.key});
  final sensorData = FirebaseDatabase.instance.ref('frfrf534543');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseAnimatedList(
          query: sensorData,
          itemBuilder: (context, snapshot, animation, index) {
            return Card(
              child: Column(
                children: [
                  Text(snapshot.child('h').value.toString()),
                  Text(snapshot.child('t').value.toString()),
                ],
              ),
            );
          }),
    );
  }
}
