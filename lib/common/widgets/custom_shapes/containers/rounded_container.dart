import 'package:flutter/material.dart';
import 'package:medi_ghor/utils/constants/colors.dart';
import 'package:medi_ghor/utils/constants/sizes.dart';

class RRoundedContainer extends StatelessWidget {
  const RRoundedContainer({super.key,
    this.width,
    this.height,
    this.radius = RSizes.borderRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = RColors.borderPrimary,
    this.backgroundColor = RColors.white,
    this.margin,
    this.padding
  });

  final double? width;
  final double? height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}
