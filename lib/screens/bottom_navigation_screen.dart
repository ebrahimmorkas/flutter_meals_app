import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  void selectedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> bottom_navigation_widgets = [
    CategoriesScreen(),
    MealsScreen(meals: [], title: "Dynamic"),
  ];

  // Crating the list that will store the list items marked as favourites.
  List<Meal> favourites_meals = [];

  // Creating the function that will be called when the meal item is added to or removed from the favourites.
  void handleFavouriteClick(Meal meal) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: bottom_navigation_widgets.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favourites",
          ),
        ],
        currentIndex: selectedIndex,
        onTap: selectedTab,
        selectedItemColor: Colors.amber,
      ),
    );
  }
}
