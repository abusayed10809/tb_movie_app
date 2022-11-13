import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tb_movie_app/presentation/theme/app_color.dart';

class AppText {
  const AppText._();
  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6!.copyWith(
        fontSize: 20.sp,
        color: AppColor.whiteColor,
      );

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

  static TextStyle get _whiteButton => _poppinsTextTheme.button!.copyWith(
        fontSize: 14.sp,
        color: AppColor.whiteColor,
      );

  static TextStyle get _whiteCaption => _poppinsTextTheme.caption!.copyWith(
    fontSize: 14.sp,
    color: AppColor.whiteColor,
    wordSpacing: 0.25,
    letterSpacing: 0.25,
    height: 1.5,
  );

  static getTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
        subtitle1: _whiteSubtitle1,
        subtitle2: _whiteSubtitle2,
        bodyText2: _whiteBodyText2,
        button: _whiteButton,
        caption: _whiteCaption,
      );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle2 => subtitle2!.copyWith(
        color: AppColor.royalBlueColor,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greySubtitle1 => subtitle1!.copyWith(
        color: Colors.grey,
      );

  TextStyle get orangeSubtitle1 => subtitle1!.copyWith(
    color: Colors.orange,
  );

  TextStyle get violetHeadline6 => headline6!.copyWith(
        color: AppColor.violetColor,
      );

  TextStyle get vulcanBodyText2 => bodyText2!.copyWith(
    color: AppColor.vulcanColor,
    fontWeight: FontWeight.bold,
  );

  TextStyle get greyCaption => caption!.copyWith(
    color: Colors.grey,
  );
}
