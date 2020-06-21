import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routName = "/filters-screen";

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool isGlutenFree = false;

  bool isLactoseFree = false;

  bool isVegetarian = false;

  bool isVegan = false;

  Widget buildSwitchListTile(
    String title,
    String subtitle,
    bool filterTarget,
    Function function,
  ) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: filterTarget,
        onChanged: function);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Filters"),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              child: Text("Adjust your meal selection"),
              padding: EdgeInsets.all(10),
            ),
            buildSwitchListTile(
              "Gluten Free",
              "Only Gluten Free meals",
              isGlutenFree,
              (newValue) {
                setState(() {
                  isGlutenFree = newValue;
                });
              },
            ),
            buildSwitchListTile(
              "Lactose Free",
              "Only Lactose Free meals",
              isLactoseFree,
              (newValue) {
                setState(() {
                  isLactoseFree = newValue;
                });
              },
            ),
            buildSwitchListTile(
              "Vegeterian",
              "Only Vegeterian meals",
              isVegetarian,
              (newValue) {
                setState(() {
                  isVegetarian = newValue;
                });
              },
            ),
            buildSwitchListTile(
              "Vegan",
              "Only Vegan meals",
              isVegan,
              (newValue) {
                setState(() {
                  isVegan = newValue;
                });
              },
            ),
          ],
        ));
  }
}
