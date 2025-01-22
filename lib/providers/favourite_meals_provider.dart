import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouriteMealsProvider extends StateNotifier {
  FavouriteMealsProvider() : super([]);

  void toggle_favourite_click(Meal meal) {
    if (state.contains(meal)) {
      print("The meal is present");
    } else {
      print("The meal is not present");
    }
  }
}

final favourite_meal_provider = StateNotifierProvider((ref) {
  return FavouriteMealsProvider();
});
