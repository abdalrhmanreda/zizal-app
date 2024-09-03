import 'package:alzilzal/Core/constatnts/app_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/themes/colors/app_colors.dart';

class Style {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.kBackgroundColor,
    useMaterial3: false,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.kPrimaryColor,
          onPrimary: AppColors.kPrimaryColor,
          onSurface: AppColors.kPrimaryColor,
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kBackgroundColor,
      iconTheme: const IconThemeData(
        color: AppColors.kBlackColor,
      ),
      elevation: 0,
      titleTextStyle: GoogleFonts.cairo(
        color: AppColors.kBlackColor,
        fontSize: 16.sp,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kBlackColor,
            ),
      bodyMedium: GoogleFonts.cairo(
        color: AppColors.kBlackColor,
      ),
      bodySmall: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kBlackColor,
            ),
      titleLarge: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kBlackColor,
            ),
      titleMedium: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kBlackColor,
            ),
      titleSmall: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kBlackColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kBlackColor,
            ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.kPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.kWhiteColor,
      selectedItemColor: AppColors.kPrimaryColor,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          AppFunctions.isArabic()
              ? GoogleFonts.cairo(
                  color: AppColors.kPrimaryColor,
                )
              : GoogleFonts.cairo(
                  color: AppColors.kPrimaryColor,
                ),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      headerBackgroundColor: AppColors.kPrimaryColor,
      todayBackgroundColor: MaterialStateProperty.all(
        AppColors.kPrimaryColor,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: AppColors.kPrimaryColor,
          onPrimary: AppColors.kPrimaryColor,
          onSurface: AppColors.kWhiteColor,
        ),
    useMaterial3: false,
    scaffoldBackgroundColor: (AppColors.kBlackColor),
    appBarTheme: AppBarTheme(
      backgroundColor: (AppColors.kBlackColor),
      elevation: 0,
      titleTextStyle: GoogleFonts.cairo(
        color: AppColors.kWhiteColor,
        fontSize: 18.sp,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.kWhiteColor,
    ),
    textTheme: TextTheme(
      bodyLarge: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            ),
      bodyMedium: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            ),
      bodySmall: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            ),
      titleLarge: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            ),
      titleMedium: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            ),
      titleSmall: AppFunctions.isArabic()
          ? GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            )
          : GoogleFonts.cairo(
              color: AppColors.kWhiteColor,
            ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.kPrimaryColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: AppColors.kPrimaryColor,
      unselectedItemColor: AppColors.kWhiteColor,
      type: BottomNavigationBarType.fixed,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.kDarkThemColor,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.kWhiteColor,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          GoogleFonts.cairo(
            color: AppColors.kWhiteColor,
          ),
        ),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.kDarkPrimaryColor,
      headerHeadlineStyle: GoogleFonts.aBeeZee(color: Colors.white),
      headerHelpStyle: GoogleFonts.aBeeZee(color: Colors.white),
      dayStyle: GoogleFonts.aBeeZee(color: Colors.white),
      rangePickerHeaderHeadlineStyle: GoogleFonts.aBeeZee(color: Colors.white),
      rangePickerHeaderHelpStyle: GoogleFonts.aBeeZee(color: Colors.white),
      yearStyle: GoogleFonts.aBeeZee(color: Colors.white),
      weekdayStyle: GoogleFonts.aBeeZee(color: Colors.white),
      surfaceTintColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.aBeeZee(color: Colors.white),
        hintStyle: GoogleFonts.aBeeZee(color: Colors.white),
      ),
    ),
    timePickerTheme:
        const TimePickerThemeData(backgroundColor: AppColors.kDarkThemColor),
  );
}
