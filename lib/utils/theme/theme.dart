import 'package:e_commerce/utils/constants/colors.dart';

import 'custom_themes/text_field_theme.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: TColors.primaryLight,
    scaffoldBackgroundColor: TColors.backgroundLight,
    colorScheme: const ColorScheme.light(
      primary: TColors.primaryLight,
      secondary: TColors.secondaryLight,
      surface: TColors.surfaceLight,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: TColors.textLight,
      error: TColors.error,
      onError: TColors.textDark
    ),
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: TColors.primaryDark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(
      primary: TColors.primaryDark,
      secondary: TColors.secondaryDark,
      surface: TColors.surfaceDark,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: TColors.textDark,
    ),
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
