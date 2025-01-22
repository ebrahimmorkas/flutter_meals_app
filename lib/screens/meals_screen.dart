import 'package:flutter/material.dart';
// import 'package:meals_app/models/meal.dart';
// import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals_details.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals_app/widgets/meals_trait.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.title});
  // const MealsScreen({
  //   super.key,
  // });

  final List meals;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Uh Oh Nothing to show here",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Try selecting the different category",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MealsDetails(
                          title: meals[index].title,
                          meal: meals[index],
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                            15), // Apply rounded corners to the entire widget
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 8,
                          ),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              // Image with rounded corners
                              Container(
                                width: double.infinity,
                                height: 300,
                                child: FadeInImage.memoryNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: kTransparentImage,
                                  image: meals[index].imageUrl,
                                ),
                              ),
                              // Text with black transparent background
                              Container(
                                width: double.infinity,
                                color: Colors.black54,
                                padding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      meals[index].title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MealsTrait(
                                          icon: Icons.schedule,
                                          label: '${meals[index].duration} min',
                                        ),
                                        MealsTrait(
                                          icon: Icons.work,
                                          label: '${meals[index].complexity}',
                                        ),
                                        MealsTrait(
                                          icon: Icons.attach_money,
                                          label:
                                              '${meals[index].affordability}',
                                        ),
                                        // Icon(Icons.schedule),
                                        // const SizedBox(
                                        //   width: 7,
                                        // ),
                                        // Text(meals[index].duration + 'min'),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: meals.length,
            ),
    );
  }
}
