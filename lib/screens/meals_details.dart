import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';
import 'package:transparent_image/transparent_image.dart';

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
    // final favouriteMeals = ref.watch(favourite_meal_provider);
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
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  width: double.infinity,
                  height: 300,
                  image: widget.meal.imageUrl,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Ingredients",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                for (var ingredient in widget.meal.ingredients)
                  Text(
                    ingredient,
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Steps for preparing this recipe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                for (var step in widget.meal.steps)
                  Text(
                    step,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
