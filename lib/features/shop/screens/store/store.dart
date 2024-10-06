import 'package:flutter/material.dart';
import 'package:medi_ghor/common/widgets/app_bar/appbar.dart';
import 'package:medi_ghor/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:medi_ghor/common/widgets/layouts/grid_layout.dart';
import 'package:medi_ghor/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:medi_ghor/common/widgets/texts/section_heading.dart';
import 'package:medi_ghor/utils/constants/colors.dart';
import 'package:medi_ghor/utils/constants/enums.dart';
import 'package:medi_ghor/utils/constants/image_strings.dart';
import 'package:medi_ghor/utils/constants/sizes.dart';
import 'package:medi_ghor/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../common/widgets/images/r_circular_image.dart';
import '../../../../common/widgets/texts/r_brand_title_text_with_verified_icon.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RAppbar(
        title: Text('Store',style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          RCartCounterIcon( onPressed: (){}),
        ],
      ),
      body: NestedScrollView(headerSliverBuilder: (_, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            floating: true,
            backgroundColor: RHelperFunctions.isDarkMode(context) ? RColors.black : RColors.white,
            expandedHeight: 440,

            flexibleSpace: Padding(
                padding: const EdgeInsets.all(RSizes.defaultSpace),
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ///search bar
                const SizedBox(height: RSizes.spaceBtwItems,),
                const RSearchContainer(text: 'Search',showBorder: true,showBackground: false,padding: EdgeInsets.zero,),
                const SizedBox(height: RSizes.spaceBtwSections,),

                ///feature brands

                RSectionHeading(title: 'Featured Brands.',onPressed: (){},),
                const SizedBox(height: RSizes.spaceBtwItems / 1.5,),

                 RGridLayout(itemCount: 4, mainAxisExtent: 100 ,itemBuilder: (_,index) {
                   return GestureDetector(
                     onTap: (){},
                     child: RRoundedContainer(
                       padding: const EdgeInsets.all(RSizes.sm),
                       showBorder: true,
                       backgroundColor: Colors.transparent,
                       child: Row(
                         children: [
                           ///icon
                           Flexible(
                             child: RCircularImage(
                               isNetworkImage: false,
                               backgroundColor: Colors.transparent,
                               image: RImages.medicineIcon,
                               overlayColor: RHelperFunctions.isDarkMode(context) ? RColors.white : RColors.black,
                             ),
                           ),
                           const SizedBox(width: RSizes.spaceBtwItems / 2,),

                           Expanded(
                             child: Column(
                               mainAxisSize: MainAxisSize.min,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 const RBrandTitleTextWithVerifiedIcon(title: 'Beximco',brandTextSize: TextSizes.medium,),
                                 Text(
                                   '1 products',
                                   overflow: TextOverflow.ellipsis,
                                   style: Theme.of(context).textTheme.labelMedium,
                                 )
                               ],
                             ),
                           )
                         ],
                       ),
                     ),
                   );
                 }),

              ],
            ),
            ),

          ),
        ];
      }, body: Container()),
    );
  }
}


