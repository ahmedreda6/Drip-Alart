import 'package:brain_box/models/prams.dart'; // Check this import path
import 'package:brain_box/screens/sensor_ditals.dart';
import 'package:brain_box/widgets/custom_no_error_handling.dart'; // Check this widget path
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SensorCardWidget extends StatefulWidget {
  const SensorCardWidget({super.key});

  @override
  State<SensorCardWidget> createState() => _SensorCardWidgetState();
}

class _SensorCardWidgetState extends State<SensorCardWidget> {
  final DatabaseReference databaseRef =
      FirebaseDatabase.instance.ref('f91f5120-d376-421e-adcf-4c445d440c99');
  double? humidity;
  double? temperature;

  final double width = 208;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<DocumentSnapshot>>? _subcollectionStream;

  @override
  void initState() {
    super.initState();

    databaseRef.onValue.listen((DatabaseEvent event) {
      if (!mounted) return;

      final data = Map<String, dynamic>.from(event.snapshot.value as Map);
      setState(() {
        humidity = _toDouble(data['h']);
        temperature = _toDouble(data['t']);
      });
    });
    _initSubcollectionListener();
  }

  double? _toDouble(dynamic value) {
    if (value is int) {
      return value.toDouble();
    } else if (value is double) {
      return value;
    } else if (value is String) {
      return double.tryParse(value);
    }
    return null;
  }

  void _initSubcollectionListener() {
    User? user = _auth.currentUser;

    if (user != null) {
      CollectionReference subcollectionRef = _firestore
          .collection('users')
          .doc(user.uid)
          .collection('usersensors');

      _subcollectionStream = subcollectionRef.snapshots().map((snapshot) {
        return snapshot.docs;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DocumentSnapshot>>(
      stream: _subcollectionStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const CustomNoErrorHandling(); // Updated custom widget name
        } else {
          List<DocumentSnapshot> docs = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> data =
                  docs[index].data() as Map<String, dynamic>;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SensorDetailsView(
                        // Corrected class name
                        pramsSensor: PramsSensor(
                          uid: data['uid'].toString(),
                          index: index.toString(),
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
                              const SizedBox(width: 15),
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
                              const Spacer(),
                              Text(
                                '${humidity?.toStringAsFixed(1) ?? "Loading..."}%',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
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
                              const SizedBox(width: 8),
                              Stack(
                                children: [
                                  Image.asset(
                                    'assets/Frame 683.png',
                                    height: 75,
                                    width: width,
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: (width *
                                            calculateTrianglePosition(
                                                humidity ?? 50)) /
                                        100, // Handle null values and ensure correct calculation
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
        }
      },
    );
  }

  double calculateTrianglePosition(double humidity) {
    double maxPosition = humidity; // Width of the background image
    if (humidity < 25) {
      // Position for green (0% to 25%)
      return maxPosition * 0.125;
    } else if (humidity < 50) {
      // Position for green to yellow (25% to 50%)
      return maxPosition * 0.375;
    } else if (humidity < 75) {
      // Position for yellow to orange (50% to 75%)
      return maxPosition * 0.625;
    } else {
      // Position for orange to red (75% to 100%)
      return maxPosition * 0.875;
    }
  }
}
