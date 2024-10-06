import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medi_ghor/common/widgets/texts/r_brand_title_text.dart';
import 'package:medi_ghor/utils/constants/colors.dart';
import 'package:medi_ghor/utils/constants/enums.dart';
import 'package:medi_ghor/utils/constants/sizes.dart';

class RBrandTitleTextWithVerifiedIcon extends StatelessWidget {
  const RBrandTitleTextWithVerifiedIcon({
      super.key,
      required this.title,
      this.maxLine = 3,
      this.textColor,
      this.iconColor = RColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLine;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: RBrandTitleText(
            title: title,
            color: textColor,
            maxLine: maxLine,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(width: RSizes.sm,),
        Icon(Iconsax.verify5, color: iconColor, size: RSizes.iconXs,)
      ],
    );
  }
}
