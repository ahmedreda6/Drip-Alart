import 'package:flutter/material.dart';

class EditInformationCustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController controller;
  final bool readOnly;

  const EditInformationCustomTextField({
    super.key,
    this.suffix,
    this.prefix,
    this.hintText,
    required this.controller,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          prefixIcon: prefix,
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black45,
            fontFamily: 'poppins',
            fontSize: 15,
          ),
          suffixIcon: suffix,
        ),
      ),
    );
  }
}
