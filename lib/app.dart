import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medi_ghor/features/authentication/screens/onboarding/onboarding.dart';

import 'utils/theme/theme.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: RAppTheme.lightTheme,
      darkTheme: RAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}