import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Product Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart icon pressed
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/4.jpg',
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // Handle "Product Details" tap
                  },
                  child: Text('Product '),

                ),
                InkWell(
                  onTap: () {
                    // Handle "Review" tap
                  },
                  child: Text('Details'),
                ),
                InkWell(
                  onTap: () {
                    // Handle "Select Color" tap
                  },
                  child: Text('Review'),
                ),
                
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Select Color'),
                for (int i = 0; i < 5; i++)
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.primaries[i],
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Select Size'),
                for (int size = 1; size <= 5; size++)
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Size $size',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "Share" button pressed
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFFFF),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text('Share This'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Add to Cart" button pressed
                  },
                  style: ElevatedButton.styleFrom(
                    primary:Color(0xFFFF6969),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5),

                    ),
                  ),
                  child: Text('Add to Cart'),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
