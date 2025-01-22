import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteMealsProvider extends StateNotifier<List<Meal>> {
  FavouriteMealsProvider() : super([]);

  void toggle_favourite_click(Meal meal) {
    if (state.contains(meal)) {
      // Meal is already present remove the meal
      state = state.where((mealToRemove) => mealToRemove != meal).toList();

      // print(state);
    } else {
      // Meal is not present add the meal
      state = [...state, meal];

      // print(state);
    }
  }
}

final favourite_meal_provider =
    StateNotifierProvider<FavouriteMealsProvider, List<Meal>>((ref) {
  return FavouriteMealsProvider();
});
