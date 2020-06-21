import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  // final String id;
  // final String title;

  // MealsScreen(this.id,this.title);

  static const routName = "/meals-screen";

  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context).settings.arguments as Map;
    final String title = routArgs["title"];
    final String id = routArgs["id"];
    final List mealsCategories = DUMMY_MEALS.where((element) {
      return element.categories.contains(id);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Column(
              children: [
                MealItem(
                  id: mealsCategories[index].id,
                  title: mealsCategories[index].title,
                  imageUrl: mealsCategories[index].imageUrl,
                  duration: mealsCategories[index].duration,
                  complexity: mealsCategories[index].complexity,
                  affordability: mealsCategories[index].affordability,
                ),
              ],
            );
          },
          itemCount: mealsCategories.length,
        ));
  }
}
