import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';

Widget greenPlateLogo = Column(
  children: [
    Image.asset('lib/res/assets/images/logos/main_logo.png'),
    RichText(
        text: TextSpan(style: TextStyle(fontSize: 31, color: ThemeColors.primary), children: const <TextSpan>[
      TextSpan(text: 'GREEN '),
      TextSpan(
        text: ' PLATE',
        style: TextStyle(fontWeight: FontWeight.w800),
      )
    ]))
  ],
);
