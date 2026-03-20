import 'package:flutter/material.dart';
import '../data/cart_data.dart';

class HeaderSection extends StatelessWidget {
  final VoidCallback onMenuTap;
  const HeaderSection({
    super.key,
    required this.onMenuTap,
  });
  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(18, topPadding + 10, 18, 60),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffFFA43A), Color(0xffFF8A2A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: onMenuTap,
                child: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'Hi Tanu 👋',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 26,
                  ),
                  Positioned(
                    right: -4,
                    top: -6,
                    child: Container(
                      width: 18,
                      height: 18,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Color(0xffE53935),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                    CartData.cartItems.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 9,
                      fontWeight: FontWeight.bold,
                    ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(left: 2),
            child: Text(
              'What would you like to eat today?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
