import 'package:flutter/material.dart';

import '../../models/category_item_model.dart';

class CategoryTabView extends StatelessWidget {
  const CategoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          final category = dummyCategories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              onTap: () {},
              child: (DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: category.bgColor),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                  child: Column(
                    children: [
                      Text(
                        category.name,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: category.textColor,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '${category.productsCount} Proudcts ',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: category.textColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              )),
            ),
          );
        },
        itemCount: dummyCategories.length);
  }
}
