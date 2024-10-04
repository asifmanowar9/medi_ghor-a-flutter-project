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

class RProductCardVertical extends StatelessWidget {
  const RProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Container(
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
            child:  Stack(
              children: [
                ///thumbnail
                RRoundedImage(imageUrl: RImages.productImage1,applyImageRadius: true,),

                ///tsale tag
                Positioned(
                  top: 12,
                  child: RRoundedContainer(
                    radius: RSizes.sm,
                    backgroundColor: RColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: RSizes.sm, vertical: RSizes.xs),
                    child: Text('20%',style:  Theme.of(context).textTheme.labelLarge!.apply(color: RColors.dark)),
                  ),
                ),
                ///fav icon button
                const Positioned(
                    top: 0,
                    right: 0,
                    child: RCircularIcon(icon: Iconsax.heart5,color: Colors.redAccent,)),

              ],
            ),
          ),



          ///details
        ],
      ),
    );
  }
}


