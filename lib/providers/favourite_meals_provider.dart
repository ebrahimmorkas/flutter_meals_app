import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteMealsProvider extends StateNotifier<List<Meal>> {
  FavouriteMealsProvider() : super([]);

  bool toggle_favourite_click(Meal meal) {
    bool is_marked_favourite;
    if (state.contains(meal)) {
      // Meal is already present remove the meal
      state = state.where((mealToRemove) => mealToRemove != meal).toList();
      // Change this variable to false since now it is not favourite
      is_marked_favourite = false;
      // print(state);
    } else {
      // Meal is not present add the meal
      state = [...state, meal];
      is_marked_favourite = true;
      // print(state);
    }
    return is_marked_favourite;
  }
}

final favourite_meal_provider =
    StateNotifierProvider<FavouriteMealsProvider, List<Meal>>((ref) {
  return FavouriteMealsProvider();
});
