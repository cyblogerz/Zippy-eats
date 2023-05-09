import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:zippy_eats/screens/tabs.dart';
import 'package:zippy_eats/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      drawer: MainDrawer(onSelectScreen: (Identifier) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => const Tabs()));
      }),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreeSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeSet = isChecked;
              });
            },
            title: Text(
              "Gluten-free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include gluten-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _glutenFreeSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeSet = isChecked;
              });
            },
            title: Text(
              "Lactose Free",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include Lactose-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: _glutenFreeSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreeSet = isChecked;
              });
            },
            title: Text(
              "Vegetarian",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "Only include vegetarian meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
