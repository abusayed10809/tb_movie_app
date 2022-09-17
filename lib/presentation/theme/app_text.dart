import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';

class AppText{
  const AppText._();
  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteSubtitle1 => _poppinsTextTheme.subtitle1!.copyWith(
    fontSize: 16.sp,
    color: AppColor.whiteColor,
  );

  static TextStyle get _whiteSubtitle2 => _poppinsTextTheme.subtitle2!.copyWith(
    fontSize: 14.sp,
    color: AppColor.whiteColor,
  );

  static TextStyle get _whiteBodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
    fontSize: 14.sp,
    color: AppColor.whiteColor,
    wordSpacing: 0.25,
    letterSpacing: 0.25,
    height: 1.5,
  );

  static getTextTheme() => TextTheme(
    subtitle1: _whiteSubtitle1,
    subtitle2: _whiteSubtitle2,
    bodyText2: _whiteBodyText2,
  );
}

extension ThemeTextExtension on TextTheme{
  TextStyle get royalBlueSubtitle2 => subtitle2!.copyWith(
    color: AppColor.royalBlueColor,
    fontWeight: FontWeight.w600,
  );
}