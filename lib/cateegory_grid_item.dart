import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [
            category.color.withOpacity(0.55),
            category.color.withOpacity(0.9)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      child: Text(
        category.title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
