import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

AppColors colors(context) => Theme.of(context).extension<AppColors>()!;

ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
  return ThemeData(
      extensions: <ThemeExtension<AppColors>>[
        AppColors(
            shadowColor:
                isDarkTheme ? const Color(0xff181A21) : Color(0xff242C3B),
            background:
                isDarkTheme ? const Color(0xff181A21) : Color(0xff353F54),
            primary: Color(0xFF34C8E8),
            text: isDarkTheme ? Colors.white : Colors.white,
            description: isDarkTheme ? Colors.white : Colors.white,
            cardgrey: isDarkTheme ? Colors.black : const Color(0xffF1F1F1),
            black: Colors.black,
            grey:
                isDarkTheme ? const Color(0xff181A21) : const Color(0xffF1F1F1),
            disable: isDarkTheme ? Colors.white : const Color(0xff9E9E9E),
            primaryStroke: isDarkTheme ? Colors.white : const Color(0xffDEDEDE),
            secondary: const Color(0xff009046),
            divider: const Color(0xffEAEAEA),
            white: isDarkTheme ? const Color(0xff292A30) : Colors.white,
            pendingColor: const Color(0xffFF8A00)),
      ],
      scaffoldBackgroundColor:
          isDarkTheme ? const Color(0xff181A21) : Color(0xFFFFFFFF),
      textTheme: GoogleFonts.montserratTextTheme(),
      appBarTheme: AppBarTheme(
          backgroundColor:
              isDarkTheme ? const Color(0xff181A21) : const Color(0xfff5f5f5),
          iconTheme: IconThemeData(
              color: isDarkTheme ? Colors.white : Colors.black54)),
      primarySwatch: MaterialColor(0xffE21E26, color),
      primaryColor: Colors.black,
      fontFamily: 'Inter',
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      ));
}
