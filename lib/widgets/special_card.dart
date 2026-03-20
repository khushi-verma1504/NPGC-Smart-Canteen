import 'package:flutter/material.dart';

class SpecialFoodCard extends StatelessWidget {
  final String itemName;
  final String price;
  final String imagePath; // We can use an Asset or Network image URL

  const SpecialFoodCard({
    super.key,
    required this.itemName,
    required this.price,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320, // Slightly wider than normal cards
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Stack(
        children: [
          // 1. Bottom Layer: The Image
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover, // Ensures the image fills the card
              ),
            ),
          ),
          // 2. Middle Layer: The soft light-orange tint at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.5), // Soft dark tint for text contrast
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // 3. Top Layer: Text & Price
          Positioned(
            bottom: 15,
            left: 15,
            child: Text(
              itemName,
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFFF9A84D), // Brand Orange
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '₹$price',
                style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}