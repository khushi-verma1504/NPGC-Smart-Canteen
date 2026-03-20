import 'dart:async';
import 'package:flutter/material.dart';

class SpecialSlider extends StatefulWidget {
  const SpecialSlider({super.key});

  @override
  State<SpecialSlider> createState() => _SpecialSliderState();
}

class _SpecialSliderState extends State<SpecialSlider> {
  late final PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;

  /// ✅ FIXED: Correct images from your assets folder
  final List<Map<String, String>> specials = [
    {
      'title': 'Roll',
      'price': '60',
      'image': 'assets/images/roll.png',
    },
    {
      'title': 'Burger',
      'price': '50',
      'image': 'assets/images/burger.png',
    },
    {
      'title': 'Noodles',
      'price': '80',
      'image': 'assets/images/noodles.png',
    },
    {
      'title': 'Momos',
      'price': '70',
      'image': 'assets/images/momos.png',
    },
    {
      'title': 'Ice Cream',
      'price': '40',
      'image': 'assets/images/ice_cream.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1.0);
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!_pageController.hasClients) return;

      _currentPage++;
      if (_currentPage >= specials.length) {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// 🔶 TITLE ROW
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Special",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff222222),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Row(
                  children: [
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      Icons.chevron_right,
                      size: 18,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        /// 🔶 SLIDER
        SizedBox(
          height: 190,
          child: PageView.builder(
            controller: _pageController,
            itemCount: specials.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final item = specials[index];

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  /// ✅ ADDED SHADOW
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [

                      /// 🔹 IMAGE
                      Image.asset(
                        item['image']!,
                        fit: BoxFit.cover,
                      ),

                      /// 🔹 GRADIENT OVERLAY
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.6), // ✅ improved
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      /// 🔹 TITLE
                      Positioned(
                        left: 14,
                        bottom: 14,
                        child: Text(
                          item['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      /// 🔹 PRICE (₹ FIXED)
                      Positioned(
                        right: 14,
                        bottom: 14,
                        child: Text(
                          '₹${item['price']}', // ✅ FIXED
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        /// 🔶 DOT INDICATORS
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            specials.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentPage == index ? 10 : 7,
              height: _currentPage == index ? 10 : 7,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? const Color(0xffFF8A3D)
                    : Colors.grey.shade300,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}