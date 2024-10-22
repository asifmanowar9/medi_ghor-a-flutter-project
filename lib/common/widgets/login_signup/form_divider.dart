import 'package:flutter/material.dart';
import 'package:medi_ghor/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';

class RFormDivider extends StatelessWidget {
  const RFormDivider({
    super.key, required this.dividerText,
  });
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = RHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(color: dark ? RColors.darkGrey : RColors.grey, thickness: 0.5,indent: 60, endIndent: 5)),
        Text(dividerText, style: Theme.of(context).textTheme.labelMedium,
        ),
        Expanded(child: Divider(color: RColors.darkGrey, thickness: 0.5, indent: 5,endIndent: 60,)),
      ],
    );
  }
}