import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';

class AppText{
  const AppText._();
  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();
  static TextStyle get _whiteHeadLine6 => _poppinsTextTheme.headline6!.copyWith(
    fontSize: 20.sp,
    color: AppColor.whiteColor,
  );
  static getTextTheme() => TextTheme(
    headline6: _whiteHeadLine6,
  );
}