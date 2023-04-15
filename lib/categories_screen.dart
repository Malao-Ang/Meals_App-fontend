import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals_app/cateegory_grid_item.dart';
import 'package:meals_app/meals_screen.dart';
import 'package:meals_app/models/dummay_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  void _selectCategory(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (cyx) => MealsScreen(title: 'title', meals: [])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pick your category"),
      ),
      body: GridView(
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
                _selectCategory(context);
              },
            )
          // Text('1'),
        ],
      ),
    );
  }
}
