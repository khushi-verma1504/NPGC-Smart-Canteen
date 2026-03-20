import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../widgets/popular_item_card.dart';
class PopularItemsPage extends StatelessWidget {
  const PopularItemsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Items'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: popularItemsData.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 0.78,
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
    );
  }
}
