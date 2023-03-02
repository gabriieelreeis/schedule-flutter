import 'package:flutter/material.dart';
import 'package:scheduleflutter/app/shared/theme/app_colors.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: primaryColor,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    secondary: accentColor,
  ),
  fontFamily: 'Poppins',
);
