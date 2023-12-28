import 'package:flutter/material.dart';
class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: 3, // Replace with the actual number of items in the cart
        itemBuilder: (context, index) {
          return CartItemCard(
            productName: 'Product $index',
            productBrand: 'Brand $index',
            price: 20.0 * (index + 1), // Replace with actual prices
          );
        },
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String productName;
  final String productBrand;
  final double price;

  const CartItemCard({
    required this.productName,
    required this.productBrand,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/images/1.jpg'), // Replace with actual image
        ),
        title: Text(productName),
        subtitle: Text(productBrand),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                // Implement logic to decrease quantity
              },
            ),
            Text('1'), // Replace with the actual quantity
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Implement logic to increase quantity
              },
            ),
          ],
        ),
      ),
    );
  }
}