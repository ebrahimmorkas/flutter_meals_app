import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory(
      {super.key, required this.category, required this.selectedCategory});

  final Category category;
  final void Function(String mealsTitle, Category category) selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
            onTap: () {
              selectedCategory(category.title, category);
            },
            child: Text(
              category.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )));
  }
}
