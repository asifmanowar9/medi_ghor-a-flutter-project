import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class RSocialButton extends StatelessWidget {
  const RSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: RColors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image(
                height: RSizes.iconMd,
                width: RSizes.iconMd,
                image: AssetImage(RImages.google),
              ),
            ),
          ),
          const SizedBox(width: RSizes.spaceBtwItems,),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: RColors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image(
                height: RSizes.iconMd,
                width: RSizes.iconMd,
                image: AssetImage(RImages.facebook),
              ),
            ),
          ),
        ],
      ),
    );
  }
}