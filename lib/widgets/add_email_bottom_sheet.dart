import 'dart:convert';

import 'package:brain_box/models/user_model.dart';
import 'package:brain_box/widgets/custom_button.dart';
import 'package:brain_box/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddEmailBottomSheet extends StatefulWidget {
  const AddEmailBottomSheet({super.key});

  @override
  State<AddEmailBottomSheet> createState() => _AddEmailBottomSheetState();
}

class _AddEmailBottomSheetState extends State<AddEmailBottomSheet> {
  final GlobalKey<FormState> formkey = GlobalKey();
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
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
                height: 40,
              ),
              CustomTextFormField(
                controller: emailController,
                hintText: 'User email',
              ),
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: ()
                    // async
                    {
                  // final newMemper = FirebaseFirestore.instance
                  //     .collection('users')
                  //     .doc(auth.currentUser?.uid)
                  //     .set({
                  //   'group member': GroupMember(emailController.text).toJason()
                  // });
                  // newMemper.whenComplete;
                  // setState(() {});
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
}
