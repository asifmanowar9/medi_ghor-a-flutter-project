import 'package:flutter/material.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: RColors.primary,
              padding: const EdgeInsets.all(0),
              child:  Stack(
                children: [
                  RCircularContainer(backgroundColor: RColors.textWhite.withOpacity(0.1),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


