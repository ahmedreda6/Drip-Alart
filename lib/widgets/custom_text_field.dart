import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPasswordField;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final Widget? prefix;
  final Widget? suffix;
  final double? height;

  const CustomTextFormField(
      {super.key,
      this.height,
      this.suffix,
      this.prefix,
      this.controller,
      this.isPasswordField,
      
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType});

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.35),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: widget.controller,
        // keyboardType: widget.inputType,
        // key: widget.fieldKey,
        obscureText: widget.isPasswordField == true ? _obscureText : false,
        // onSaved: widget.onSaved,
        // validator: (data) {
        //   if (data!.isEmpty) {
        //     return 'field is requerid';
        //   }
        //   return null;
        // },
        // onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          prefixIcon: widget.prefix,
          border: InputBorder.none,
          filled: true,
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black45),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: widget.isPasswordField == true
                ? Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: _obscureText == false ? Colors.blue : Colors.grey,
                  )
                : const Text(""),
          ),
        ),
      ),
    );
  }
}
