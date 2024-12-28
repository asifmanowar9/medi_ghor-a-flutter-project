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
  const HomeScreen({super.key});

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



                  RGridLayout(itemCount: 1, itemBuilder: (_, index ) => const RProductCardVertical() ,),

                  RGridLayout(itemCount: 1, itemBuilder: (_, index ) => const RProductCardVertical() ,),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


