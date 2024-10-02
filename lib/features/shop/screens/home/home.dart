import 'package:flutter/material.dart';
import 'package:medi_ghor/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:medi_ghor/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RPrimaryHeaderContainer(
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

                  ///categories
                  Padding(
                    padding: EdgeInsets.only(left: RSizes.defaultSpace),
                    child: Column(
                      children: [
                        RSectionHeading(title: 'Popular Categories.', showActionButton: false,),

                      ],
                    ),
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


