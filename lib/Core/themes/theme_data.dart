import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constatnts/colors.dart';

class Themes {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? MyColors.backGroundColor : MyColors.whiteColor,
      useMaterial3: false,
      focusColor: MyColors.buttonsColor,
      textTheme: TextTheme(
        displayMedium: AppFunctions.isArabic()
            ? GoogleFonts.elMessiri(
                color: isDarkTheme ? Colors.black : MyColors.whiteColor,
                fontSize: 30,
              )
            : GoogleFonts.aBeeZee(
                color: isDarkTheme ? Colors.black : MyColors.whiteColor,
                fontSize: 30,
              ),
        bodyMedium: AppFunctions.isArabic()
            ? GoogleFonts.elMessiri(
                color: isDarkTheme ? Colors.black : MyColors.whiteColor,
                fontSize: 30,
              )
            : GoogleFonts.aBeeZee(
                color: isDarkTheme ? MyColors.whiteColor : Colors.black,
                fontSize: 16,
              ),
        titleLarge: AppFunctions.isArabic()
            ? GoogleFonts.elMessiri(
                color: isDarkTheme ? Colors.black : MyColors.whiteColor,
                fontSize: 30,
              )
            : GoogleFonts.aBeeZee(
                color: isDarkTheme ? MyColors.whiteColor : Colors.black,
                fontSize: 24,
              ),
        titleMedium: AppFunctions.isArabic()
            ? GoogleFonts.elMessiri(
                color: isDarkTheme ? Colors.black : MyColors.whiteColor,
                fontSize: 30,
              )
            : GoogleFonts.aBeeZee(
                color: isDarkTheme ? MyColors.whiteColor : Colors.black,
                fontSize: 20,
              ),
        bodySmall: AppFunctions.isArabic()
            ? GoogleFonts.elMessiri(
                color: isDarkTheme ? Colors.black : MyColors.whiteColor,
                fontSize: 30,
              )
            : GoogleFonts.aBeeZee(
                color: MyColors.whiteColor,
                fontSize: 14,
              ),
        labelLarge: AppFunctions.isArabic()
            ? GoogleFonts.elMessiri(
                color: isDarkTheme ? Colors.black : MyColors.whiteColor,
                fontSize: 30,
              )
            : GoogleFonts.aBeeZee(
                color: isDarkTheme ? MyColors.whiteColor : Colors.black,
                fontSize: 32,
              ),
        bodyLarge: AppFunctions.isArabic()
            ? GoogleFonts.elMessiri(
                color: isDarkTheme ? Colors.black : MyColors.whiteColor,
                fontSize: 30,
              )
            : GoogleFonts.aBeeZee(
                color: isDarkTheme ? MyColors.whiteColor : Colors.black,
                fontSize: 20,
              ),
      ),
      // cardColor:
      //     isDarkTheme ? AppColors.dartCardColor : AppColors.lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      iconTheme: IconThemeData(
        color: isDarkTheme ? MyColors.grayColor : Colors.black,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: MyColors.buttonsColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 10,
        selectedIconTheme: IconThemeData(
          color: MyColors.buttonsColor,
        ),
        unselectedIconTheme: IconThemeData(
          color: MyColors.grayColor,
        ),
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
        backgroundColor:
            isDarkTheme ? MyColors.backGroundColor : MyColors.whiteColor,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: isDarkTheme ? Colors.white : Colors.black,
        ),
      ),
      // inputDecorationTheme: InputDecorationTheme(
      //   filled: true,
      //   contentPadding: const EdgeInsets.all(10),
      //   enabledBorder: OutlineInputBorder(
      //     borderSide: const BorderSide(
      //       width: 1,
      //       color: Colors.transparent,
      //     ),
      //     borderRadius: BorderRadius.circular(8),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderSide: BorderSide(
      //       width: 1,
      //       color: isDarkTheme ? Colors.white : Colors.black,
      //     ),
      //     borderRadius: BorderRadius.circular(8),
      //   ),
      //   errorBorder: OutlineInputBorder(
      //     borderSide: BorderSide(
      //       width: 1,
      //       color: Theme.of(context).colorScheme.error,
      //     ),
      //     borderRadius: BorderRadius.circular(8),
      //   ),
      //   focusedErrorBorder: OutlineInputBorder(
      //     borderSide: BorderSide(
      //       width: 1,
      //       color: Theme.of(context).colorScheme.error,
      //     ),
      //     borderRadius: BorderRadius.circular(8),
      //   ),
      // ),
    );
  }
}
