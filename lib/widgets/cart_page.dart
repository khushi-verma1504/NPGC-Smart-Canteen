import 'package:flutter/material.dart';
import '../data/cart_data.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    final cartItems = CartData.cartItems;

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      body: Column(
        children: [

          /// 🔶 HEADER
          Container(
            height: 110,
            width: double.infinity,
            padding: const EdgeInsets.only(top: 40),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffFF8A3D), Color(0xffFFB36B)],
              ),
            ),
            child: const Center(
              child: Text(
                "My Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          /// 🔶 BODY
          Expanded(
            child: cartItems.isEmpty
                ? const Center(child: Text("Cart is empty"))
                : SingleChildScrollView(
              child: Column(
                children: [

                  const SizedBox(height: 10),

                  /// TITLE
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Cart Items",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// 🛒 ITEMS
                  ...List.generate(cartItems.length, (index) {
                    final item = cartItems[index];

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                          )
                        ],
                      ),

                      child: Row(
                        children: [

                          /// IMAGE
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              item["image"],
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),

                          const SizedBox(width: 10),

                          /// NAME + PRICE
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["name"],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text("₹${item["price"]}"),
                              ],
                            ),
                          ),

                          /// QTY
                          Row(
                            children: [

                              /// -
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    CartData.decreaseQty(index);
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Icon(Icons.remove, size: 16),
                                ),
                              ),

                              const SizedBox(width: 8),

                              Text(item["qty"].toString()),

                              const SizedBox(width: 8),

                              /// +
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    CartData.increaseQty(index);
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Icon(Icons.add, size: 16),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(width: 10),

                          /// TOTAL PRICE
                          Text(
                            "₹${(item["price"] as int) * (item["qty"] as int)}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),

                          const SizedBox(width: 8),

                          /// DELETE
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                CartData.removeItem(index);
                              });
                            },
                            child: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    );
                  }),

                  const SizedBox(height: 20),

                  /// 💰 BILL
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Column(
                      children: [
                        row("Item Total", "₹${CartData.total}"),
                        row("Delivery Fee", "₹20"),
                        row("Discount", "-₹50"),
                        const Divider(),
                        row("Total Amount", "₹${CartData.total - 30}", isBold: true),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// 🟠 BUTTON
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Place Order",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 ROW WIDGET
  Widget row(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}