import 'package:flutter/material.dart';
import 'package:medi_ghor/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:medi_ghor/features/shop/screens/home/widgets/home_categories.dart';
import 'package:medi_ghor/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:medi_ghor/utils/constants/colors.dart';
import 'package:medi_ghor/utils/constants/image_strings.dart';
import 'package:medi_ghor/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final List<Map<String, String>> products = [
    {
      'productName': 'Napa - Tablet-(500mg)',
      'productPrice': '\$12',
      'productImage': 'assets/RImages.productImage78', // Add actual image paths
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///appbar
                  RHomeAppBar(),
                  SizedBox(
                    height: RSizes.spaceBtwSections,
                  ),

                  ///search bar
                  RSearchContainer(
                    text: 'Search in the store.',
                  ),
                  SizedBox(
                    height: RSizes.spaceBtwSections,
                  ),

                  /// heading
                  Padding(
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
                  SizedBox(height: RSizes.spaceBtwSections,)
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
                      RImages.promoBanner2,
                      RImages.promoBanner1,
                      RImages.promoBanner3
                    ],
                  ),
                  const SizedBox(
                    height: RSizes.spaceBtwSections,
                  ),
                  ///heading
                  RSectionHeading(title: 'Popular Items', onPressed: (){},),
                  const SizedBox(height: RSizes.spaceBtwItems,),




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


