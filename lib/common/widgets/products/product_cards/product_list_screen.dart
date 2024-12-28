

import 'package:flutter/material.dart';
import 'package:medi_ghor/common/widgets/products/product_cards/product_card_vertical.dart';

import '../../layouts/grid_layout.dart';

class ProductListScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'productName': 'Napa - Tablet-(500mg)',
      'productPrice': '\$12',
      'productImage': 'assets/product_image_1.jpg', // Add actual image paths
      'productBrand': 'Beximco',
      'discountPercentage': '20',
    },
    {
      'productName': 'Aspirin - Tablet-(200mg)',
      'productPrice': '\$8',
      'productImage': 'assets/product_image_2.jpg', // Add actual image paths
      'productBrand': 'Medco',
      'discountPercentage': '10',
    },
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RGridLayout(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return RProductCardVertical(
            productName: product['productName']!,
            productPrice: product['productPrice']!,
            productImage: product['productImage']!,
            productBrand: product['productBrand']!,
            discountPercentage: product['discountPercentage']!,
          );
        },
      ),
    );
  }
}
