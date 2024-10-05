import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medi_ghor/common/styles/shadows.dart';
import 'package:medi_ghor/common/widgets/images/r_rounded_images.dart';
import 'package:medi_ghor/utils/constants/colors.dart';
import 'package:medi_ghor/utils/constants/image_strings.dart';
import 'package:medi_ghor/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/r_circular_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class RProductCardVertical extends StatelessWidget {
  const RProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [RShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(RSizes.productImageRadius),
          color: dark ? RColors.darkGrey : RColors.white,
        ),
        child: Column(
          children: [
            ///thumbnail, wishlist button , discount tag
            RRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(RSizes.sm),
              backgroundColor: dark ? RColors.dark : RColors.light,
              child: Stack(
                children: [
                  ///thumbnail
                  const RRoundedImage(
                    imageUrl: RImages.productImage1,
                    applyImageRadius: true,
                  ),
      
                  ///sale tag
                  Positioned(
                    top: 12,
                    child: RRoundedContainer(
                      radius: RSizes.sm,
                      backgroundColor: RColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: RSizes.sm, vertical: RSizes.xs),
                      child: Text('20%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: RColors.dark)),
                    ),
                  ),
      
                  ///fav icon button
                  const Positioned(
                      top: 0,
                      right: 0,
                      child: RCircularIcon(
                        icon: Iconsax.heart5,
                        color: Colors.redAccent,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: RSizes.spaceBtwItems / 2,
            ),
      
            ///details
            Padding(
              padding: const EdgeInsets.only(left: RSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RProductTitleText(
                    title: 'hahahahahaha',
                    smallSize: true,
                  ),
                  const SizedBox(
                    height: RSizes.spaceBtwItems / 2,
                  ),
                  Row(
      
                    children: [
                      Text('nana',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(
                        height: RSizes.sm,
                      ),
                      const Icon(
                        Iconsax.verify5,
                        color: RColors.primary,
                        size: RSizes.iconXs,
                      )
                    ],
                  ),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const RProductPriceText(price: '222',),
                      Container(
                        decoration: const BoxDecoration(
                          color: RColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(RSizes.cardRadiusMd),
                            bottomRight: Radius.circular(RSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: RSizes.iconLg * 1.2,
                            height: RSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add,color: RColors.white,))),
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


