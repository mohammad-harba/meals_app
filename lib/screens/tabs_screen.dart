import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favourites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map> pages = [
    {
      "page": CategoriesScreen(),
      "title": "Categories",
    },
    {
      "page": FavouritesScreen(),
      "title": "Favourites",
    },
  ];
  int selectedPageIndex = 0;
  void selectedPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pages[selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: pages[selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        onTap: selectedPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Categories"),
            icon: Icon(Icons.category),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            title: Text("Favourites"),
            icon: Icon(Icons.star),
          )
        ],
      ),
    );
  }
}
