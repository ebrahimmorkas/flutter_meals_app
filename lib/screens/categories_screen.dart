import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/single_category.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/gluten_free_meals_provider.dart';
// import 'package:meals_app/models/meal.dart';

class CategoriesScreen extends ConsumerWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final finalMeals = ref.watch(gluten_free_meals);
    void selectedCategory(String mealTitle, Category category) {
      // print(mealTitle);
      List filteredMeal = finalMeals
          .where((meal) => meal.categories.contains(category.id))
          .toList();

      // for (var element in filteredMeal) {
      //   print(element.categories);
      // }
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return MealsScreen(meals: filteredMeal, title: mealTitle);
        },
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Meals App"),
      ),
      body: GridView(
          padding: EdgeInsets.all(17),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: availableCategories
              .map((category) => SingleCategory(
                    category: category,
                    selectedCategory: selectedCategory,
                  ))
              .toList()),
    );

    // return Column(
    //     children: availableCategories
    //         .map((category) => SingleCategory(category: category))
    //         .toList());
  }
}
