import 'package:brain_box/widgets/custom_button.dart';
import 'package:brain_box/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

class AddSensorBottomSheet extends StatefulWidget {
  const AddSensorBottomSheet({super.key});

  @override
  State<AddSensorBottomSheet> createState() => _AddSensorBottomSheetState();
}

class _AddSensorBottomSheetState extends State<AddSensorBottomSheet> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              const SizedBox(
                height: 16,
              ),
              const CustomTextFormField(
                hintText: 'Sensor Name',
              ),
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  addSubcollection();

                  setState(() {});

                  Navigator.pop(context);
                },
                child: const CustomButton(title: 'Add'),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addSubcollection() async {
    final uid = const Uuid().v4();
    User? user = auth.currentUser;
    if (user != null) {
      DocumentReference userDocRef =
          firestore.collection('users').doc(user.uid);

      CollectionReference subcollectionRef =
          userDocRef.collection('usersensors');

      await subcollectionRef.doc(uid).set({
        'uid': uid,
      });
    }
  }
}
