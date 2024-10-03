import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:medi_ghor/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:medi_ghor/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:medi_ghor/features/shop/screens/home/widgets/home_categories.dart';
import 'package:medi_ghor/utils/constants/colors.dart';
import 'package:medi_ghor/utils/constants/image_strings.dart';
import 'package:medi_ghor/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/images/r_rounded_images.dart';
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
                ],
              ),
            ),

            ///body
            Padding(
              padding: const EdgeInsets.all(RSizes.defaultSpace),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                    ),
                    items: const [
                      RRoundedImage(imageUrl: RImages.promoBanner2),
                      RRoundedImage(imageUrl: RImages.promoBanner1),
                      RRoundedImage(imageUrl: RImages.promoBanner3),
                    ],

                  ),
                  const SizedBox(height: RSizes.spaceBtwItems,),

                   Row(
                    children: [
                      for(int i=0 ; i<3 ; i++)
                      const RCircularContainer(
                        width: 25,
                        height: 4,
                        margin: EdgeInsets.only(right: 10 ),
                        backgroundColor: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
