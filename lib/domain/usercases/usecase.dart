import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';

abstract class UseCase<Type, Params>{
  Future<Either<AppError, Type>> call(Params params);
}