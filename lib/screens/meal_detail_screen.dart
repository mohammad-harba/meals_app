import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routName = "/meal-details-screen";

  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context).settings.arguments as String;
    final String mealId = routArgs;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) {
      return element.id == mealId;
    });

    Widget buildSectionTitle(context, title) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(5),
        height: MediaQuery.of(context).size.width * 0.3,
        width: 300,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        child: Text(selectedMeal.ingredients[index])),
                  );
                },
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Text(
                          selectedMeal.steps[index],
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey,)
                  ],
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
