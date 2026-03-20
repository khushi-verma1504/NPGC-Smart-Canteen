import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

import '../widgets/app_drawer.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/categories_section.dart';
import '../widgets/floating_search_bar.dart';
import '../widgets/header_section.dart';
import '../widgets/popular_items_section.dart';
import '../widgets/special_slider.dart';

import '../widgets/cart_page.dart';
import '../widgets/orders_page.dart';
import '../widgets/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  bool _showBottomNav = true;

  @override
  void initState() {
    super.initState();

    /// 🔽 Hide/Show Bottom Nav on scroll
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_showBottomNav) {
          setState(() => _showBottomNav = false);
        }
      }

      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_showBottomNav) {
          setState(() => _showBottomNav = true);
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// 🔶 Bottom Nav Click Handler
  void onBottomNavTap(int index) {
    setState(() {
      currentIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CartPage()),
      );
    }

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const OrdersPage()),
      );
    }

    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),

      child: Scaffold(
        key: scaffoldKey,
        drawer: const AppDrawer(),
        backgroundColor: const Color(0xffF8F8F8),
        resizeToAvoidBottomInset: false,

        body: Stack(
          children: [

            /// 🔶 MAIN SCROLLABLE CONTENT
            SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: const Column(
                children: [

                  /// Space for header + search bar
                  SizedBox(height: 210),

                  /// 🔥 Special Slider
                  SpecialSlider(),

                  SizedBox(height: 14),

                  /// 📂 Categories
                  CategoriesSection(),

                  SizedBox(height: 12),

                  /// 🍔 Popular Items
                  PopularItemsSection(),

                  SizedBox(height: 100),
                ],
              ),
            ),

            /// 🔶 HEADER + SEARCH BAR
            Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [

                    /// 🔥 HEADER
                    HeaderSection(
                      onMenuTap: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                    ),

                    /// 🔍 SEARCH BAR
                    const Positioned(
                      left: 16,
                      right: 16,
                      bottom: -28,
                      child: FloatingSearchBar(),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        /// 🔻 BOTTOM NAV BAR
        bottomNavigationBar: AnimatedSlide(
          duration: const Duration(milliseconds: 250),
          offset: _showBottomNav ? Offset.zero : const Offset(0, 1.2),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: _showBottomNav ? 1 : 0,
            child: BottomNavBar(
              currentIndex: currentIndex,
              onTap: onBottomNavTap,
            ),
          ),
        ),
      ),
    );
  }
}