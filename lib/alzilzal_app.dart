import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'Core/constatnts/app_functions.dart';
import 'Core/constatnts/app_strings.dart';
import 'Core/themes/theme_provider.dart';
import 'config/route_path.dart';
import 'config/router.dart';
import 'config/themes/themes.dart';
import 'generated/l10n.dart';

class AlzilzalApp extends StatelessWidget {
  const AlzilzalApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(builder: (
        context,
        themeProvider,
        child,
      ) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) => SafeArea(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppFunctions.isArabic()
                  ? AppStrings.appNameAr
                  : AppStrings.appNameEn,
              locale: Locale(themeProvider.getIsArabic),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              // theme: Themes.themeData(
              //   isDarkTheme: themeProvider.getIsDarkTheme,
              //   context: context,
              // ),
              theme: Style.lightTheme,
              darkTheme: Style.darkTheme,
              themeMode: themeProvider.getIsDarkTheme
                  ? ThemeMode.dark
                  : ThemeMode.light,
              onGenerateRoute: AppRouter().generateRoute,
              initialRoute: RoutePath.splashScreen,
              // home: const SplashScreen(),
              // const UserLayoutScreen(),
              // const SplashScreen(),
              // const ReceivingLayoutScreen(),
              // const SortStaffLayoutScreen(),
              // const SendingRepLayoutScreen(),
              // const LoginScreen(),
              // const TestApi(),
            ),
          ),
        );
      }),
    );
  }
}
