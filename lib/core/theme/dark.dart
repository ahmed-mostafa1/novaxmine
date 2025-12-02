import 'package:flutter/material.dart';
import 'package:mine_lab/core/utils/my_color.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/theme/deposit_app_colors.dart';
import 'package:mine_lab/views/screens/deposits/create_deposite/theme/deposit_custom_colors.dart';

ThemeData darkThemeData = ThemeData.dark().copyWith(
  primaryColor: MyColor.primaryColor,
  primaryColorDark: MyColor.primaryColor,
  secondaryHeaderColor: Colors.yellow,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: MyColor.dBackgroundColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: MyColor.primaryColor,
    brightness: Brightness.dark,
  ),
  appBarTheme: AppBarTheme(
      backgroundColor: MyColor.dBackgroundColor,
      foregroundColor: MyColor.dPrimaryTextColor),
  drawerTheme: const DrawerThemeData(
    backgroundColor: MyColor.dBackgroundColor,
    surfaceTintColor: MyColor.transparentColor,
  ),
  cardColor: MyColor.dCardColor,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 57,
        fontWeight: FontWeight.bold,
        color: MyColor.dPrimaryTextColor),
    displaySmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 45,
        fontWeight: FontWeight.normal,
        color: MyColor.dPrimaryTextColor),
    bodyLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: MyColor.dPrimaryTextColor),
    bodyMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: MyColor.dPrimaryTextColor),
    bodySmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: MyColor.dPrimaryTextColor),
    displayMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 41,
        fontWeight: FontWeight.normal,
        color: MyColor.dPrimaryTextColor),
    headlineLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: MyColor.dPrimaryTextColor),
    headlineMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: MyColor.dPrimaryTextColor),
    headlineSmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: MyColor.dPrimaryTextColor),
    labelMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: MyColor.dPrimaryTextColor),
    labelSmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: MyColor.dPrimaryTextColor),
    labelLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: MyColor.dPrimaryTextColor),
    titleLarge: TextStyle(
        fontFamily: 'Inter',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: MyColor.dPrimaryTextColor),
    titleMedium: TextStyle(
        fontFamily: 'Inter',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: MyColor.dSecondaryTextColor),
    titleSmall: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: MyColor.dSecondaryTextColor),
  ),

  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: MyColor.primaryColor,
    selectionColor: MyColor.primaryColor,
    selectionHandleColor: MyColor.primaryColor,
  ),
  bannerTheme: MaterialBannerThemeData(
    backgroundColor: MyColor.primaryColor.withValues(alpha: .1),
  ),
  //Bottom Navbar
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: MyColor.dBackgroundColor,
    // Selected item color
    selectedItemColor: MyColor.primaryColor,
    // Unselected item color
    unselectedItemColor: MyColor.dPrimaryTextColor,
  ),
  navigationBarTheme: const NavigationBarThemeData(
    backgroundColor: MyColor.dBackgroundColor,
  ),
  //Text Filed
  inputDecorationTheme: const InputDecorationTheme(),
  extensions: const <ThemeExtension<dynamic>>[
    DepositCustomColors(
      primaryTextColor: DepositAppColors.darkMainTextColor,
      secondaryTextColor: DepositAppColors.darkSecondaryTextColor,
      cardColor: DepositAppColors.darkCardColor,
      borderColor: DepositAppColors.darkBorderColor,
      primaryButtonBackground: DepositAppColors.darkPrimaryButtonBackground,
      primaryButtonTextColor: DepositAppColors.darkPrimaryButtonTextColor,
      secondaryButtonBackground: DepositAppColors.darkSecondaryButtonBackground,
      secondaryButtonTextColor: DepositAppColors.darkSecondaryButtonTextColor,
      chipBackgroundColor: DepositAppColors.darkChipBackgroundColor,
      chipTextColor: DepositAppColors.darkChipTextColor,
      copyButtonBackground: DepositAppColors.darkCopyButtonBackground,
      copyButtonBorderColor: DepositAppColors.darkCopyButtonBorderColor,
      copyButtonTextColor: DepositAppColors.darkCopyButtonTextColor,
      appBarBackground: DepositAppColors.darkAppBarBackground,
      appBarForeground: DepositAppColors.darkAppBarForeground,
      shadowColor: DepositAppColors.darkShadowColor,
    ),
  ],
);
