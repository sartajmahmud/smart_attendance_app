import 'package:flutter/material.dart';

import 'colors.dart';

String gilroyFontFamily = "Gilroy";

ThemeData themeData = ThemeData(
  accentColor: AppColors.primaryColor,
  fontFamily: gilroyFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final ButtonBoxDecorationStyle = BoxDecoration(
  //color: Color(0xFFbf1e2e),
  borderRadius: BorderRadius.circular(30.0),
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFbf1e2e),
      Color(0xFFff887c),
    ],
  ),
);