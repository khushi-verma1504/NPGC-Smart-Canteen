class CartData {
  static List<Map<String, dynamic>> cartItems = [];

  /// ADD ITEM
  static void addItem(Map<String, dynamic> item) {
    int index = cartItems.indexWhere((e) => e["name"] == item["name"]);

    if (index != -1) {
      cartItems[index]["qty"] += 1;
    } else {
      cartItems.add({
        "name": item["name"],
        "image": item["image"],
        "price": item["price"], // ✅ MUST BE INT
        "qty": 1,
      });
    }
  }

  /// INCREASE QTY
  static void increaseQty(int index) {
    cartItems[index]["qty"] += 1;
  }

  /// DECREASE QTY
  static void decreaseQty(int index) {
    if (cartItems[index]["qty"] > 1) {
      cartItems[index]["qty"] -= 1;
    }
  }

  /// REMOVE ITEM
  static void removeItem(int index) {
    cartItems.removeAt(index);
  }

  /// TOTAL PRICE (🔥 FIXED ERROR HERE)
  static int get total {
    int sum = 0;

    for (var item in cartItems) {
      sum += (item["price"] as int) * (item["qty"] as int);
    }

    return sum;
  }
}