import 'package:flutter/material.dart';

class MealsTrait extends StatelessWidget {
  const MealsTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 7.0,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
            )),
      ],
    );
  }
}
