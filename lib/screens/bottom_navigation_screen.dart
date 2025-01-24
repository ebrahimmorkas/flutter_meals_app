import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourite_meals_provider.dart';

class BottomNavigationScreen extends ConsumerStatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  ConsumerState<BottomNavigationScreen> createState() =>
      _BottomNavigationScreenState();
}

class _BottomNavigationScreenState
    extends ConsumerState<BottomNavigationScreen> {
  int selectedIndex = 0;

  void selectedTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // Crating the list that will store the list items marked as favourites.
  List<Meal> favourites_meals = [];

  // Creating the function that will be called when the meal item is added to or removed from the favourites.
  void handleFavouriteClick(Meal meal) {}
  @override
  Widget build(BuildContext context) {
    final favourites_meals = ref.watch(favourite_meal_provider);

    List<Widget> bottom_navigation_widgets = [
      CategoriesScreen(),
      MealsScreen(meals: favourites_meals, title: "Favourites"),
    ];
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 24.0,
                    color: Colors.greenAccent,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Cooking.....",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                size: 15.0,
                color: Colors.green,
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FiltersScreen();
                    },
                  ),
                );
              },
              leading: Icon(
                Icons.filter,
                size: 15.0,
                color: Colors.green,
              ),
              title: Text(
                "Filters",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
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
