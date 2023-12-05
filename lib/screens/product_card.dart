import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageAsset;
  final String productName;
  final String productPrice;

  ProductCard({
    required this.imageAsset,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            child: Image.asset(
              imageAsset,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              productName,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(productPrice),
        ],
      ),
    );
  }
}
