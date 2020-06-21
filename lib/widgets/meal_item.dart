import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  void selectMeal(context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routName,
      arguments: id,
    );
  }

  String complexityText(Complexity complexity) {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;

      case Complexity.Challenging:
        return "Challenging";
        break;

      case Complexity.Hard:
        return "Hard";
        break;

      default:
        return " not found";
    }
  }

  affordabilityText(affordability) {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;

      case Affordability.Pricey:
        return "Pricey";
        break;

      case Affordability.Luxurious:
        return "Luxurious";
        break;

      default:
        return " not found";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    width: 300,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.description),
                      Text(complexityText(complexity)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      Text(affordabilityText(affordability)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
