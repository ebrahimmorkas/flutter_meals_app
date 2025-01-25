import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class GlutenFreeMeals extends StateNotifier<List<Meal>> {
  // List<Meal> mealsList = List.of(dummyMeals);
  GlutenFreeMeals() : super(List.of(dummyMeals));

  bool isGluttenFree = false;
  bool isVegan = false;
  bool vegetarian = false;
  bool isLactoseFree = false;

  List temp_list = [];

  void toggleGluten(bool toggle) {
    isGluttenFree = toggle;
    print(toggle);
    if (toggle) {
      // If toggle is true remove all the items that contains gluten
      // state = [];
      temp_list = [];
      for (var meal in dummyMeals) {
        if (meal.isGlutenFree == false) {
          temp_list = [...temp_list, meal];
        }
      }

      state = state.where((meal) => !temp_list.contains(meal)).toList();
    } else {
      // If toggle is false keep all the items that contain gluten
      isGluttenFree = toggle;
      temp_list = [];
      state = List.of(dummyMeals);
      // for (var meal in dummyMeals) {
      //   if (meal.isGlutenFree == true) {
      //     temp_list = [...temp_list, meal];
      //   }
      // }

      for (var meal in temp_list) {
        state = [...state, meal];
      }
    }
  }
}

final gluten_free_meals =
    StateNotifierProvider<GlutenFreeMeals, List<Meal>>((ref) {
  return GlutenFreeMeals();
});
