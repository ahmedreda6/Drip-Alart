import 'package:brain_box/widgets/custom_button.dart';
import 'package:brain_box/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
                onTap: () async {
                  final uid = const Uuid().v4();
                  final newdocument =
                      FirebaseFirestore.instance.collection('sensors').doc(uid);
                  final json = {
                    'humidity level': '0',
                    'risklevel': 0,
                    'temperature': 0,
                    'uid': uid,
                  };
                  await newdocument.set(json);
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
}
