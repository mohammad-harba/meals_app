import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildTile(String title, IconData icon, Function navigate) {
    return ListTile(
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Container(
        child: Text(
          title,
          style: TextStyle(
            fontFamily: "Raleway",
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      onTap: navigate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            child: Text(
              "The Cooking App",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: "Raleway",
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildTile("Meals", Icons.restaurant_menu, () {
            Navigator.pushReplacementNamed(context, "/");
          }),
          buildTile("Filters", Icons.settings, () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routName);
          }),
        ],
      ),
    );
  }
}
