import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  String hintText;
  final TextInputType keyboardType;
  final Icon prefixIcon;
  final bool info;
  final String infoData;

  CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    required this.prefixIcon,
    this.info = false,
    this.infoData = "",
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorRadius: const Radius.circular(100),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          prefixIconColor: Colors.grey.shade700,
          labelStyle: const TextStyle(color: Colors.grey),
          labelText: hintText,
          prefixIcon: prefixIcon,
          suffixIconColor: Colors.grey[500],
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade200),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
          fillColor: Colors.grey[200],
          filled: true,
          suffixStyle: const TextStyle(color: Colors.red),
          hintStyle: const TextStyle(color: Colors.grey)),
    );
  }
}
