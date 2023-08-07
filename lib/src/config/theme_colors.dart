import 'package:flutter/material.dart';

class ThemeColors {
  static Color primary = const Color.fromRGBO(94, 196, 1, 1);
  static Color secondary = const Color.fromRGBO(243, 122, 32, 1);
  static Color primaryFontColor = const Color.fromRGBO(55, 71, 79, 1);
  static Color whiteFontColor = Colors.white;
  static Color backGroundColor =
      Color.alphaBlend(const Color.fromRGBO(252, 252, 252, 0.6), const Color.fromRGBO(254, 254, 254, .55));
  static Color blackFontColor = Colors.black;
  static Color dividerColor = const Color.fromRGBO(240, 240, 240, 1);
  static Color blueIconColor = const Color.fromRGBO(35, 108, 217, 1);
  static Color textFieldBackGround = const Color.fromRGBO(240, 241, 242, 1);

  ThemeData lightThemeData() {
    primary = const Color.fromRGBO(94, 196, 1, 1);
    secondary = const Color.fromRGBO(243, 122, 32, 1);
    primaryFontColor = const Color.fromRGBO(55, 71, 79, 1);
    backGroundColor = const Color.fromRGBO(251, 252, 255, 1);
    dividerColor = const Color.fromRGBO(240, 240, 240, 1);

    return ThemeData(
      primaryColor: primary,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: MaterialColor(0xFF199BF1, primaryLightColor),
        brightness: Brightness.light,
        backgroundColor: backGroundColor,
      ),
      fontFamily: 'Poppins',
      useMaterial3: true,
      textTheme: TextTheme(
        displayLarge: TextStyle(color: ThemeColors.primaryFontColor),
        displayMedium: TextStyle(color: ThemeColors.primaryFontColor),
        displaySmall: TextStyle(color: ThemeColors.primaryFontColor),
        bodyLarge: TextStyle(color: ThemeColors.primaryFontColor),
        bodyMedium: TextStyle(color: ThemeColors.primaryFontColor),
        bodySmall: TextStyle(color: ThemeColors.primaryFontColor),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: backGroundColor,
        titleTextStyle: TextStyle(color: ThemeColors.primaryFontColor, fontSize: 20, fontWeight: FontWeight.w600),
        iconTheme: IconThemeData(color: ThemeColors.primaryFontColor),
      ),
      iconTheme: IconThemeData(color: primaryFontColor),
      dividerColor: dividerColor,
    );
  }
}

Map<int, Color> primaryLightColor = const {
  100: Color.fromRGBO(129, 254, 11, 1),
  200: Color.fromRGBO(118, 244, 1, 1),
  300: Color.fromRGBO(108, 223, 1, 1),
  400: Color.fromRGBO(94, 198, 1, 1),
  500: Color.fromRGBO(89, 183, 1, 1),
  600: Color.fromRGBO(79, 162, 1, 1),
  700: Color.fromRGBO(69, 142, 1, 1),
  800: Color.fromRGBO(59, 122, 1, 1),
  900: Color.fromRGBO(49, 101, 1, 1),
};

Map<String, FontWeight> pesosDeFonte = const {
  'regular': FontWeight.normal,
  'medium': FontWeight.w500,
  'bold': FontWeight.w700,
  'semi-bold': FontWeight.w600
};
