import 'package:flutter/material.dart';
import 'package:project_6/models/category.dart';
import 'category_card.dart';

class CategoryGrid extends StatelessWidget {
  final List<Category> categories;
  final EdgeInsetsGeometry padding;
  final void Function(Category category)? onTap;
  final void Function(Category category)? onLongPress;

  const CategoryGrid({
    super.key,
    required this.categories,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final category = categories[index];
            return CategoryCard(
              category: category,
              onTap: onTap != null ? () => onTap!(category) : null,
              onLongPress:
                  onLongPress != null ? () => onLongPress!(category) : null,
            );
          },
          childCount: categories.length,
        ),
      ),
    );
  }
}
