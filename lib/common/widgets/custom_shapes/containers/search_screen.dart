import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../features/authentication/controlllers/search_controller.dart';

class SearchScreen extends StatelessWidget {
  final SController controller = Get.find<SController>(); // Use the same controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close), // Cross (X) button
          onPressed: () {
            Get.back(); // Navigate back to Home Screen
          },
        ),
        title: TextField(
          onChanged: (value) => controller.filterProducts(value), // Filter products
          decoration: const InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Obx(() {
        if (controller.filteredProducts.isEmpty) {
          return const Center(child: Text('No products found.'));
        }

        return ListView.builder(
          itemCount: controller.filteredProducts.length,
          itemBuilder: (context, index) {
            final product = controller.filteredProducts[index];
            return ListTile(
              leading: Image.asset(product['productImage']!), // Display product image
              title: Text(product['productName']!),
              subtitle: Text('Price: \৳${product['productPrice']}'),
            );
          },
        );
      }),
    );
  }
}
