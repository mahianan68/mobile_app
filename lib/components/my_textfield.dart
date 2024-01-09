import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Key? key; // Added explicit type Key
  final TextEditingController controller; // Added explicit type TextEditingController
  final String hintText;
  final bool obscureText;

  const MyTextField({
    this.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[900]!), // Added exclamation mark to access non-nullable value
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade900),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
        ),
      ),
    );
  }
}
