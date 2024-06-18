import 'package:brain_box/models/user_model.dart';
import 'package:brain_box/widgets/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({super.key});
  static String id = 'Add Member Screen';

  @override
  State<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  TextEditingController emailController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 157,
            ),
            Column(
              children: [
                const Text(
                  'Add Members To',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Your Group',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Your group members will get',
                  style: TextStyle(
                    color: Color(0xff4A4A4A),
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'notified when leak detect',
                  style: TextStyle(
                    color: Color(0xff4A4A4A),
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'in your added sensors',
                  style: TextStyle(
                    color: Color(0xff4A4A4A),
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'User email',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 9,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 38,
                ),
                GestureDetector(
                  onTap: () async {
                    await _updateMethod().whenComplete(
                        () => Navigator.pushNamed(context, 'BottomNavBar'));
                  },
                  child: CustomButton(title: 'Add'),
                ),
                const SizedBox(
                  height: 165,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'BottomNavBar');
                      },
                      child: const Card(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text('Skip'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future _updateMethod() async {
    await firestore
        .collection('users')
        .doc(auth.currentUser?.uid)
        .update({'group member': GroupMember(emailController.text).toJason()});
  }
}
