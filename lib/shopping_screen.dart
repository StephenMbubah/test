import 'package:flutter/material.dart';

class ShoppingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ShoppingCartScreen(),
    );
  }
}

class ShoppingCartScreen extends StatefulWidget {
  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  // Shopping cart list to store items
  List<CartItem> cartItems = [];

  // Method to add items to cart
  void addItemToCart(String itemName, double price) {
    setState(() {
      cartItems.add(CartItem(itemName: itemName, price: price));
    });
  }

  // Method to remove items from cart
  void removeItemFromCart(CartItem item) {
    setState(() {
      cartItems.remove(item);
    });
  }

  // Method to calculate total price of items in cart
  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartItems[index].itemName),
                  subtitle: Text("\$${cartItems[index].price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_shopping_cart),
                    onPressed: () {
                      removeItemFromCart(cartItems[index]);
                    },
                  ),
                );
              },
            ),
          ),
          Divider(height: 2, color: Colors.black),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Price:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "\$${getTotalPrice().toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          _buildAddItemSection(),
        ],
      ),
    );
  }

  // Widget to handle input and add new items
  Widget _buildAddItemSection() {
    TextEditingController itemNameController = TextEditingController();
    TextEditingController itemPriceController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: itemNameController,
            decoration: InputDecoration(
              labelText: 'Item Name',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: itemPriceController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Item Price',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (itemNameController.text.isNotEmpty &&
                  itemPriceController.text.isNotEmpty) {
                final double? price = double.tryParse(itemPriceController.text);
                if (price != null) {
                  addItemToCart(itemNameController.text, price);
                  itemNameController.clear();
                  itemPriceController.clear();
                } else {
                  // Show error if the price input is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter a valid price'),
                    ),
                  );
                }
              }
            },
            child: Text('Add Item'),
          ),
        ],
      ),
    );
  }
}

// CartItem class that represents an individual item in the cart
class CartItem {
  String itemName;
  double price;

  CartItem({
    required this.itemName,
    required this.price,
  });
}
