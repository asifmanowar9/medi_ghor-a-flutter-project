import 'package:flutter/material.dart';
import 'package:medi_ghor/utils/theme/custom_theme/elevated_button_theme.dart';
import 'package:medi_ghor/utils/theme/custom_theme/text_theme.dart';
import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
//import 'custom_theme/checkbox_theme.dart';
import 'custom_theme/chip_theme.dart';
//import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outlined_button_theme.dart';
import 'custom_theme/text_field_theme.dart';


class RAppTheme{
  RAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: RTextTheme.lightTextTheme,
    chipTheme: RChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: RAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: RBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: RElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: ROutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: RTextFromFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: RTextTheme.darkTextTheme,
    chipTheme: RChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: RAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: RBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: RElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: ROutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: RTextFromFieldTheme.darkInputDecorationTheme,
  );
}