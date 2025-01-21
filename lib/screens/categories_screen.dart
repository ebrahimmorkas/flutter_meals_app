import 'package:flutter/material.dart';
import 'package:meals_app/widgets/single_category.dart';
import 'package:meals_app/data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              .map((category) => SingleCategory(category: category))
              .toList()),
    );

    // return Column(
    //     children: availableCategories
    //         .map((category) => SingleCategory(category: category))
    //         .toList());
  }
}
