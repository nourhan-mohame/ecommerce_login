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
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Product Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart icon pressed
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/4.jpg',
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // Handle "Product Details" tap
                  },
                  child: const Text('Product '),

                ),
                InkWell(
                  onTap: () {
                    // Handle "Review" tap
                  },
                  child: const Text('Details'),
                ),
                InkWell(
                  onTap: () {
                    // Handle "Select Color" tap
                  },
                  child: const Text('Review'),
                ),
                
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Select Color'),
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
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text('Select Size'),
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
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle "Share" button pressed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0x00ffffff),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text('Share This'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle "Add to Cart" button pressed
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6969),
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5),

                    ),
                  ),
                  child: const Text('Add to Cart'),

                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
