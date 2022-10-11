import 'package:flutter/cupertino.dart';

class SizeConfig{
  static late double width;
  static late double height;
  static late double fontSize;

  void init(BoxConstraints constraints){
    width = constraints.maxWidth;
    height = constraints.maxHeight;
    fontSize = constraints.maxHeight / 100;
  }
}