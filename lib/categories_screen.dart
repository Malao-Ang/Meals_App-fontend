// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals_app/widget/cateegory_grid_item.dart';
import 'package:meals_app/meals_screen.dart';
import 'package:meals_app/models/dummay_data.dart';

import 'models/category.dart';
import 'models/meal.dart';

class CategoriesScreen extends StatefulWidget {
  // final Function(Meal meal) onToggleFavorites;
  const CategoriesScreen(
      {super.key,
      // required this.onToggleFavorites,
      required this.availableMeals});

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animetionController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animetionController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animetionController.forward();
  }

  @override
  void dispose() {
    _animetionController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filterMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (cyx) => MealsScreen(
              title: category.title,
              meals: filterMeals,
              // onToggleFavorites: onToggleFavorites,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animetionController,
        child: GridView(
          padding: EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final category in DUMMY_CATEGORIES)
              CategoryGridItem(
                category: category,
                onSelecCategory: () {
                  _selectCategory(context, category);
                },
              )
            // Text('1'),
          ],
        ),
        builder: (context, child) => SlideTransition(
              position: Tween(
                begin: Offset(0, 0.3),
                end: Offset(0, 0),
              ).animate(CurvedAnimation(
                  parent: _animetionController, curve: Curves.easeInOut)),
              child: child,
            ));
  }
}
