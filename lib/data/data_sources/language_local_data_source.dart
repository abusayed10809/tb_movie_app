import 'dart:async';

import 'package:hive/hive.dart';
import 'package:tb_movie_app/common/constants/hive_constants.dart';

abstract class LanguageLocalDataSource {
  Future<void> updateLanguage(String languageCode);
  Future<String> getPreferredLanguage();
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
}
