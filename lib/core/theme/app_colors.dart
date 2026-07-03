import 'package:flutter/material.dart';
import 'package:rcl_app/core/constants/color_constants.dart';

class AppColors {
  AppColors._();

  static ColorScheme get lightColorScheme => ColorScheme.light(
    primary: ColorConstants.primary,
    onPrimary: Colors.white,
    primaryContainer: ColorConstants.primaryLight,
    secondary: ColorConstants.secondary,
    onSecondary: Colors.white,
    secondaryContainer: ColorConstants.secondaryLight,
    error: ColorConstants.error,
    onError: Colors.white,
    surface: ColorConstants.surface,
    onSurface: ColorConstants.textPrimary,
    outline: ColorConstants.border,
  );

  static ColorScheme get darkColorScheme => ColorScheme.dark(
    primary: ColorConstants.primaryLight,
    onPrimary: Colors.white,
    primaryContainer: ColorConstants.primaryDark,
    secondary: ColorConstants.secondaryLight,
    onSecondary: Colors.white,
    secondaryContainer: ColorConstants.secondaryDark,
    error: ColorConstants.error,
    onError: Colors.white,
    surface: ColorConstants.surfaceDark,
    onSurface: Colors.white,
    outline: Colors.grey[700]!,
  );
}
