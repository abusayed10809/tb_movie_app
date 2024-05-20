import 'dart:async';

import 'package:hive/hive.dart';
import 'package:tb_movie_app/common/constants/hive_constants.dart';
import 'package:tb_movie_app/common/constants/theme_constants.dart';

abstract class LanguageLocalDataSource {
  Future<void> updateLanguage(String languageCode);
  Future<String> getPreferredLanguage();
  Future<void> updateTheme(String themeName);
  Future<String> getPreferredTheme();
}

class LanguageLocalDataSourceImpl extends LanguageLocalDataSource {
  @override
  Future<String> getPreferredLanguage() async{
    final languageBox = await Hive.openBox(HiveConstants.languageBox);
    return languageBox.get(HiveConstants.preferredLanguageKey);
  }

  @override
  Future<void> updateLanguage(String languageCode) async {
    final languageBox = await Hive.openBox(HiveConstants.languageBox);
    unawaited(languageBox.put(HiveConstants.preferredLanguageKey, languageCode));
  }

  @override
  Future<String> getPreferredTheme() async{
    final themeBox = await Hive.openBox(HiveConstants.themeBox);
    return themeBox.get(HiveConstants.preferredThemeKey) ?? ThemeConstants.darkTheme;
  }

  @override
  Future<void> updateTheme(String themeName) async{
    final themeBox = await Hive.openBox(HiveConstants.themeBox);
    unawaited(themeBox.put(HiveConstants.preferredThemeKey, themeName));
  }
}
