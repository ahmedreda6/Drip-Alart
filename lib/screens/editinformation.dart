import 'package:brain_box/models/user_model.dart';
import 'package:brain_box/widgets/custom_button.dart';
import 'package:brain_box/widgets/editInformation_custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditInformationScreen extends StatefulWidget {
  const EditInformationScreen({super.key});

  @override
  State<EditInformationScreen> createState() => _EditInformationScreenState();
}

class _EditInformationScreenState extends State<EditInformationScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final firebaseFirestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!.data() as Map<String, dynamic>;
            final user = UsrerModel.fromJason(data);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 42,
                  ),
                  Container(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        const Text(
                          'Edit Information',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 122,
                  ),
                  EditInformationCustomTextField(
                    hintText: user.userName,
                    controller: userName,
                    readOnly: false,
                    prefix: const Icon(Icons.person),
                    suffix: const Icon(Icons.edit),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  EditInformationCustomTextField(
                    hintText: user.email,
                    readOnly: false,
                    controller: email,
                    prefix: const Icon(Icons.email),
                    suffix: const Icon(Icons.edit),
                  ),
                  const SizedBox(
                    height: 54,
                  ),
                  GestureDetector(
                    onTap: () {
                      firebaseFirestore
                          .collection('users')
                          .doc(currentUser.uid)
                          .update({
                        'username': userName.text,
                        'email': email.text,
                      });
                    },
                    child: CustomButton(title: 'Save Changes'),
                  )
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
