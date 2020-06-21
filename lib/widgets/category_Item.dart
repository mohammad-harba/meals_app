import 'package:flutter/material.dart';
import '../screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;

  CategoryItem(this.title, this.color,this.id);

  void mealsListScreen(context) {
    Navigator.of(context).pushNamed(
      MealsScreen.routName , arguments: {
        "id":id,
        "title":title,
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => mealsListScreen(context),
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }
}
