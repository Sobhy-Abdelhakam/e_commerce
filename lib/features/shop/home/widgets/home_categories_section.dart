import 'package:e_commerce/domain/models/category.dart';
import 'package:e_commerce/features/shop/products_by_category/products_by_category.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'home_category_item.dart';

class HomeCategoriesSection extends StatelessWidget {
  final Future<List> categories;
  const HomeCategoriesSection({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TTexts.categories,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        SizedBox(
            height: 80,
            child: FutureBuilder(
                future: categories,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No categories available"));
                  }

                  final data = snapshot.data!;
                  return ListView.builder(
                      itemCount: data.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        final CategoryProduct category = data[index];
                        return HomeCategoryItem(
                          itemImage: category.imageUrl!,
                          itemCategory: category.name,
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ProductsByCategory(categoryId: category.id,);
                            }));
                          },
                        );
                      });
                })),
      ],
    );
  }
}
