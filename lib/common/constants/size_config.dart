import 'package:flutter/cupertino.dart';

class SizeConfig{
  static late double width;
  static late double height;
  static late double heightFull;
  static late double fontSize;
  static late double safeAreaPadding;
  static late double appbarHeight;

  // void init(BoxConstraints constraints){
  //   width = constraints.maxWidth;
  //   height = constraints.maxHeight;
  //   fontSize = constraints.maxHeight / 100;
  // }

  void init({required double widthI, required double heightI, required double appbarHeightI, required double safeAreaPaddingI, required double fontSizeI}){
    width = widthI;
    appbarHeight = appbarHeightI;
    safeAreaPadding = safeAreaPaddingI;
    height = heightI - appbarHeightI - safeAreaPaddingI;
    heightFull = heightI;
    fontSize = fontSizeI;
  }
}