
import 'package:flutter/material.dart';
import 'news_app_colors.dart';
import 'text_styles.dart';

///add more theme data here as per your need also add separate class for dark theme
class NewsAppTheme {
  NewsAppTheme._();

  static ThemeData lightTheme = ThemeData(
      indicatorColor: Colors.blue[800],
    //cardColor: Colors.green[100],
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: NewsAppColors.customLightBlue,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.white),
        foregroundColor: Colors.black,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(headline4: AppTextStyles.homepageNewsTitle),
      scaffoldBackgroundColor: Colors.white,
      // drawerTheme: DrawerThemeData(
      //   scrimColor: Colors.transparent,
      //   backgroundColor: Colors.green[800],
      // ),
      tabBarTheme:  TabBarTheme(
        //indicator: ,

        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: NewsAppColors.accentColor,
        unselectedLabelStyle: AppTextStyles.unselectedLabelStyle,
      ),
      dialogBackgroundColor: Colors.blue[100],
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: AppTextStyles.hintTextStyle,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          )),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     backgroundColor: Colors.blueAccent,
      //     elevation: 2,
      //     selectedItemColor: Colors.green[50],
      //     selectedIconTheme: IconThemeData(color: Colors.green),
      //     unselectedIconTheme: IconThemeData(color: Colors.white)),
      bottomSheetTheme:
          BottomSheetThemeData(backgroundColor: Colors.blue[100]));

  static ThemeData darkTheme = ThemeData(
    indicatorColor: Colors.blue,
    cardColor: Colors.grey,
      backgroundColor: Colors.grey,
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
        color: NewsAppColors.colorBlack,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.white),
        foregroundColor: Colors.black54,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      dialogBackgroundColor: Colors.blueGrey[200],
      scaffoldBackgroundColor: Colors.black45,
      textTheme: const TextTheme(headline4: AppTextStyles.infoContentStyle4),
      drawerTheme: const DrawerThemeData(
        scrimColor: Colors.transparent,
        backgroundColor: Colors.black,
      ),
      tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelStyle: AppTextStyles.unselectedLabelStyle,
      ),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: AppTextStyles.hintTextStyle,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          )),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.blueGrey[200]));
}
