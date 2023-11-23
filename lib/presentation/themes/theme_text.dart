import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/common/constants/size_constants.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _popinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadlines6 => _popinsTextTheme.titleLarge!.copyWith(
        fontSize: Sizes.dimen_20,
        color: Colors.white,
      );

  static getTextTheme() => TextTheme(titleLarge: _whiteHeadlines6);
}
