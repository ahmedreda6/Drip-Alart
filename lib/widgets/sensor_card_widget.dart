import 'package:brain_box/models/prams.dart';
import 'package:brain_box/screens/sensor_ditals.dart';
import 'package:brain_box/widgets/custom_no_error_handling.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SensorCardWidget extends StatefulWidget {
  const SensorCardWidget({super.key});

  @override
  State<SensorCardWidget> createState() => _SensorCardWidgetState();
}

class _SensorCardWidgetState extends State<SensorCardWidget> {
  final double width = 208;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Stream<List<DocumentSnapshot>>? _subcollectionStream;

  @override
  void initState() {
    super.initState();
    _initSubcollectionListener();
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
          return const CustomNoSensoorHandling(); // Updated custom widget name
        } else {
          List<DocumentSnapshot> docs =
              snapshot.data!; // Corrected type handling

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
                      builder: (context) => SensorDitalsView(
                        // Corrected class name
                        pramsSensor: PramsSensor(
                          uid: data['uid'].toString(),
                          temperature: data['temperature'] ??
                              50, // Provide default value if null
                          index: index.toString(),
                          humiditylevel:
                              int.tryParse(data['humidity level'].toString()) ??
                                  70, // Corrected parsing
                          risklevel: data['risklevel'] ?? 50,
                          left: ((width * (data['risklevel'] ?? 20)) /
                              100), // Handle null values
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
                                '${data['humidity level']} %' ,
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
                                    left: ((width * (data['risklevel'] ?? 20)) /
                                        100), // Handle null values
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
}
