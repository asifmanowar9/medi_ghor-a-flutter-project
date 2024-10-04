import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medi_ghor/utils/constants/sizes.dart';
import 'package:medi_ghor/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class RCircularIcon extends StatelessWidget {
  const RCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = RSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null ? backgroundColor! : RHelperFunctions.isDarkMode(context) ? RColors.dark.withOpacity(0.9) : RColors.light.withOpacity(0.9),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, size: size, color: color,) ),
    );
  }
}