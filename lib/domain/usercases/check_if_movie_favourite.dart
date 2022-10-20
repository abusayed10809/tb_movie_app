import 'package:dartz/dartz.dart';
import 'package:tb_movie_app/domain/entities/app_error.dart';
import 'package:tb_movie_app/domain/entities/movie_params.dart';
import 'package:tb_movie_app/domain/repositories/movie_repository.dart';
import 'package:tb_movie_app/domain/usercases/usecase.dart';

class CheckIfMovieFavourite extends UseCase<bool, MovieParams>{
  final MovieRepository movieRepository;

  CheckIfMovieFavourite(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams params) async{
    return await movieRepository.checkIfMovieFavourite(params.id);
  }
}