import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/common/helper_functions.dart';
import 'package:tb_movie_app/data/models/movie_model.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_entity.dart';
import 'package:tb_movie_app/domain/entities/no_params.dart';
import 'package:tb_movie_app/domain/repositories/movie_repository.dart';
import 'package:tb_movie_app/domain/usercases/usecase.dart';

class GetPopular extends UseCase<List<MovieEntity>, NoParams>{
  final MovieRepository repository;
  GetPopular(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async{
    return await repository.getPopular();
  }
}