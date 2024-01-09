import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text; // Add a 'text' parameter of type String

  const MyButton({
    required this.onTap,
    required this.text, // Ensure the 'text' parameter is required
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Your button design and styling
        child: Text(
          text, // Use the 'text' parameter to display the button text
          style: TextStyle(
            // Your text style
          ),
        ),
      ),
    );
  }
}
