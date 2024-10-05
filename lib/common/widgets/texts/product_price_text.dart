import 'package:flutter/material.dart';

class RProductPriceText extends StatelessWidget {
  const RProductPriceText({
    super.key,
    this.currencySign = '\৳',
    required this.price,
    this.maxLine = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String currencySign, price;
  final int maxLine;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      price + currencySign,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
