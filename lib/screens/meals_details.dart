import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';

class MealsDetails extends ConsumerStatefulWidget {
  const MealsDetails({super.key, required this.title, required this.meal});

  final String title;
  final Meal meal;
  @override
  ConsumerState<MealsDetails> createState() => _MealsDetailsState();
}

class _MealsDetailsState extends ConsumerState<MealsDetails> {
  @override
  Widget build(BuildContext context) {
    final favouriteMeals = ref.watch(favourite_meal_provider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(favourite_meal_provider.notifier)
                  .toggle_favourite_click(widget.meal);
            },
            icon: Icon(Icons.star),
          ),
        ],
      ),
    );
  }
}
