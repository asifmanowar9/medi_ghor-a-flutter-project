import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../../styles/shadows.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../icons/r_circular_icon.dart';
import '../../images/r_rounded_images.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';
import '../../texts/r_brand_title_text_with_verified_icon.dart';

class RProductCardVertical extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productImage;
  final String productBrand;
  final String discountPercentage;

  const RProductCardVertical({
    super.key,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productBrand,
    required this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
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
              height: 160,
              padding: const EdgeInsets.all(RSizes.sm),
              backgroundColor: dark ? RColors.dark : RColors.light,
              child: Stack(
                children: [
                  ///thumbnail
                  RRoundedImage(
                    imageUrl: productImage,
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
                      child: Text('$discountPercentage%',
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
                  RProductTitleText(
                    title: productName,
                    smallSize: true,
                  ),
                  SizedBox(
                    height: RSizes.spaceBtwItems / 2,
                  ),
                  RBrandTitleTextWithVerifiedIcon(title: productBrand),
                ],
              ),
            ),

            /// Spacer replaced with Flexible to avoid overflow
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: RSizes.sm),
                    child: RProductPriceText(price: productPrice),
                  ),
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
                      child: Center(child: Icon(Iconsax.add, color: RColors.white)),
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
