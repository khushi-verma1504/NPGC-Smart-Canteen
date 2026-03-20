import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../screens/categories_page.dart';
import 'category_card.dart';
import 'section_title.dart';
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: 'Categories',
            onSeeAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CategoriesPage(),
                ),
              );
            },
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesData.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CategoryCard(
                    title: categoriesData[index]['name']!,
                    image: categoriesData[index]['image']!,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
