import 'package:flutter/material.dart';
import 'package:testabd/core/theme/app_typography.dart';

import 'app_colors.dart';

abstract class AppTheme {
  // ==================================================
  // 🌙 DARK THEME
  // ==================================================
  static ThemeData themeDark = ThemeData(
    useMaterial3: false,
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppDarkColors.scaffoldBackground,

    // --------------------------------------------------
    // COLOR SCHEME
    // --------------------------------------------------
    colorScheme: const ColorScheme.dark(
      primary: AppDarkColors.secondary,
      secondary: AppDarkColors.instagramPink,
      background: AppDarkColors.scaffoldBackground,
      surface: AppDarkColors.surface,
      error: AppDarkColors.error,
      onPrimary: AppDarkColors.textPrimary,
      onSecondary: AppDarkColors.textPrimary,
      onBackground: AppDarkColors.textPrimary,
      onSurface: AppDarkColors.textPrimary,
      onError: AppDarkColors.textPrimary,
    ),

    // --------------------------------------------------
    // TYPOGRAPHY
    // --------------------------------------------------
    textTheme: AppTypography.textTheme,

    // --------------------------------------------------
    // APP BAR
    // --------------------------------------------------
    appBarTheme: const AppBarTheme(
      backgroundColor: AppDarkColors.primary,
      foregroundColor: AppDarkColors.textPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    // --------------------------------------------------
    // BUTTONS
    // --------------------------------------------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppDarkColors.secondary,
        foregroundColor: AppDarkColors.elevatedButtonText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 0,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppDarkColors.secondary),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppDarkColors.textPrimary,
        side: BorderSide(color: AppDarkColors.outlinedButtonBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),

    // --------------------------------------------------
    // INPUTS
    // --------------------------------------------------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppDarkColors.inputFill,
      // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(6),
      //   borderSide: BorderSide(color: AppDarkColors.outline),
      // ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(6),
      //   borderSide: BorderSide(color: Colors.transparent),
      // ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(6),
      //   borderSide: BorderSide(
      //     // color: AppDarkColors.inputFocusedBorder,
      //     color: Colors.transparent,
      //     width: 2,
      //   ),
      // ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide(
          color: AppDarkColors.primary, // ← Primary from scheme
          width: 2.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: AppDarkColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: AppDarkColors.error, width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
    ),

    // --------------------------------------------------
    // ICONS / DIVIDER / FAB
    // --------------------------------------------------
    iconTheme: const IconThemeData(color: AppDarkColors.icon),
    dividerTheme: const DividerThemeData(
      color: AppDarkColors.divider,
      thickness: 1,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppDarkColors.instagramPink,
      foregroundColor: Colors.white,
    ),
  );

  // ==================================================
  // 🌞 LIGHT THEME
  // ==================================================
  static ThemeData themeLight = ThemeData(
    useMaterial3: false,
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColorsLight.scaffoldBackground,

    // --------------------------------------------------
    // COLOR SCHEME
    // --------------------------------------------------
    colorScheme: const ColorScheme.light(
      primary: AppColorsLight.secondary,
      secondary: AppColorsLight.instagramPink,
      background: AppColorsLight.scaffoldBackground,
      surface: AppColorsLight.surface,
      error: AppColorsLight.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: AppColorsLight.textPrimary,
      onSurface: AppColorsLight.textPrimary,
      onError: Colors.white,
    ),

    // --------------------------------------------------
    // TYPOGRAPHY
    // --------------------------------------------------
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppColorsLight.textPrimary,
      displayColor: AppColorsLight.textPrimary,
    ),

    // --------------------------------------------------
    // APP BAR
    // --------------------------------------------------
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColorsLight.primary,
      foregroundColor: AppColorsLight.textPrimary,
      elevation: 0,
      centerTitle: true,
    ),

    // --------------------------------------------------
    // BUTTONS
    // --------------------------------------------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColorsLight.secondary,
        foregroundColor: AppColorsLight.elevatedButtonText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 0,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: AppColorsLight.secondary),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColorsLight.textPrimary,
        side: BorderSide(color: AppColorsLight.outlinedButtonBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),

    // --------------------------------------------------
    // INPUTS
    // --------------------------------------------------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColorsLight.inputFill,
      // contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(6),
      //   borderSide: BorderSide(color: AppDarkColors.outline),
      // ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(6),
      //   borderSide: BorderSide(color: Colors.transparent),
      // ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(6),
      //   borderSide: BorderSide(
      //     // color: AppDarkColors.inputFocusedBorder,
      //     color: Colors.transparent,
      //     width: 2,
      //   ),
      // ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide(
          color: AppColorsLight.primary, // ← Primary from scheme
          width: 2.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: AppColorsLight.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: AppColorsLight.error, width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
    ),

    // --------------------------------------------------
    // ICONS / DIVIDER / FAB
    // --------------------------------------------------
    iconTheme: const IconThemeData(color: AppColorsLight.icon),
    dividerTheme: const DividerThemeData(
      color: AppColorsLight.divider,
      thickness: 1,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColorsLight.instagramPink,
      foregroundColor: Colors.white,
    ),
  );
}
