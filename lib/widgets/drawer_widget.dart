import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Navigator.pop(context);
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
    );
  }
}
