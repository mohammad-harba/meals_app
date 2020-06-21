import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';
import './screens/tabs_screen.dart';

import './screens/meal_detail_screen.dart';
import './screens/categories_screen.dart';
import './screens/meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: Theme.of(context).textTheme.copyWith(
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 22,
                fontFamily: "RobotoCondensed",
                fontWeight: FontWeight.bold,
              ))),
      //home: CategoriesScreen(),
      initialRoute: "/", // "/" is default
      routes: {
        "/": (ctx) => TabsScreen(),
        MealsScreen.routName: (ctx) => MealsScreen(),
        MealDetailScreen.routName: (ctx) => MealDetailScreen(),
        FiltersScreen.routName:(ctx)=>FiltersScreen(),
      },
      onGenerateRoute: (setting) {
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),
        );
      },
      onUnknownRoute: (setting){
        return MaterialPageRoute(
          builder: (context) => CategoriesScreen());
      },
    );
  }
}
