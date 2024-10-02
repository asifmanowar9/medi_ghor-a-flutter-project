import 'package:flutter/material.dart';

import '../../../../../common/widgets/app_bar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class RHomeAppBar extends StatelessWidget {
  const RHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RAppbar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            RTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: RColors.grey),
          ),
          Text(
            RTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: RColors.white),
          ),
        ],
      ),
      actions: [
        RCartCounterIcon(
          iconColor: RColors.white,
          onPressed: () {},
        ),
      ],
    );
  }
}
