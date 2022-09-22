import 'package:flutter/material.dart';
import 'package:tb_movie_app/presentation/app_localizations.dart';

extension StringLimiterExtension on String{
  String intelliTrim15(){
    return length > 15 ? '${substring(0, 15)}...' : this;
  }

  String langTranslate(BuildContext context){
    return AppLocalizations.of(context)!.translate(this)!;
  }
}