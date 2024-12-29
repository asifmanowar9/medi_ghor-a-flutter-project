import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_ghor/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:medi_ghor/features/shop/screens/home/widgets/home_categories.dart';
import 'package:medi_ghor/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:medi_ghor/utils/constants/colors.dart';
import 'package:medi_ghor/utils/constants/image_strings.dart';
import 'package:medi_ghor/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_screen.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../authentication/controlllers/search_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final SController controller = Get.put(SController());

  final List<Map<String, String>> products = [
    {
      'productName': 'Napa - Tablet-(500mg)',
      'productPrice': '13',
      'productImage':
          'assets/images/products/napa.jpeg', // Add actual image paths
      'productBrand': 'Beximco',
      'discountPercentage': '20',
    },
    {
      'productName': 'Aspirin 300 - Tablet-(300mg)',
      'productPrice': '18',
      'productImage':
          'assets/images/products/aspirin.jpeg', // Add actual image paths
      'productBrand': 'Albion Laboratories Ltd.',
      'discountPercentage': '10',
    },

    {
      'productName': 'Thyrox 50 - Tablet-(50mcg)',
      'productPrice': '60',
      'productImage':
          'assets/images/products/thyrox50.jpeg', // Add actual image paths
      'productBrand': 'Renata Limited.',
      'discountPercentage': '10',
    },

    {
      'productName': 'Olmesafe AM 20/5 - Tablet-(5mg+20mg)',
      'productPrice': '109',
      'productImage':
          'assets/images/products/olmesafe.jpeg', // Add actual image paths
      'productBrand': 'Orion Pharma Ltd.',
      'discountPercentage': '10',
    },
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  const RHomeAppBar(),
                  const SizedBox(
                    height: RSizes.spaceBtwSections,
                  ),

                  ///search bar
                  RSearchContainer(
                    text: 'Search in the store.',
                    onTap: () {
                      Get.to(() => SearchScreen()); // Navigate to the search page
                    },
                  ),
                  const SizedBox(
                    height: RSizes.spaceBtwSections,
                  ),

                  /// heading
                  const Padding(
                    padding: EdgeInsets.only(left: RSizes.defaultSpace),
                    child: Column(
                      children: [
                        RSectionHeading(
                          title: 'Popular Categories.',
                          showActionButton: false,
                          textColor: RColors.white,
                        ),
                        SizedBox(
                          height: RSizes.spaceBtwItems,
                        ),

                        ///categories
                        RHomeCategories(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: RSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            ///body
            Padding(
              padding: const EdgeInsets.all(RSizes.defaultSpace),
              child: Column(
                children: [
                  ///promo slider
                  const RPromoSlider(
                    banners: [
                      RImages.banner9,
                      RImages.promoBanner1,
                      RImages.banner11,
                      RImages.banner10
                    ],
                  ),
                  const SizedBox(
                    height: RSizes.spaceBtwSections,
                  ),

                  ///heading
                  RSectionHeading(
                    title: 'Popular Items',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: RSizes.spaceBtwItems,
                  ),

                  RGridLayout(
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

                  // RGridLayout(itemCount: 1, itemBuilder: (_, index ) => const RProductCardVertical() ,),

                  // RGridLayout(itemCount: 1, itemBuilder: (_, index ) => const RProductCardVertical() ,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
