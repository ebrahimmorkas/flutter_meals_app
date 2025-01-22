import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealsDetails extends StatelessWidget {
  const MealsDetails({super.key, required this.title, required this.meal});

  final String title;
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
