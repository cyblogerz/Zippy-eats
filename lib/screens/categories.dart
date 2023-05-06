import 'package:flutter/material.dart';
import 'package:zippy_eats/data/dummy_data.dart';
import 'package:zippy_eats/models/category.dart';
import 'package:zippy_eats/screens/meals.dart';
import 'package:zippy_eats/widgets/category_item.dart';

import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.toggleFavourite});

  final void Function(Meal meal) toggleFavourite;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => MealsScreen(
                title: category.title,
                meals: filteredMeals,
                onToggleFavourite: toggleFavourite)));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        for (final category in availableCategories)
          CategoryItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}
