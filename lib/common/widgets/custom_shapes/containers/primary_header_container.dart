import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curvedEdges/curved_edges_widget.dart';
import 'circular_container.dart';

class RPrimaryHeaderContainer extends StatelessWidget {
  const RPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RCurvedEdgeWidget(
      child: Container(
        color: RColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: RCircularContainer(
                  backgroundColor: RColors.textWhite.withOpacity(0.1),
                )),
            Positioned(
                top: 100,
                right: -300,
                child: RCircularContainer(
                  backgroundColor: RColors.textWhite.withOpacity(0.1),
                )),
            child,
          ],
        ),
      ),
    );
  }
}
