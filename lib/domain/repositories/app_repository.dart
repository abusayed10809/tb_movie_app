import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';

abstract class AppRepository{
  Future<Either<AppError, void>> updateLanguage(String languageCode);
  Future<Either<AppError, String>> getPreferredLanguage();
  Future<Either<AppError, String>> getPreferredTheme();
  Future<Either<AppError, void>> updateTheme(String themeName);
}