import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/data/data_sources/language_local_data_source.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/repositories/app_repository.dart';

class AppRepositoryImpl extends AppRepository{

  final LanguageLocalDataSource languageLocalDataSource;

  AppRepositoryImpl(this.languageLocalDataSource);

  @override
  Future<Either<AppError, String>> getPreferredLanguage() async{
    try{
      final String response = await languageLocalDataSource.getPreferredLanguage();
      return Right(response);
    } on Exception{
      return const Left(AppError(AppErrorType.localDb));
    }
  }

  @override
  Future<Either<AppError, void>> updateLanguage(String languageCode) async{
    try{
      final response = await languageLocalDataSource.updateLanguage(languageCode);
      return Right(response);
    } on Exception{
      return const Left(AppError(AppErrorType.localDb));
    }
  }

  @override
  Future<Either<AppError, String>> getPreferredTheme() async{
    try {
      final response = await languageLocalDataSource.getPreferredTheme();
      return Right(response);
    } on Exception {
      return const Left(AppError(AppErrorType.localDb));
    }
  }

  @override
  Future<Either<AppError, void>> updateTheme(String themeName) async{
    try {
      final response = await languageLocalDataSource.updateTheme(themeName);
      return const Right(null);
    } on Exception {
      return const Left(AppError(AppErrorType.localDb));
    }
  }

}