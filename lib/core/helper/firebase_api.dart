import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DataDisplayScreen extends StatefulWidget {
  const DataDisplayScreen({super.key});

  @override
  _DataDisplayScreenState createState() => _DataDisplayScreenState();
}

class _DataDisplayScreenState extends State<DataDisplayScreen> {
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref('frfrf534543');
  int? humidity;
  int? temperature;

  @override
  void initState() {
    super.initState();
    databaseRef.onValue.listen((DatabaseEvent event) {
      final data = Map<String, dynamic>.from(event.snapshot.value as Map);
      setState(() {
        humidity = data['h'];
        temperature = data['t'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Humidity: ${humidity ?? "Loading..."}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Temperature: ${temperature ?? "Loading..."}',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
