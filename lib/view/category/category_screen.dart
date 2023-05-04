import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpoper_app/widget/category_card.dart';

import 'category_view_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = context.watch<CategoryViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: ListView.separated(
          itemCount: category.categories.length,
          separatorBuilder: (context, index) => const SizedBox(
                height: 15,
              ),
          itemBuilder: (context, index) {
            return CategoryCard(
                title: category.categories[index].name,
                image: category.categories[index].image);
          }),
    );
  }
}
