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
    // brightness: Brightness.light,
    scaffoldBackgroundColor: TColors.backgroundLight,
    colorScheme: const ColorScheme.light(
        primary: TColors.primaryLight,
        secondary: TColors.secondaryLight,
        surface: TColors.surfaceLight,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: TColors.onSurfaceLight,
        error: TColors.error,
        onError: Colors.white,
        brightness: Brightness.light),
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    // brightness: Brightness.dark,
    scaffoldBackgroundColor: TColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
        primary: TColors.primaryDark,
        secondary: TColors.secondaryDark,
        surface: TColors.surfaceDark,
        error: TColors.error,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        onSurface: Colors.white,
        onError: Colors.black,
        brightness: Brightness.dark),
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
