import 'package:get/get.dart';

class SController extends GetxController {
  final List<Map<String, String>> allProducts = [
    {
      'productName': 'Napa - Tablet-(500mg)',
      'productPrice': '13',
      'productImage': 'assets/images/products/napa.jpeg',
      'productBrand': 'Beximco',
      'discountPercentage': '20',
    },
    {
      'productName': 'Aspirin 300 - Tablet-(300mg)',
      'productPrice': '18',
      'productImage': 'assets/images/products/aspirin.jpeg',
      'productBrand': 'Albion Laboratories Ltd.',
      'discountPercentage': '10',
    },
    {
      'productName': 'Thyrox 50 - Tablet-(50mcg)',
      'productPrice': '60',
      'productImage': 'assets/images/products/thyrox50.jpeg',
      'productBrand': 'Renata Limited.',
      'discountPercentage': '10',
    },
    {
      'productName': 'Olmesafe AM 20/5 - Tablet-(5mg+20mg)',
      'productPrice': '109',
      'productImage': 'assets/images/products/olmesafe.jpeg',
      'productBrand': 'Orion Pharma Ltd.',
      'discountPercentage': '10',
    },
  ];

  // Reactive list for filtered products
  final RxList<Map<String, String>> filteredProducts = <Map<String, String>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredProducts.addAll(allProducts); // Initialize with all products
  }

  // Method to filter products based on search query
  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(allProducts);
    } else {
      filteredProducts.assignAll(
        allProducts.where((product) =>
            product['productName']!.toLowerCase().contains(query.toLowerCase())),
      );
    }
  }
}
