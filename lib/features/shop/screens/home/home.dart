import 'package:flutter/material.dart';
import 'package:medi_ghor/common/widgets/app_bar/appbar.dart';
import 'package:medi_ghor/common/widgets/custom_shapes/curvedEdges/curved_edges.dart';

import '../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/curvedEdges/curved_edges_widget.dart';
import '../../../../utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RPrimaryHeaderContainer(
              child: Column(
                children: [
                  //RAppbar(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


