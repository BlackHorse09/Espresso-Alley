import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onButtonPress;
  final String label;
  const AppButton(
      {super.key, required this.label, required this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        onPressed: onButtonPress,
        child: Text(label,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600)));
  }
}
