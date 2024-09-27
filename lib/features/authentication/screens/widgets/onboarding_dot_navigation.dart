import 'package:flutter/material.dart';
import 'package:medi_ghor/features/authentication/controlllers/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = RHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: RDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: RSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect:  ExpandingDotsEffect(activeDotColor: dark ? RColors.white : RColors.dark,dotHeight: 6),
      ),
    );
  }
}