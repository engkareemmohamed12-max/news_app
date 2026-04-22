
import 'package:flutter/material.dart';
import 'package:news_app/Utils/app_color.dart';
import 'package:news_app/Utils/app_styles.dart';

class AppTheme {


  static final ThemeData lightTheme = ThemeData(

    primaryColor: AppColors.whiteColor,
    splashColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme: const AppBarThemeData(
      backgroundColor: AppColors.whiteColor,
      iconTheme: IconThemeData(color: AppColors.blackColor),
      centerTitle: true,
    ),

    textTheme: TextTheme(
      labelLarge:  AppStyle.bold16Black,
      labelSmall: AppStyle.medium12Gray,
      labelMedium: AppStyle.medium14Black,
      headlineMedium: AppStyle.medium24Black,
      headlineLarge: AppStyle.medium20Black
    ));


  static final ThemeData darkTheme = ThemeData(

      primaryColor: AppColors.blackColor,
      splashColor: AppColors.whiteColor,
      scaffoldBackgroundColor: AppColors.blackColor,
      appBarTheme: const AppBarThemeData(
        backgroundColor: AppColors.blackColor,
        iconTheme: IconThemeData(color: AppColors.whiteColor),
        centerTitle: true,
      ),

      textTheme: TextTheme(
          labelLarge:  AppStyle.bold16White,
          labelSmall: AppStyle.medium12Gray,
          labelMedium: AppStyle.medium14White,
          headlineMedium: AppStyle.medium24White,
          headlineLarge: AppStyle.medium20White
      ));

}