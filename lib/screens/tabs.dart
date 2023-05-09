import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zippy_eats/screens/categories.dart';
import 'package:zippy_eats/screens/filters.dart';
import 'package:zippy_eats/screens/meals.dart';
import 'package:zippy_eats/widgets/main_drawer.dart';

import '../models/meal.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];
  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _infoMessage(String msg) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }

  void _toggleFavouriteStatus(Meal meal) {
    final _isExisting = _favouriteMeals.contains(meal);
    if (_isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
        _infoMessage("Meal is no longer favourite");
      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        _infoMessage("Marked as favourite");
      });
    }
  }

  void _setScreen(String Identifier) {
    Navigator.pop(context);
    if (Identifier == "filters") {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      toggleFavourite: _toggleFavouriteStatus,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
          meals: _favouriteMeals, onToggleFavourite: _toggleFavouriteStatus);
      activePageTitle = 'Your Favourites';
    }
    return Scaffold(
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories '),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
