import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _cartCount = 2;
  int _carouselIndex = 0;

  final List<Map<String, String>> specials = [
    {
      "image": "assets/images/paneer_franky.jpg",
      "title": "Paneer Franky",
      "price": "₹60"
    },
    {
      "image": "assets/images/chowmein.jpg",
      "title": "Chowmein",
      "price": "₹80"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(),
      bottomNavigationBar: buildBottomNav(),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔶 HEADER WITH GRADIENT
            Container(
              padding: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange.shade400, Colors.orange.shade600],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Top Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Builder(
                        builder: (context) => IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: () => Scaffold.of(context).openDrawer(),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Hi Tanu 👋",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Stack(
                        children: [
                          Icon(Icons.notifications,
                              color: Colors.white, size: 28),
                          Positioned(
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.red,
                              child: Text("2",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),

                  SizedBox(height: 20),

                  Text(
                    "What would you like to eat today?",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),

                  SizedBox(height: 15),

                  // 🔍 Search Bar
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: "Search food...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // ⭐ TODAY'S SPECIAL
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Today's Special",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("See All",
                      style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),

            SizedBox(height: 10),

            CarouselSlider.builder(
              itemCount: specials.length,
              options: CarouselOptions(
                height: 170,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _carouselIndex = index;
                  });
                },
              ),
              itemBuilder: (context, index, realIndex) {
                final item = specials[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(item["image"]!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                        colors: [Colors.black54, Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item["title"]!,
                            style: TextStyle(
                                color: Colors.white, fontSize: 18)),
                        Text(item["price"]!,
                            style: TextStyle(
                                color: Colors.white, fontSize: 18)),
                      ],
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 10),

            Center(
              child: AnimatedSmoothIndicator(
                activeIndex: _carouselIndex,
                count: specials.length,
                effect: WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.orange,
                ),
              ),
            ),

            SizedBox(height: 25),

            // 🔹 CATEGORIES HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CategoriesPage()));
                    },
                    child: Row(
                      children: [
                        Text("See All",
                            style: TextStyle(color: Colors.orange)),
                        Icon(Icons.arrow_forward_ios,
                            size: 14, color: Colors.orange)
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(height: 15),

            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                children: [
                  categoryItem(Icons.ramen_dining, "Chowmein"),
                  categoryItem(Icons.fastfood, "Burgers"),
                  categoryItem(Icons.set_meal, "Momos"),
                  categoryItem(Icons.local_dining, "Pasta"),
                  categoryItem(Icons.lunch_dining, "Rolls"),
                  categoryItem(Icons.emoji_food_beverage, "Snacks"),
                  categoryItem(Icons.rice_bowl, "Chinese"),
                  categoryItem(Icons.local_pizza, "Combos"),
                ],
              ),
            ),

            SizedBox(height: 25),

            // 🔥 POPULAR ITEMS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.local_fire_department,
                      color: Colors.orange),
                  SizedBox(width: 6),
                  Text("Popular Items",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.75,
                children: [
                  popularCard("Veg Franky", "₹60"),
                  popularCard("Chowmein", "₹80"),
                  popularCard("White Sauce Pasta", "₹90"),
                  popularCard("Chilli Potato", "₹70"),
                  popularCard("Samosa", "₹20"),
                  popularCard("Chola Samosa", "₹40"),
                ],
              ),
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget categoryItem(IconData icon, String title) {
    return Container(
      width: 90,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 35, color: Colors.orange),
          SizedBox(height: 8),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget popularCard(String title, String price) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 5)
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.fastfood, size: 60, color: Colors.orange),
          Text(title, textAlign: TextAlign.center),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _cartCount++;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.add, color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Text("Hi Tanu 👋",
                  style: TextStyle(color: Colors.white, fontSize: 22))),
          ListTile(title: Text("My Profile")),
          ListTile(title: Text("Payment Methods")),
          ListTile(title: Text("Offers & Coupons")),
          ListTile(title: Text("Order History")),
          ListTile(title: Text("Help & Support")),
          ListTile(title: Text("Settings")),
        ],
      ),
    );
  }

  Widget buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.orange,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              Icon(Icons.shopping_cart),
              if (_cartCount > 0)
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      _cartCount.toString(),
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          label: "Cart",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.inventory), label: "Orders"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: "More"),
      ],
    );
  }
}

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Categories"),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text("All Categories Here"),
      ),
    );
  }
}