import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../screens/popular_items_page.dart';
import 'popular_item_card.dart';
import 'section_title.dart';

class PopularItemsSection extends StatelessWidget {
  const PopularItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// Title Row
        SectionTitle(
          title: 'Popular Items',
          onSeeAll: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PopularItemsPage(),
              ),
            );
          },
        ),

        const SizedBox(height: 12),

        /// Grid Items
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),

          child: GridView.builder(
            itemCount: 6,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.5, // IMPORTANT for correct height
            ),

            itemBuilder: (context, index) {
              final item = popularItemsData[index];

              return PopularItemCard(
                name: item['name']!,
                price: item['price']!,
                image: item['image']!,
              );
            },
          ),
        ),

      ],
    );
  }
}