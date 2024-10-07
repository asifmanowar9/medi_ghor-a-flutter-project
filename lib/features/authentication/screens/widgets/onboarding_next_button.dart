import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medi_ghor/features/authentication/controlllers/onBoarding/onboarding_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Positioned(
      right: RSizes.defaultSpace,
      bottom: RDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
          onPressed: () => OnBoardingController.instance..nextPage(),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? RColors.primary : Colors.black),
          child: const Icon(Iconsax.arrow_right_3)
      ),
    );
  }
}