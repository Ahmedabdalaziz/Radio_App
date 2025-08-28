import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helper/color.dart';
import 'fonts_theme.dart' show AppTypography;

InputDecorationTheme buildInputDecoration({
  required Color fill,
  required Color focusColor,
  required Color errorColor,
  required TextStyle? labelStyle,
  required TextStyle? hintStyle,
}) {
  return InputDecorationTheme(
    filled: true,
    fillColor: fill,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: focusColor, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: errorColor, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: errorColor, width: 1.0),
    ),
    labelStyle: labelStyle,
    hintStyle: hintStyle,
  );
}

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.inter().fontFamily,
  brightness: Brightness.light,

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
    background: AppColors.backgroundLight,
    surface: AppColors.surfaceLight,
    error: AppColors.error,
  ),

  textTheme: GoogleFonts.interTextTheme(AppTypography.lightTextTheme),

  inputDecorationTheme: buildInputDecoration(
    fill: AppColors.surfaceLight,
    focusColor: AppColors.primary,
    errorColor: AppColors.red,
    labelStyle: AppTypography.lightTextTheme.bodyMedium,
    hintStyle: AppTypography.lightTextTheme.labelLarge?.copyWith(
      color: AppColors.hintLight,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.backgroundLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      textStyle: AppTypography.lightTextTheme.bodyLarge?.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    ),
  ),

  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.surfaceLight,
    indicatorColor: AppColors.primary.withOpacity(0.2),
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TextStyle(color: AppColors.primary, fontSize: 12.sp);
      }
      return TextStyle(color: AppColors.textLight, fontSize: 12.sp);
    }),
    iconTheme: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const IconThemeData(color: AppColors.primary);
      }
      return const IconThemeData(color: AppColors.textLight);
    }),
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: GoogleFonts.inter().fontFamily,
  brightness: Brightness.dark,

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.dark,
    background: AppColors.backgroundDark,
    surface: AppColors.surfaceDark,
    error: AppColors.error,
  ),

  textTheme: GoogleFonts.interTextTheme(AppTypography.darkTextTheme),

  inputDecorationTheme: buildInputDecoration(
    fill: AppColors.surfaceDark,
    focusColor: AppColors.primary,
    errorColor: AppColors.red,
    labelStyle: AppTypography.darkTextTheme.bodyMedium,
    hintStyle: AppTypography.darkTextTheme.labelLarge?.copyWith(
      color: AppColors.hintDark,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.backgroundLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.r)),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      textStyle: AppTypography.darkTextTheme.bodyLarge?.copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
      elevation: 0,
    ),
  ),

  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.surfaceDark,
    indicatorColor: AppColors.primary.withOpacity(0.2),
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TextStyle(color: AppColors.primary, fontSize: 12.sp);
      }
      return TextStyle(color: AppColors.textDark, fontSize: 12.sp);
    }),
    iconTheme: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const IconThemeData(color: AppColors.primary);
      }
      return const IconThemeData(color: AppColors.textDark);
    }),
  ),
);
